#include "parser.h"
#include "../Solver/solver.h"
#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <ostream>
#include <string.h>
#include <regex>


namespace solverbin {


  std::vector<RuneClass> Parer::ProcessingBlash(std::wstring &RegexString){
    std::vector<RuneClass> runeset;
    if (RegexString[0] != '\\')
      return runeset;
    if (RegexString[1] == 'd') {
      RegexString.erase(0, 2);
      Re.BytemapRange.insert(RuneClass(48, 57));
      runeset = {RuneClass(48, 57)};
      return runeset;
    }
    else if (RegexString[1] == 'D'){
      RegexString.erase(0, 2);
      std::vector<RuneClass> runeset = {RuneClass(0, 47), RuneClass(58, 0x10ffff)};
      return runeset;
    }
    else if (RegexString[1] == 'w'){
      RegexString.erase(0, 2);
      std::vector<RuneClass> runeset = {RuneClass(65, 90), RuneClass(48, 57), RuneClass(97, 122), RuneClass(95, 95)};
      return runeset;
    }
    else if (RegexString[1] == 'W'){
      RegexString.erase(0, 2);
      std::vector<RuneClass> runeset = {RuneClass(0, 47), RuneClass(58, 64), RuneClass(91, 94), RuneClass(96, 96), RuneClass(123, 0x10ffff)};
      return runeset;
    }
    else if (RegexString[1] == 's'){
      RegexString.erase(0, 2);
      std::vector<RuneClass> runeset = {RuneClass(9, 13), RuneClass(32, 32)};;
      return runeset;
    }
    else if (RegexString[1] == 'S'){
      RegexString.erase(0, 2);
      std::vector<RuneClass> runeset = {RuneClass(0, 8), RuneClass(14, 31), RuneClass(33, 0x10ffff)};
      return runeset;
    }
    else if (RegexString[1] == 't'){
      RegexString.erase(0, 2);
      std::vector<RuneClass> runeset = {RuneClass(9, 9)};
      return runeset;
    }
    else if (RegexString[1] == 'n'){
      RegexString.erase(0, 2);
      std::vector<RuneClass> runeset = {RuneClass(10, 10)};
      return runeset;
    }
    else if (RegexString[1] == 'v'){
      RegexString.erase(0, 2);
      std::vector<RuneClass> runeset = {RuneClass(11, 11)};
      return runeset;
    }
    else if (RegexString[1] == 'f'){
      RegexString.erase(0, 2);
      std::vector<RuneClass> runeset = {RuneClass(12, 12)};
      return runeset;
    }
    else if (RegexString[1] == 'r'){
      RegexString.erase(0, 2);
      std::vector<RuneClass> runeset = {RuneClass(13, 13)};
      return runeset;
    }
    return runeset;
  }

