#include "../Parser/parser.h"

namespace solverbin {
  REnode* Parer::Parse(REnode* r,  std::string &RegexString) {
  while (!RegexString.empty()) {
    switch (RegexString[0]) {
      default: {
        REnode* REnodeRune = Re.initREnode(Kind::REGEXP_RUNE, {RegexString[0], RegexString[0]});
        r->Children.emplace_back(REnodeRune);
        RegexString.erase(0, 1);
        break;
      }

      case '(':{
        REnode* REnodeCONCAT = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
        RegexString.erase(0, 1);
        Parse(REnodeCONCAT, RegexString);
        if (REnodeCONCAT->Children.size() > 1)
          r->Children.emplace_back(REnodeCONCAT);
        else
          r->Children.emplace_back(REnodeCONCAT->Children[0]);
        break;
      }

      case '|':{
        REnode* REnodeUNION = Re.initREnode(Kind::REGEXP_UNION, {0, 0});
        if (r->Children.size() > 1){
          REnodeUNION->Children.emplace_back(r);
          r = REnodeUNION;
        }
        else{
          r->kind = Kind::REGEXP_UNION;
        }
        RegexString.erase(0, 1);
        break;
      }
        

      case ')':
        return r;

      case '^':  {// Beginning of line.
        //todo
        RegexString.erase(0, 1);
        break;
      }
       

      case '$':  {
        //todo
        RegexString.erase(0, 1);
        break;
      }// End of line.
        

      case '.':  {
        REnode* REDot = Re.initREnode(Kind::REGEXP_UNION, {0, 0});
        REnode* REnodeRClass1 = Re.initREnode(Kind::REGEXP_CHARCLASS, {0, 9});
        REDot->Children.emplace_back(REnodeRClass1);
        RuneSequence RS;
        Re.ConvertToUTF_8(0xb, 0xffff , RS);
        if (RS.size() > 1){
          for (long unsigned int i = 0; i < RS.size(); i++){
            REDot->Children.emplace_back(RS[i]);
          }
        }
        else{
          REDot->Children.emplace_back(RS[0]);;
        }
        r->Children.emplace_back(REDot);
        RegexString.erase(0, 1);
        break;
      }// Any character (possibly except newline).

      case '[': {  // Character class.
        REnode* REnodeRClass = Re.initREnode(Kind::REGEXP_CHARCLASS, {0, 0});
        
        break;
      }

      case '*': {  // Zero or more.
        RegexpOp op;
        op = kRegexpStar;
        goto Rep;
      case '+':  // One or more.
        op = kRegexpPlus;
        goto Rep;
      case '?':  // Zero or one.
        op = kRegexpQuest;
        goto Rep;
      Rep:
        StringPiece opstr = t;
        bool nongreedy = false;
        t.remove_prefix(1);  // '*' or '+' or '?'
        if (ps.flags() & PerlX) {
          if (!t.empty() && t[0] == '?') {
            nongreedy = true;
            t.remove_prefix(1);  // '?'
          }
          if (!lastunary.empty()) {
            // In Perl it is not allowed to stack repetition operators:
            //   a** is a syntax error, not a double-star.
            // (and a++ means something else entirely, which we don't support!)
            status->set_code(kRegexpRepeatOp);
            status->set_error_arg(StringPiece(
                lastunary.data(),
                static_cast<size_t>(t.data() - lastunary.data())));
            return NULL;
          }
        }
        opstr = StringPiece(opstr.data(),
                            static_cast<size_t>(t.data() - opstr.data()));
        if (!ps.PushRepeatOp(op, opstr, nongreedy))
          return NULL;
        isunary = opstr;
        break;
      }

      case '{': {  // Counted repetition.
        int lo, hi;
        StringPiece opstr = t;
        if (!MaybeParseRepetition(&t, &lo, &hi)) {
          // Treat like a literal.
          if (!ps.PushLiteral('{'))
            return NULL;
          t.remove_prefix(1);  // '{'
          break;
        }
        bool nongreedy = false;
        if (ps.flags() & PerlX) {
          if (!t.empty() && t[0] == '?') {
            nongreedy = true;
            t.remove_prefix(1);  // '?'
          }
          if (!lastunary.empty()) {
            // Not allowed to stack repetition operators.
            status->set_code(kRegexpRepeatOp);
            status->set_error_arg(StringPiece(
                lastunary.data(),
                static_cast<size_t>(t.data() - lastunary.data())));
            return NULL;
          }
        }
        opstr = StringPiece(opstr.data(),
                            static_cast<size_t>(t.data() - opstr.data()));
        if (!ps.PushRepetition(lo, hi, opstr, nongreedy))
          return NULL;
        isunary = opstr;
        break;
      }

      case '\\': {  // Escaped character or Perl sequence.
        // \b and \B: word boundary or not
        if ((ps.flags() & Regexp::PerlB) &&
            t.size() >= 2 && (t[1] == 'b' || t[1] == 'B')) {
          if (!ps.PushWordBoundary(t[1] == 'b'))
            return NULL;
          t.remove_prefix(2);  // '\\', 'b'
          break;
        }

        if ((ps.flags() & Regexp::PerlX) && t.size() >= 2) {
          if (t[1] == 'A') {
            if (!ps.PushSimpleOp(kRegexpBeginText))
              return NULL;
            t.remove_prefix(2);  // '\\', 'A'
            break;
          }
          if (t[1] == 'z') {
            if (!ps.PushSimpleOp(kRegexpEndText))
              return NULL;
            t.remove_prefix(2);  // '\\', 'z'
            break;
          }
          // Do not recognize \Z, because this library can't
          // implement the exact Perl/PCRE semantics.
          // (This library treats "(?-m)$" as \z, even though
          // in Perl and PCRE it is equivalent to \Z.)

          if (t[1] == 'C') {  // \C: any byte [sic]
            if (!ps.PushSimpleOp(kRegexpAnyByte))
              return NULL;
            t.remove_prefix(2);  // '\\', 'C'
            break;
          }

          if (t[1] == 'Q') {  // \Q ... \E: the ... is always literals
            t.remove_prefix(2);  // '\\', 'Q'
            while (!t.empty()) {
              if (t.size() >= 2 && t[0] == '\\' && t[1] == 'E') {
                t.remove_prefix(2);  // '\\', 'E'
                break;
              }
              Rune r;
              if (StringPieceToRune(&r, &t, status) < 0)
                return NULL;
              if (!ps.PushLiteral(r))
                return NULL;
            }
            break;
          }
        }

        if (t.size() >= 2 && (t[1] == 'p' || t[1] == 'P')) {
          Regexp* re = new Regexp(kRegexpCharClass, ps.flags() & ~FoldCase);
          re->ccb_ = new CharClassBuilder;
          switch (ParseUnicodeGroup(&t, ps.flags(), re->ccb_, status)) {
            case kParseOk:
              if (!ps.PushRegexp(re))
                return NULL;
              goto Break2;
            case kParseError:
              re->Decref();
              return NULL;
            case kParseNothing:
              re->Decref();
              break;
          }
        }

        const UGroup *g = MaybeParsePerlCCEscape(&t, ps.flags());
        if (g != NULL) {
          Regexp* re = new Regexp(kRegexpCharClass, ps.flags() & ~FoldCase);
          re->ccb_ = new CharClassBuilder;
          AddUGroup(re->ccb_, g, g->sign, ps.flags());
          if (!ps.PushRegexp(re))
            return NULL;
          break;
        }

        Rune r;
        if (!ParseEscape(&t, &r, status, ps.rune_max()))
          return NULL;
        if (!ps.PushLiteral(r))
          return NULL;
        break;
      }
    }
  Break2:
    lastunary = isunary;
  }
  return ps.DoFinish();
}
}