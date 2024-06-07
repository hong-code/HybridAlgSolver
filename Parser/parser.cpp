#include "parser.h"
#include "../Solver/solver.h"
#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <ostream>
#include <string.h>


namespace solverbin {


  signed int Parer::getcharacter(std::string &RegexString){
    switch (RegexString[0])
    {
      case '\\': {
        RegexString.erase(0,1);
        if (RegexString[0] == 'u'){
          RegexString.erase(0,1);
          signed int ret = stoi(RegexString.substr(0, 4), 0, 16);
          RegexString.erase(0,4);
          return ret;
        }
        else if (RegexString[0] == 'x'){
          RegexString.erase(0,1);
          std::string NumString;
          if (RegexString[0] != '{'){
            NumString = RegexString.substr(0, 2);
            RegexString.erase(0, 2);
          }
          else{
            RegexString.erase(0, 1);
            while (RegexString[0] != '}'){
              NumString.push_back(RegexString[0]);
              RegexString.erase(0, 1);
            }
            RegexString.erase(0, 1);
          }
          signed int ret = stoi(NumString, 0, 16);
          return ret;
          break;
        }
        else{
          signed int ret = RegexString[0];
          RegexString.erase(0,1);
          return ret;
        }
        break;
      }

      // case 'u': {
      //   RegexString.erase(0,1);
      //   signed int ret = stoi(RegexString.substr(0, 4), 0, 16);
      //   RegexString.erase(0,4);
      //   return ret;
      //   break;
      // }

      // case 'x': {
      //   RegexString.erase(0,2);
      //   std::string NumString;
      //   while (RegexString[0] != '}'){
      //     NumString.push_back(RegexString[0]);
      //     RegexString.erase(0, 1);
      //   }
      //   RegexString.erase(0, 1);
      //   signed int ret = stoi(NumString, 0, 16);
      //   return ret;
      //   break;
      // }
    
      default:{
        signed int ret = RegexString[0];
        RegexString.erase(0,1);
        return ret;
      }
    }
  }

  void Parer::InsertRune(std::vector<RuneClass> &RuneSet, RuneClass RC){
    if (RuneSet.size() == 0){
      RuneSet.emplace_back(RC);
      return;
    }
    unsigned long low = RC.min;
    unsigned long high = RC.max;
    int l = 0;
    int h = RuneSet.size() - 1;
    int mid, low_index, high_index;
    bool low_in, high_in;
    while (l < h)
    {
      mid = (h + l) / 2;
      if (RuneSet[mid].min > low){
        h = mid - 1;
      }
      else if (RuneSet[mid].min < low){
        l = mid + 1;
      }
      else{
        l = mid;
        break;
      }
    }
    if (RuneSet[l].min <= low){
      if (RuneSet[l].max+1 >= low){
        low_in = true;
        low_index = l;
        RC.min = RuneSet[l].min;
      }
      else{
        low_in = false;
        low_index = l + 1;
        if (low_index == RuneSet.size()){
          RuneSet.emplace_back(RC);
          return;
        }
      }
    }else{
      if ((l-1) >= 0)
      if (RuneSet[l-1].max+1 >= low){
        low_in = true;
        low_index = l - 1;
        RC.min = RuneSet[l-1].min;
      }
      else{
        low_in = false;
        low_index = l;
      }
      else {
        low_in = false;
        low_index = 0;
      }
    }
    l = 0;
    h = RuneSet.size() - 1;
    while (l < h)
    {
      mid = (h + l) / 2;
      if (RuneSet[mid].max < high){
        l = mid + 1;
      }
      else if (RuneSet[mid].max > high){
        h = mid - 1;
      }
      else{
        l = mid;
        break;
      }
    }
    if (RuneSet[l].max >= high){
      if (RuneSet[l].min-1 <= high){
        high_in = true;
        high_index = l;
        RC.max = RuneSet[l].max;
      }
      else{
        high_in = false;
        high_index = l - 1;
        if (high_index < 0){
          RuneSet.insert(RuneSet.begin(), RC);
          return;
        }
      }
    }else{
      if ((l+1) < RuneSet.size())
      if (RuneSet[l+1].min-1 <= high){
        high_in = true;
        high_index = l + 1;
        RC.max = RuneSet[l+1].max;
      }
      else{
        high_in = false;
        high_index = l;
      }
      else {
        high_index = RuneSet.size() - 1;
        high_in = false;
      }
    }
    if (low_in){
      if (high_in){
        if (low_index == high_index)
          return;
        else {
          RuneSet.erase(RuneSet.begin() + low_index, RuneSet.begin() + high_index + 1);
          RuneSet.insert(RuneSet.begin() + low_index, RC);
        }
      }
      else{
        RuneSet.erase(RuneSet.begin() + low_index, RuneSet.begin() + high_index + 1);
        RuneSet.insert(RuneSet.begin() + low_index, RC);
      }
    }else{
      if (high_in){
        RuneSet.erase(RuneSet.begin() + low_index, RuneSet.begin() + high_index + 1);
        RuneSet.insert(RuneSet.begin() + low_index, RC);
      }
      else{
        if (low_index == high_index){
          RuneSet.erase(RuneSet.begin() + low_index, RuneSet.begin() + high_index + 1);
          RuneSet.insert(RuneSet.begin() + low_index, RC);
        }
          
        else {
          RuneSet.erase(RuneSet.begin() + low_index, RuneSet.begin() + high_index + 1);
          RuneSet.insert(RuneSet.begin() + low_index, RC);
        }
      }
    }
  }
  