  signed int Parer::getcharacter(std::wstring &RegexString){
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
          std::wstring NumString;
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
      if (RuneSet[l].min == 0|| RuneSet[l].min-1 <= high){
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
      if (RuneSet[l].min == 0 || RuneSet[l+1].min-1 <= high){
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
  

  REnode* Parer::Parse(REnode* r,  std::wstring &RegexString) {
  REnode* rU = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
  while (!RegexString.empty()) {
    switch (RegexString[0]) {
      default: {
        REnode* REnodeRune = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
        RuneSequence RS;
        Re.ConvertToUTF_8(RegexString[0], RegexString[0], RS);
        if (RS.size() > 1){
          for (auto itc : RS){
            REnodeRune->Children.emplace_back(itc);
          }
        }
        else{
          REnodeRune = RS[0];
        }
        r->Children.emplace_back(REnodeRune);
        RegexString.erase(0, 1);
        break;
      }

      case '(':{
        RegexString.erase(0, 1);
        if (RegexString.substr(0, 2) == L"?="){
          RegexString.erase(0,2);
          REnode* REnodeLookahead = Re.initREnode(Kind::REGEXP_Lookahead, {0, 0});
          REnode* REnodeCONCAT = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
          REnodeCONCAT = Parse(REnodeCONCAT, RegexString);
          REnodeLookahead->Children.emplace_back(REnodeCONCAT);
          r->Children.emplace_back(REnodeLookahead);
          break;
        }
        else if (RegexString.substr(0, 2) == L"?!"){
          RegexString.erase(0,2);
          REnode* REnodeLookahead = Re.initREnode(Kind::REGEXP_NLookahead, {0, 0});
          REnode* REnodeCONCAT = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
          REnodeCONCAT = Parse(REnodeCONCAT, RegexString);
          REnodeLookahead->Children.emplace_back(REnodeCONCAT);
          r->Children.emplace_back(REnodeLookahead);
          break;
        }
        else if (RegexString.substr(0, 3) == L"?<="){
          RegexString.erase(0,3);
          REnode* REnodeLookbehind = Re.initREnode(Kind::REGEXP_Lookbehind, {0, 0});
          REnode* REnodeCONCAT = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
          REnodeCONCAT = Parse(REnodeCONCAT, RegexString);
          REnodeLookbehind->Children.emplace_back(REnodeCONCAT);
          // r->Children.emplace_back(REnodeLookahead);
          break;
        }
        else if (RegexString.substr(0, 3) == L"?<!"){
          RegexString.erase(0,3);
          REnode* REnodeNLookbehind = Re.initREnode(Kind::REGEXP_NLookbehind, {0, 0});
          REnode* REnodeCONCAT = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
          REnodeCONCAT = Parse(REnodeCONCAT, RegexString);
          REnodeNLookbehind->Children.emplace_back(REnodeCONCAT);
          // r->Children.emplace_back(REnodeLookahead);
          break;
        }
        else{
          REnode* REnodeCONCAT = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
          if (RegexString[0] == '?'){
            RegexString.erase(0, 1);
            if (RegexString[0] == ':')
              RegexString.erase(0, 1);
            else if (RegexString[0] == '<'){
              RegexString.erase(0, 1);
              while (RegexString[0] != '>')
                RegexString.erase(0, 1);
              RegexString.erase(0, 1);  
            }
            else if (RegexString[0] == 'P' && RegexString[1] == '<'){
              while (RegexString[0] != '>')
                RegexString.erase(0, 1);
              RegexString.erase(0, 1);
            }
          }
          REnodeCONCAT = Parse(REnodeCONCAT, RegexString);
          // if (REnodeCONCAT->Children.size() > 1)
          r->Children.emplace_back(REnodeCONCAT);
          // else
          //   r->Children.emplace_back(REnodeCONCAT->Children[0]);
          break;
        }
        
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
          if (r->Children.size() <= 1){
            if (r->Children.size() == 0)
              return Re.initREnode(Kind::REGEXP_NONE, {0, 0});
            else  
              return r;  
          }
          else
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
        Re.matchFlag = REnodeClass::MatchFlag::dollarEnd;
        RegexString.erase(0, 1);
        break;
      }// End of line
        

      case '.':  {
        REnode* REDot = Re.initREnode(Kind::REGEXP_UNION, {0, 0});
        REnode* REnodeRClass1 = Re.initREnode(Kind::REGEXP_CHARCLASS, {0, 9});
        Re.BytemapRange.insert(RuneClass{0,9});
        REDot->Children.emplace_back(REnodeRClass1);
        RuneSequence RS;
        Re.ConvertToUTF_8(0xb, 0x10ffff , RS);
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
        bool IsReverse = false;
        std::vector<RuneClass> RuneSet;
        REnode* REnodeRClass = Re.initREnode(Kind::REGEXP_UNION, {0, 0});
        RegexString.erase(0,1);
        if (RegexString[0] == '^'){
          IsReverse = true;
          RegexString.erase(0,1);
        }
        int mark = 1;
        while (RegexString[0] != ']' || mark != 1)
        {
          // if (RegexString[0] == '.'){
          //   InsertRune(RuneSet, RuneClass(0x0, 0x9));
          //   InsertRune(RuneSet, RuneClass(0x10, 0x10ffff));
          //   RegexString.erase(0, 1);
          //   continue;
          // }
          if (RegexString[0] == '[')
            mark++;
          if (RegexString[0] == ']')
            mark--;  
          // unsigned long* low = (unsigned long*)malloc(sizeof(unsigned long));
          // chartorune(low, RegexString);
          auto Renode = LargeUnicodeBlock2Node(RegexString);
          if (Renode != nullptr){
            REnodeRClass->Children.emplace_back(Renode);
            continue;  
          }
          auto RetSet = ProcessingBlash(RegexString);
          if (RetSet.size() > 0){
            for (auto it : RetSet)
              InsertRune(RuneSet, it);
            continue;  
          }
          if (RegexString[0] == ']')  
            break;;
          int_21 low = getcharacter(RegexString);
          if (RegexString[0] == '-'){
            RegexString.erase(0,1);
            if (RegexString[0] == ']' && mark == 1){
              InsertRune(RuneSet, {45, 45});
              continue;
            }
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
        if (IsReverse){
          int bound_left = 0;
          RuneClass Trune;
          for (auto it : RuneSet){
            RuneSequence RS;
            if (it.min == bound_left){
              bound_left = it.max + 1;
              continue;
            }
            else{
              Trune = RuneClass(bound_left, it.min-1);
              bound_left = it.max + 1;
            }
            Re.ConvertToUTF_8(Trune.min, Trune.max, RS);
            for (long unsigned int i = 0; i < RS.size(); i++){
              REnodeRClass->Children.emplace_back(RS[i]);
            }
          }
          if ((0x10ffff - bound_left) > 0){
            RuneSequence RS;
            Trune = RuneClass(bound_left, 0x10ffff);
            Re.ConvertToUTF_8(Trune.min, Trune.max, RS);
            for (long unsigned int i = 0; i < RS.size(); i++){
              REnodeRClass->Children.emplace_back(RS[i]);
            }
          }
        }
        else{
          for (auto it : RuneSet){
            RuneSequence RS;
            Re.ConvertToUTF_8(it.min, it.max, RS);
            for (long unsigned int i = 0; i < RS.size(); i++){
              REnodeRClass->Children.emplace_back(RS[i]);
            }
          }
        }
        if (REnodeRClass->Children.size() > 1)
          r->Children.emplace_back(REnodeRClass);
        else if (REnodeRClass->Children.size() == 1)
          r->Children.emplace_back(REnodeRClass->Children[0]);
        else 
          break;  
        break;
      }

      case '*': { 
        RegexString.erase(0, 1);
        REnode* REnodeSTAR = Re.initREnode(Kind::REGEXP_STAR, {0, 0});
        if (r->Children.size() == 0){
          REnode* REnodeRune = Re.initREnode(Kind::REGEXP_RUNE, {'*', '*'});
          r->Children.emplace_back(REnodeRune);
          break;
        }
        REnodeSTAR->Children.emplace_back(r->Children.back());
        r->Children.pop_back();
        r->Children.emplace_back(REnodeSTAR);
        break;
      } // Zero or more.

      case '+': {
        // RegexString.erase(0, 1);
        // REnode* REnodeSTAR = Re.initREnode(Kind::REGEXP_PLUS, {0, 0});
        // REnodeSTAR->Children.emplace_back(r->Children.back());
        // r->Children.pop_back();
        // r->Children.emplace_back(REnodeSTAR);

        RegexString.erase(0, 1);
        REnode* REnodeSTAR = Re.initREnode(Kind::REGEXP_STAR, {0, 0});
        if (r->Children.size() == 0){
          REnode* REnodeRune = Re.initREnode(Kind::REGEXP_RUNE, {'+', '+'});
          r->Children.emplace_back(REnodeRune);
          break;
        }
        REnodeSTAR->Children.emplace_back(Re.CopyREnode(r->Children.back()));
        r->Children.emplace_back(REnodeSTAR);
        break;
      }
      case '?': {
        RegexString.erase(0, 1);
        auto TargetNode = r->Children.back();
        if (TargetNode->kind == Kind::REGEXP_PLUS || TargetNode->kind == Kind::REGEXP_STAR || TargetNode->kind == Kind::REGEXP_LOOP || TargetNode->kind == Kind::REGEXP_REPEAT)
          break;
        REnode* REnodeSTAR = Re.initREnode(Kind::REGEXP_OPT, {0, 0});
        REnodeSTAR->Children.emplace_back(TargetNode);
        r->Children.pop_back();
        r->Children.emplace_back(REnodeSTAR);
        break;
      }

      case '{': {  // Counted repetition.
        std::string lo, hi;
        RegexString.erase(0, 1);
        std::string NUM = "";
        std::wstring Prefix_string;
        bool issplit = false;
        while (RegexString.size() != 0 && RegexString[0] != '}')
        {
          if (RegexString[0] == ','){
            issplit = true;
            lo = NUM;
            NUM = "";
            Prefix_string.push_back(RegexString[0]);
            RegexString.erase(0, 1);
            if (RegexString[0] == '}')
              break;
          }
          NUM.push_back(RegexString[0]);
          Prefix_string.push_back(RegexString[0]);
          RegexString.erase(0, 1);
        }
        if (issplit)
          hi = NUM;
        else{
          lo = NUM;
          hi = lo;
        }
        if (!solverbin::isInteger(lo) && lo.size() != 0 || !solverbin::isInteger(hi) && hi.size() != 0){
          REnode* REnodeRune = Re.initREnode(Kind::REGEXP_RUNE, {'{', '{'});
          Re.BytemapRange.insert({'{', '{'});
          r->Children.emplace_back(REnodeRune);
          RegexString.insert(0, Prefix_string);
          break;
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
              if (!GREWIA)
                r->Children.emplace_back(REnodeLOOP);
              REnodeLOOP->Counting = RuneClass(0, hi_int);
            }
          }
        }
        else{
          if (hi.size() == 0){
            auto lo_int = stoi(lo);
            REnode* REnodeLOOP = Re.initREnode(Kind::REGEXP_LOOP, {0, 0});
            REnode* REnodeStar = Re.initREnode(Kind::REGEXP_STAR, {0, 0});
            REnodeLOOP->Children.emplace_back(r->Children.back());
            REnodeStar->Children.emplace_back(r->Children.back());
            r->Children.pop_back();
            if (!GREWIA)
              r->Children.emplace_back(REnodeLOOP);
            r->Children.emplace_back(REnodeStar);
            REnodeLOOP->Counting = RuneClass(lo_int, lo_int);
          }
          else{
            auto lo_int = stoi(lo);
            auto hi_int = stoi(hi);
            REnode* REnodeLOOP;
            if (lo_int == 0 && hi_int == 0)
              REnodeLOOP = Re.initREnode(Kind::REGEXP_NONE, {0, 0});
            else
              REnodeLOOP = Re.initREnode(Kind::REGEXP_LOOP, {0, 0});
             
            REnodeLOOP->Children.emplace_back(r->Children.back());
            r->Children.pop_back();
            r->Children.emplace_back(REnodeLOOP);
            if (GREWIA){
              REnodeLOOP->Counting = RuneClass(lo_int, lo_int);
              r->Children.pop_back();
              REnodeLOOP->kind = Kind::REGEXP_STAR;
              r->Children.emplace_back(REnodeLOOP);
            }
              
            else  
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
          std::wstring NumString;
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
        if (RegexString[1] == 'D'){
          RegexString.erase(0, 2);
          std::vector<RuneClass> runeset = {RuneClass(0, 47), RuneClass(58, 0x10ffff)};
          REnode* REnodeUNION = Re.initREnode(Kind::REGEXP_UNION, RuneClass(0, 0));
          for (auto it : runeset){
            RuneSequence RS;
            Re.ConvertToUTF_8(it.min, it.max, RS);
            for (auto it_rune : RS){
              REnodeUNION->Children.emplace_back(it_rune);
            }   
          }
          r->Children.emplace_back(REnodeUNION);
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
        if (RegexString[1] == 'W'){
          RegexString.erase(0, 2);
          std::vector<RuneClass> runeset = {RuneClass(0, 47), RuneClass(58, 64), RuneClass(91, 94), RuneClass(96, 96), RuneClass(123, 0x10ffff)};
          REnode* REnodeUNION = Re.initREnode(Kind::REGEXP_UNION, RuneClass(0, 0));
          for (auto it : runeset){
            RuneSequence RS;
            Re.ConvertToUTF_8(it.min, it.max, RS);
            for (auto it_rune : RS){
              REnodeUNION->Children.emplace_back(it_rune);
            }   
          }
          r->Children.emplace_back(REnodeUNION);
          break;
        }
        if (RegexString[1] == 's'){
          RegexString.erase(0, 2);
          std::vector<RuneClass> runeset = {RuneClass(9, 13), RuneClass(32, 32)};
          REnode* REnodeUNION = Re.initREnode(Kind::REGEXP_UNION, RuneClass(0, 0));
          for (auto it : runeset){
            Re.BytemapRange.insert(it);
            REnode* REnodeRune = Re.initREnode(Kind::REGEXP_CHARCLASS, it);
            REnodeUNION->Children.emplace_back(REnodeRune);
          }
          r->Children.emplace_back(REnodeUNION);
          break;
        }
        if (RegexString[1] == 'S'){
          RegexString.erase(0, 2);
          std::vector<RuneClass> runeset = {RuneClass(0, 8), RuneClass(14, 31), RuneClass(33, 0x10ffff)};
          REnode* REnodeUNION = Re.initREnode(Kind::REGEXP_UNION, RuneClass(0, 0));
          for (auto it : runeset){
            RuneSequence RS;
            Re.ConvertToUTF_8(it.min, it.max, RS);
            for (auto it_rune : RS){
              REnodeUNION->Children.emplace_back(it_rune);
            }   
          }
          r->Children.emplace_back(REnodeUNION);
          break;
        }
        if (RegexString[1] == 'p'){
          auto reNode = LargeUnicodeBlock2Node(RegexString);
          r->Children.emplace_back(reNode);
          break;
        }
        if (RegexString[1] == 't'){
          RegexString.erase(0, 2);
          std::vector<RuneClass> runeset = {RuneClass(9, 9)};
          REnode* REnodeUNION = Re.initREnode(Kind::REGEXP_UNION, RuneClass(0, 0));
          for (auto it : runeset){
            Re.BytemapRange.insert(it);
            REnode* REnodeRune = Re.initREnode(Kind::REGEXP_CHARCLASS, it);
            REnodeUNION = REnodeRune;
          }
          r->Children.emplace_back(REnodeUNION);
          break;
        }
        if (RegexString[1] == 'r'){
          RegexString.erase(0, 2);
          std::vector<RuneClass> runeset = {RuneClass(13, 13)};
          REnode* REnodeUNION = Re.initREnode(Kind::REGEXP_UNION, RuneClass(0, 0));
          for (auto it : runeset){
            Re.BytemapRange.insert(it);
            REnode* REnodeRune = Re.initREnode(Kind::REGEXP_CHARCLASS, it);
            REnodeUNION = REnodeRune;
          }
          r->Children.emplace_back(REnodeUNION);
          break;
        }
        if (RegexString[1] == 'n'){
          RegexString.erase(0, 2);
          std::vector<RuneClass> runeset = {RuneClass(10, 10)};
          REnode* REnodeUNION = Re.initREnode(Kind::REGEXP_UNION, RuneClass(0, 0));
          for (auto it : runeset){
            Re.BytemapRange.insert(it);
            REnode* REnodeRune = Re.initREnode(Kind::REGEXP_CHARCLASS, it);
            REnodeUNION = REnodeRune;
          }
          r->Children.emplace_back(REnodeUNION);
          break;
        }
        if (RegexString[1] == 'v'){
          RegexString.erase(0, 2);
          std::vector<RuneClass> runeset = {RuneClass(11, 11)};
          REnode* REnodeUNION = Re.initREnode(Kind::REGEXP_UNION, RuneClass(0, 0));
          for (auto it : runeset){
            Re.BytemapRange.insert(it);
            REnode* REnodeRune = Re.initREnode(Kind::REGEXP_CHARCLASS, it);
            REnodeUNION = REnodeRune;
          }
          r->Children.emplace_back(REnodeUNION);
          break;
        }
        if (RegexString[1] == 'f'){
          RegexString.erase(0, 2);
          std::vector<RuneClass> runeset = {RuneClass(12, 12)};
          REnode* REnodeUNION = Re.initREnode(Kind::REGEXP_UNION, RuneClass(0, 0));
          for (auto it : runeset){
            Re.BytemapRange.insert(it);
            REnode* REnodeRune = Re.initREnode(Kind::REGEXP_CHARCLASS, it);
            REnodeUNION = REnodeRune;
          }
          r->Children.emplace_back(REnodeUNION);
          break;
        }
        RegexString.erase(0, 1);
        REnode* REnodeRune = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
        RuneSequence RS;
        Re.ConvertToUTF_8(RegexString[0], RegexString[0], RS);
        if (RS.size() > 1){
          for (auto itc : RS){
            REnodeRune->Children.emplace_back(itc);
          }
        }
        else{
          REnodeRune = RS[0];
        }
        r->Children.emplace_back(REnodeRune);
        RegexString.erase(0, 1);
        break;
      }
    }
  // Break2:
  //   lastunary = isunary;
  }
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


Parer::Parer(std::wstring regex_string, bool GREWIA_){
  GREWIA = GREWIA_;
  Re.Renode = Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
  Re.Renode = Parse(Re.Renode, regex_string);
  if (Re.Renode->Children.size() == 1)
    Re.Renode = Re.Renode->Children[0];
  memset(Re.ByteMap, 0, sizeof(Re.ByteMap));
  Re.BuildBytemap(Re.ByteMap, Re.BytemapRange);
  // Re.BuildBytemapToString(Re.ByteMap);
  // Re.BytemapRangeToString(Re.BytemapRange);
  if (solverbin::debug.PrintREnode)
    std::cout << Re.REnodeToString(Re.Renode) << std::endl;

}
Parer::Parer(){}

}