  REnode* Parer::Parse(REnode* r,  std::string &RegexString) {
  REnode* rU = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
  while (!RegexString.empty()) {
    switch (RegexString[0]) {
      default: {
        Re.BytemapRange.insert(RuneClass(unsigned(RegexString[0]), unsigned(RegexString[0])));
        REnode* REnodeRune = Re.initREnode(Kind::REGEXP_RUNE, {int(RegexString[0]), int(RegexString[0])});
        r->Children.emplace_back(REnodeRune);
        RegexString.erase(0, 1);
        break;
      }

      case '(':{
        
        REnode* REnodeCONCAT = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
        RegexString.erase(0, 1);
        if (RegexString[0] == '?')
          RegexString.erase(0, 1);
        REnodeCONCAT = Parse(REnodeCONCAT, RegexString);
        if (REnodeCONCAT->Children.size() > 1)
          r->Children.emplace_back(REnodeCONCAT);
        else
          r->Children.emplace_back(REnodeCONCAT->Children[0]);
        break;
      }


      case '|':{
        RegexString.erase(0, 1);
        if (rU->kind == Kind::REGEXP_UNION){
          if (r->Children.size() <= 1){
            if(r->Children.size() == 0){
              rU->Children.emplace_back(Re.initREnode(Kind::REGEXP_NONE, {0, 0}));
            }
            else
              rU->Children.emplace_back(r->Children[0]);
          }
          else{
            rU->Children.emplace_back(r);
          }
          r = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
        }
        else {
          rU->kind = Kind::REGEXP_UNION;
          if (r->Children.size() <= 1){
            if(r->Children.size() == 0){
              rU->Children.emplace_back(Re.initREnode(Kind::REGEXP_NONE, {0, 0}));
            }
            else
              rU->Children.emplace_back(r->Children[0]);
          }
          else{
            rU->Children.emplace_back(r);
          }
          r = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
        }
        break;
      }
        

      case ')':{
        RegexString.erase(0,1);
        if (rU->kind == Kind::REGEXP_UNION){
          if (r->Children.size() <= 1){
            if(r->Children.size() == 0){
              rU->Children.emplace_back(Re.initREnode(Kind::REGEXP_NONE, {0, 0}));
            }
            else
              rU->Children.emplace_back(r->Children[0]);
          }
          else{
            rU->Children.emplace_back(r);
          }
          r = rU;
          return r;
        }
        else {
          return r;
        }
      }
        

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
        std::vector<RuneClass> RuneSet;
        REnode* REnodeRClass = Re.initREnode(Kind::REGEXP_UNION, {0, 0});
        RegexString.erase(0,1);
        while (RegexString[0] != ']')
        {
          // unsigned long* low = (unsigned long*)malloc(sizeof(unsigned long));
          // chartorune(low, RegexString);
          auto Renode = LargeUnicodeBlock2Node(RegexString);
          if (Renode != nullptr){
            REnodeRClass->Children.emplace_back(Renode);
            continue;  
          }
          int_21 low = getcharacter(RegexString);
          if (RegexString[0] == '-'){
            RegexString.erase(0,1);
            // unsigned long* high = (unsigned long*)malloc(sizeof(unsigned long));
            // chartorune(high, RegexString);
            int_21 high = getcharacter(RegexString);
            if (high < low){
              std::cout << "error: low > high" << std::endl;
              exit(0);
            }
            else{
              InsertRune(RuneSet, {low, high});
            }
          }else{
            int_21 high = low;
            InsertRune(RuneSet, {low, high});
          }
        } 
        
        RegexString.erase(0,1);
        for (auto it : RuneSet){
          RuneSequence RS;
          Re.ConvertToUTF_8(it.min, it.max, RS);
          for (long unsigned int i = 0; i < RS.size(); i++){
            REnodeRClass->Children.emplace_back(RS[i]);
          }
        }
        if (REnodeRClass->Children.size() > 1)
          r->Children.emplace_back(REnodeRClass);
        else
          r->Children.emplace_back(REnodeRClass->Children[0]);
        break;
      }

      case '*': { 
        RegexString.erase(0, 1);
        REnode* REnodeSTAR = Re.initREnode(Kind::REGEXP_STAR, {0, 0});
        REnodeSTAR->Children.emplace_back(r->Children.back());
        r->Children.pop_back();
        r->Children.emplace_back(REnodeSTAR);
        break;
      } // Zero or more.

      case '+': {
        RegexString.erase(0, 1);
        REnode* REnodeSTAR = Re.initREnode(Kind::REGEXP_PLUS, {0, 0});
        REnodeSTAR->Children.emplace_back(r->Children.back());
        r->Children.pop_back();
        r->Children.emplace_back(REnodeSTAR);
        break;
      }
      case '?': {
        RegexString.erase(0, 1);
        REnode* REnodeSTAR = Re.initREnode(Kind::REGEXP_OPT, {0, 0});
        REnodeSTAR->Children.emplace_back(r->Children.back());
        r->Children.pop_back();
        r->Children.emplace_back(REnodeSTAR);
        break;
      }
      // Rep:
      //   StringPiece opstr = t;
      //   bool nongreedy = false;
      //   t.remove_prefix(1);  // '*' or '+' or '?'
      //   if (ps.flags() & PerlX) {
      //     if (!t.empty() && t[0] == '?') {
      //       nongreedy = true;
      //       t.remove_prefix(1);  // '?'
      //     }
      //     if (!lastunary.empty()) {
      //       // In Perl it is not allowed to stack repetition operators:
      //       //   a** is a syntax error, not a double-star.
      //       // (and a++ means something else entirely, which we don't support!)
      //       status->set_code(kRegexpRepeatOp);
      //       status->set_error_arg(StringPiece(
      //           lastunary.data(),
      //           static_cast<size_t>(t.data() - lastunary.data())));
      //       return NULL;
      //     }
      //   }
      //   opstr = StringPiece(opstr.data(),
      //                       static_cast<size_t>(t.data() - opstr.data()));
      //   if (!ps.PushRepeatOp(op, opstr, nongreedy))
      //     return NULL;
      //   isunary = opstr;
      //   break;
      // }

      case '{': {  // Counted repetition.
        std::string lo, hi;
        RegexString.erase(0, 1);
        std::string NUM = "";
        bool issplit = false;
        while (RegexString[0] != '}')
        {
          if (RegexString[0] == ','){
            issplit = true;
            lo = NUM;
            NUM = "";
            RegexString.erase(0, 1);
          }
          NUM.push_back(RegexString[0]);
          RegexString.erase(0, 1);
        }
        if (issplit)
          hi = NUM;
        else{
          lo = NUM;
          hi = lo;
        }
        RegexString.erase(0, 1);
        if (lo.size() == 0){
          if (hi.size() == 0){
            std::cout << "error: " << std::endl;
          }
          else{
            auto hi_int = stoi(hi);
            if (hi_int < 0){
              std::cout << "error: " << std::endl;
            }
            else{
              REnode* REnodeLOOP = Re.initREnode(Kind::REGEXP_LOOP, {0, 0});
              REnodeLOOP->Children.emplace_back(r->Children.back());
              r->Children.pop_back();
              r->Children.emplace_back(REnodeLOOP);
              REnodeLOOP->Counting = RuneClass(0, hi_int);
            }
          }
        }
        else{
          if (hi.size() == 0){
            auto lo_int = stoi(lo);
            REnode* REnodeLOOP = Re.initREnode(Kind::REGEXP_LOOP, {0, 0});
            REnodeLOOP->Children.emplace_back(r->Children.back());
            r->Children.pop_back();
            r->Children.emplace_back(REnodeLOOP);
            REnodeLOOP->Counting = RuneClass(lo_int, -1);
          }
          else{
            auto lo_int = stoi(lo);
            auto hi_int = stoi(hi);
            REnode* REnodeLOOP = Re.initREnode(Kind::REGEXP_LOOP, {0, 0});
            REnodeLOOP->Children.emplace_back(r->Children.back());
            r->Children.pop_back();
            r->Children.emplace_back(REnodeLOOP);
            REnodeLOOP->Counting = RuneClass(lo_int, hi_int);
          }
        }
        break;
      }

      case '\\': {  // Escaped character or Perl sequence.
        if (RegexString[1] == 'b' || RegexString[1] == 'B') {
          RegexString.erase(0, 2);
          break;
          //todo

        }
        if (RegexString[1] == 'A' || RegexString[1] == 'Z' || RegexString[1] == 'z') {
          RegexString.erase(0, 2);
          break;
          //todo
          
        }
        if (RegexString[1] == 'u'){
          RegexString.erase(0, 2);
          auto utfstring = RegexString.substr(0, 4);
          signed int unicode = stoi(utfstring, 0, 16);
          uint8_t ul[4];
		      int n = Re.runetochar(reinterpret_cast<char*>(ul), &unicode);
          for (int i = 0; i < n; i++){
            Re.BytemapRange.insert(RuneClass(ul[i], ul[i]));
            REnode* REnodeRune = Re.initREnode(Kind::REGEXP_RUNE, {ul[i], ul[i]});
            r->Children.emplace_back(REnodeRune);
          }
          RegexString.erase(0, 4);
          break;
        }
        if (RegexString[1] == 'x'){
          RegexString.erase(0, 2);
          std::string NumString;
          if (RegexString[0] != '{'){
            NumString = RegexString.substr(0, 2);
            RegexString.erase(0, 2);
          }
          else{
            RegexString.erase(0, 1);
            while (RegexString[0] != '}'){
              NumString.push_back(RegexString[0]);
              RegexString.erase(0, 1);
            }
            RegexString.erase(0, 1);
          }
          int_21 unicode = std::stoi(NumString, 0, 16);
          uint8_t ul[4];
		      int n = Re.runetochar(reinterpret_cast<char*>(ul), &unicode);
          for (int i = 0; i < n; i++){
            Re.BytemapRange.insert(RuneClass(ul[i], ul[i]));
            REnode* REnodeRune = Re.initREnode(Kind::REGEXP_RUNE, {ul[i], ul[i]});
            r->Children.emplace_back(REnodeRune);
          }
          break;
        }
        if (RegexString[1] == 'd') {
          RegexString.erase(0, 1);
          Re.BytemapRange.insert(RuneClass(48, 57));
          RegexString.erase(0, 1);
          REnode* REnodeRune = Re.initREnode(Kind::REGEXP_CHARCLASS, {48, 57});
          r->Children.emplace_back(REnodeRune);
          break;
        }
        if (RegexString[1] == 'w'){
          RegexString.erase(0, 2);
          std::vector<RuneClass> runeset = {RuneClass(65, 90), RuneClass(48, 57), RuneClass(97, 122), RuneClass(95, 95)};
          REnode* REnodeUNION = Re.initREnode(Kind::REGEXP_UNION, RuneClass(0, 0));
          for (auto it : runeset){
            Re.BytemapRange.insert(it);
            REnode* REnodeRune = Re.initREnode(Kind::REGEXP_CHARCLASS, it);
            REnodeUNION->Children.emplace_back(REnodeRune);
          }
          r->Children.emplace_back(REnodeUNION);
          break;
        }
        if (RegexString[1] == 's'){
          RegexString.erase(0, 2);
          std::vector<RuneClass> runeset = {RuneClass(9, 11), RuneClass(13, 13), RuneClass(32, 32)};
          REnode* REnodeUNION = Re.initREnode(Kind::REGEXP_UNION, RuneClass(0, 0));
          for (auto it : runeset){
            Re.BytemapRange.insert(it);
            REnode* REnodeRune = Re.initREnode(Kind::REGEXP_CHARCLASS, it);
            REnodeUNION->Children.emplace_back(REnodeRune);
          }
          r->Children.emplace_back(REnodeUNION);
          break;
        }
        if (RegexString[1] == 'p'){
          auto reNode = LargeUnicodeBlock2Node(RegexString);
          r->Children.emplace_back(reNode);
        }
        RegexString.erase(0, 1);
        Re.BytemapRange.insert(RuneClass(int(RegexString[0]), int(RegexString[0])));
        REnode* REnodeRune = Re.initREnode(Kind::REGEXP_RUNE, {int(RegexString[0]), int(RegexString[0])});
        r->Children.emplace_back(REnodeRune);
        RegexString.erase(0, 1);
        break;
        
        // if ((ps.flags() & Regexp::PerlX) && t.size() >= 2) {
        //   if (t[1] == 'A') {
        //     if (!ps.PushSimpleOp(kRegexpBeginText))
        //       return NULL;
        //     t.remove_prefix(2);  // '\\', 'A'
        //     break;
        //   }
        //   if (t[1] == 'z') {
        //     if (!ps.PushSimpleOp(kRegexpEndText))
        //       return NULL;
        //     t.remove_prefix(2);  // '\\', 'z'
        //     break;
        //   }
        //   // Do not recognize \Z, because this library can't
        //   // implement the exact Perl/PCRE semantics.
        //   // (This library treats "(?-m)$" as \z, even though
        //   // in Perl and PCRE it is equivalent to \Z.)

        //   if (t[1] == 'C') {  // \C: any byte [sic]
        //     if (!ps.PushSimpleOp(kRegexpAnyByte))
        //       return NULL;
        //     t.remove_prefix(2);  // '\\', 'C'
        //     break;
        //   }

        //   if (t[1] == 'Q') {  // \Q ... \E: the ... is always literals
        //     t.remove_prefix(2);  // '\\', 'Q'
        //     while (!t.empty()) {
        //       if (t.size() >= 2 && t[0] == '\\' && t[1] == 'E') {
        //         t.remove_prefix(2);  // '\\', 'E'
        //         break;
        //       }
        //       Rune r;
        //       if (StringPieceToRune(&r, &t, status) < 0)
        //         return NULL;
        //       if (!ps.PushLiteral(r))
        //         return NULL;
        //     }
        //     break;
        //   }
        // }

        // if (t.size() >= 2 && (t[1] == 'p' || t[1] == 'P')) {
        //   Regexp* re = new Regexp(kRegexpCharClass, ps.flags() & ~FoldCase);
        //   re->ccb_ = new CharClassBuilder;
        //   switch (ParseUnicodeGroup(&t, ps.flags(), re->ccb_, status)) {
        //     case kParseOk:
        //       if (!ps.PushRegexp(re))
        //         return NULL;
        //       goto Break2;
        //     case kParseError:
        //       re->Decref();
        //       return NULL;
        //     case kParseNothing:
        //       re->Decref();
        //       break;
        //   }
        // }

        // const UGroup *g = MaybeParsePerlCCEscape(&t, ps.flags());
        // if (g != NULL) {
        //   Regexp* re = new Regexp(kRegexpCharClass, ps.flags() & ~FoldCase);
        //   re->ccb_ = new CharClassBuilder;
        //   AddUGroup(re->ccb_, g, g->sign, ps.flags());
        //   if (!ps.PushRegexp(re))
        //     return NULL;
        //   break;
        // }

        // Rune r;
        // if (!ParseEscape(&t, &r, status, ps.rune_max()))
        //   return NULL;
        // if (!ps.PushLiteral(r))
        //   return NULL;
        break;
      }
    }
  // Break2:
  //   lastunary = isunary;
  }
  if (rU->kind == Kind::REGEXP_UNION){
   if (r->Children.size() <= 1){
      rU->Children.emplace_back(r->Children[0]);
    }
    else{
      rU->Children.emplace_back(r);
    }
    r = rU;
    return r;
  }
  else {
    return r;
  }
    
}


Parer::Parer(std::string regex_string){
  if (regex_string[0] == '/'){
    regex_string.erase(0, 1);
    for (int j = regex_string.length()-1; j > 0; j--){
      if (regex_string[j] == '/'){
        regex_string.pop_back();
        break;
      }
      regex_string.pop_back();
    }
  }
  
  Re.Renode = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
  Re.Renode = Parse(Re.Renode, regex_string);
  if (Re.Renode->Children.size() == 1)
    Re.Renode = Re.Renode->Children[0];
  memset(Re.ByteMap, 0, sizeof(Re.ByteMap));
  Re.BuildBytemap(Re.ByteMap, Re.BytemapRange);
  Re.BuildBytemapToString(Re.ByteMap);
  Re.BytemapRangeToString(Re.BytemapRange);
  std::cout << Re.REnodeToString(Re.Renode) << std::endl;

}
Parer::Parer(){}

}