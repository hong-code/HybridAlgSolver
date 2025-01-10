/******************************************************************************
 * Top contributors (to current version):
 *   Weihao Su
 *
 * This file is part of the cvc5 project.
 *
 * Copyright (c) 2023-2023 by the authors listed in the file AUTHORS
 * in the top-level source directory and their institutional affiliations.
 * All rights reserved.  See the file COPYING in the top-level source
 * directory for licensing information.
 * ****************************************************************************
 *
 * Incremental Simulation-based Algorithms for Regular Expression Membership Constraints
 */
#include "regexp_symbolic.h"



#include <cmath>
#include <string.h>
#include <map>
#include <list>
#include <bitset>
#include <ostream>
#include <regex>
#include "../../Parser/parser.h"


namespace solverbin {



// REnode* REnodeClass::linearize(Node e,  std::set<RuneClass>& BytemapClass){
//   REnode *r = initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
  // if(e.isNull()) {
  //   Trace("Regex-Symbolic") << "the node inputted is null" << std::endl;
  //   } else {
  //   Kind k = e.getKind();
  //   switch( k ) {
  //     case Kind::REGEXP_NONE:
  //     {
  //       Trace("RegExpSymbolic") << "the node is null" << std::endl;
  //       r->Kind = REGEXP_NONE;
  //       break;
  //     }
  //     case Kind::REGEXP_ALLCHAR:    //decode by utf-8
  //     {
  //       r->Kind = Kind::REGEXP_UNION;
  //       Node r1, r2;
  //       r1 = NodeManager::currentNM()->mkNode(Kind::REGEXP_RANGE, NodeManager::currentNM()->mkConst(String("\\u0000", true)), NodeManager::currentNM()->mkConst(String("\\u0009", true)));
  //       r2 = NodeManager::currentNM()->mkNode(Kind::REGEXP_RANGE, NodeManager::currentNM()->mkConst(String("\\u000b", true)), NodeManager::currentNM()->mkConst(String("\\uffff", true)));
  //       r->Children.emplace_back(linearize(r1, BytemapClass));
  //       r->Children.emplace_back(linearize(r2, BytemapClass));
  //       break;
  //     }
  //     case Kind::STRING_TO_REGEXP:
  //     {
  //       std::vector<unsigned> s = e[0].getConst<String>().toUnsignedIntSeq();
  //       std::vector<uint8_t> uvec;
  //       for (auto it : s){
  //         uint8_t str_8[UTFmax];
  //         int_21 rune;
  //         rune = int_21(it);
  //         int n = runetochar(reinterpret_cast<char*>(str_8), &rune);
  //         for (int i = 0; i < n; i++){
  //           uvec.push_back(str_8[i]);
  //         }
  //       }
  //       if (uvec.size() == 1){
  //         *r = REnode(Kind::REGEXP_RUNE, RuneClass(uvec[0], uvec[0]));
  //         BytemapClass.insert(RuneClass(uvec[0], uvec[0]));
  //         break;
  //       }
  //       else{
  //         *r = REnode(REGEXP_concat, RuneClass(0, 0));
  //         for (long unsigned int i = 0; i < uvec.size(); i++){
  //           r->Children.emplace_back(initREnode(Kind::REGEXP_RUNE, RuneClass(uvec[i], uvec[i])));
  //           BytemapClass.insert(RuneClass(uvec[i], uvec[i]));
  //         }
  //       }
  //       break;
  //     }
  //     case Kind::REGEXP_CONCAT:
  //     {
  //       r->Kind = REGEXP_concat;
  //       for(unsigned i=0; i<e.getNumChildren(); ++i) {
  //         r->Children.emplace_back(linearize( e[i] , BytemapClass));
  //       }
  //       break;
  //     }
  //     case Kind::REGEXP_UNION:
  //     {
  //       r->Kind = REGEXP_union;
  //       for(unsigned i=0; i<e.getNumChildren(); ++i) {
  //         r->Children.emplace_back(linearize( e[i] , BytemapClass));
  //       }
  //       break;
  //     }
  //     case Kind::REGEXP_INTER:
  //     {
  //       r->Kind = REGEXP_inter;
  //       for(unsigned i=0; i<e.getNumChildren(); ++i) {
  //         r->Children.emplace_back(linearize( e[i] , BytemapClass));
  //       }
  //       break;
  //     }
  //     case Kind::REGEXP_STAR:
  //     {
  //       r->Kind = REGEXP_star;
  //       r->Children.emplace_back(linearize( e[0] , BytemapClass));
  //       break;
  //     }
  //     case Kind::REGEXP_PLUS:
  //     {
  //       r->Kind = REGEXP_plus;
  //       r->Children.emplace_back(linearize( e[0] , BytemapClass));
  //       break;
  //     }
  //     case Kind::REGEXP_OPT:
  //     {
  //       r->Kind = REGEXP_opt;
  //       r->Children.emplace_back(linearize( e[0] , BytemapClass));
  //       break;
  //     }
  //     case Kind::REGEXP_RANGE:
  //     {
  //       std::vector<unsigned> s1 = e[0].getConst<String>().toUnsignedIntSeq();
  //       std::vector<unsigned> s2 = e[1].getConst<String>().toUnsignedIntSeq();
  //       RuneSequence RS;
  //       ConvertToUTF_8(int_21(s1[0]), int_21(s2[0]), RS);
  //       REnode* RUnion = initREnode(REGEXP_union, {0, 0});

  //       if (RS.size() > 1){
  //         for (long unsigned int i = 0; i < RS.size(); i++){
  //           RUnion->Children.emplace_back(RS[i]);
  //         }
  //         r = RUnion;
  //       }
  //       else{
  //         r = RS[0];
  //       }
  //       std::vector<RegExpSymbolic::REnode*>().swap(RS);
  //       break;
  //     }
  //     case Kind::REGEXP_REPEAT:
  //     {
  //       r->Kind = REGEXP_REPEAT;
  //       r->Children.emplace_back(linearize( e[0] , BytemapClass));
  //       r->Counting = RuneClass(utils::getRepeatAmount(e), utils::getRepeatAmount(e));
  //       break;
  //     }
  //     case Kind::REGEXP_LOOP:
  //     {
  //       r->Kind = REGEXP_LOOP;
  //       r->Counting = RuneClass(utils::getLoopMinOccurrences(e), utils::getLoopMaxOccurrences(e));
  //       r->Children.emplace_back(linearize( e[0] , BytemapClass));
  //       break;
  //     }
  //     case Kind::REGEXP_RV:
  //     {
  //       e[0].getConst<Rational>().getNumerator().toString();
  //       break;
  //     }
  //     case Kind::REGEXP_COMPLEMENT:
  //     {
  //       r->Kind = REGEXP_complement;
  //       r->Children.emplace_back(linearize( e[0] , BytemapClass));
  //       break;
  //     }
  //     default:
  //     {
  //       std::stringstream ss;
  //       // retStr = ss.str();
  //       // Assert(!utils::isRegExpKind(r.getKind()));
  //       break;
  //     }
  //   }
  // }
//   return r;
// }

bool isInteger(const std::string& str){
    // 使用正则表达式检查字符串是否是一个整数
    std::regex intRegex("^[+-]?[0-9]+$");
    if (!std::regex_match(str, intRegex)) {
        return false;
    }

    try {
        std::size_t pos;
        int num = std::stoi(str, &pos);
        // 如果转换后位置不在字符串末尾，说明不是一个纯整数
        return pos == str.length();
    } catch (std::invalid_argument&) {
        return false;
    } catch (std::out_of_range&) {
        return false;
    }
}

std::string REnodeClass::REnodeToString(REnode* r ) {
  std::string retStr;
  if(r->kind == Kind::REGEXP_NONE) {
    retStr = "\\E";
  } else {
    Kind k = r->KindReturn();
    switch( k ) {
      case Kind::REGEXP_NONE:
      {
        retStr += "\\E";
        break;
      }
      // case REGEXP_allchar:
      // {
      //   retStr += ".";
      //   break;
      // }
      case Kind::REGEXP_STRING:
      {
        std::string tmp = r->Str;
        retStr += tmp.size()==1? tmp : "(" + tmp + ")";
        break;
      }
      case Kind::REGEXP_CONCAT:
      {
        retStr += "(";
        for(unsigned i=0; i<r->Children.size(); ++i) {
          //if(i != 0) retStr += ".";
          retStr += REnodeToString( r->Children[i] );
        }
        retStr += ")";
        break;
      }
      case Kind::REGEXP_UNION:
      {
        retStr += "(";
        for(unsigned i=0; i<r->Children.size(); ++i) {
          if(i != 0) retStr += "|";
          retStr += REnodeToString( r->Children[i] );
        }
        retStr += ")";
        break;
      }
      case Kind::REGEXP_INTER:
      {
        retStr += "(";
        for(unsigned i=0; i<r->Children.size(); ++i) {
          if(i != 0) retStr += "&";
          retStr += REnodeToString( r->Children[i] );
        }
        retStr += ")";
        break;
      }
      case Kind::REGEXP_STAR:
      {
        retStr += REnodeToString( r->Children[0] );
        retStr += "*";
        break;
      }
      case Kind::REGEXP_PLUS:
      {
        retStr += REnodeToString( r->Children[0] );
        retStr += "+";
        break;
      }
      case Kind::REGEXP_OPT:
      {
        retStr += REnodeToString( r->Children[0] );
        retStr += "?";
        break;
      }
      case Kind::REGEXP_CHARCLASS:
      {
        retStr += "[";
        std::stringstream ss;
        ss << r->Rune_Class.min;
        retStr += ss.str();
        retStr += "-";
        std::stringstream ss1;
        ss1 << r->Rune_Class.max;
        retStr += ss1.str();
        retStr += "]";
        break;
      }
      case Kind::REGEXP_LOOP:
      {
        uint32_t l = r->Counting.min;
        std::stringstream ss;
        ss << "(" << REnodeToString(r->Children[0]) << "){" << l << ",";
        auto u = r->Counting.max;
        ss << u;
        ss << "}";
        retStr += ss.str();
        break;
      }
      // case REGEXP_rv:
      // {
      //   retStr += "<";
      //   retStr += r[0].getConst<Rational>().getNumerator().toString();
      //   retStr += ">";
      //   break;
      // }
      case Kind::REGEXP_REPEAT:
      {
        std::stringstream ss;
        ss << "(" << REnodeToString( r->Children[0] ) << "){" << r->Counting.min << "," << r->Counting.max << "}";
        retStr += ss.str();
        break;
      }
      case Kind::REGEXP_COMPLEMENT:
      {
        retStr += "^(";
        retStr += REnodeToString( r->Children[0] );
        retStr += ")";
        break;
      }

      case Kind::REGEXP_RUNE:
      {
        std::stringstream ss;
        ss << "[" << r->Rune_Class.min << "]";
        retStr += ss.str();
        break;
      }

      case Kind::REGEXP_Lookahead:
      {
        retStr += "(?=";
        for(unsigned i=0; i<r->Children.size(); ++i) {
          //if(i != 0) retStr += ".";
          retStr += REnodeToString( r->Children[i] );
        }
        retStr += ")";
        break;
      }

      case Kind::REGEXP_NLookahead:
      {
        retStr += "(?!";
        for(unsigned i=0; i<r->Children.size(); ++i) {
          //if(i != 0) retStr += ".";
          retStr += REnodeToString( r->Children[i] );
        }
        retStr += ")";
        break;
      }

      default:
      {
        // std::stringstream ss;
        // ss << r;
        // retStr = ss.str();x
        // Assert(!utils::isRegExpKind(r.getKind()));
        // break;
      }
    }
  }
  return retStr;
}

REnodeClass::REnodeClass(std::string s){ 
  // Renode = linearize(s, BytemapRange);
  memset(ByteMap, 0, sizeof(ByteMap));
  BuildBytemap(ByteMap, BytemapRange);
  BuildBytemapToString(ByteMap);
  BytemapRangeToString(BytemapRange);
  std::cout << REnodeToString(Renode) << std::endl;
}

REnodeClass::REnodeClass(){}

void REnodeClass::BytemapRangeToString(std::set<RuneClass>& BytemapClass){
  for (auto it : BytemapClass)
    std:: cout << it.min << " " << it.max << std::endl;
}

void REnodeClass::BuildBytemapToString(uint8_t* bytemap){
  int colorl = bytemap[0];
  std::cout << "0 ~ ";
  for (int i = 0; i < 256; i++){
    if (bytemap[i] != colorl){
      std::cout << i-1 << ": " << colorl << std::endl;
      colorl = bytemap[i];
      std::cout << i << " ~ ";
    }
  }
  std::cout << "255" << ": " << colorl << std::endl;
}

void REnodeClass::RuneSequenceToString(std::map<REnode*, REnode*>& RS){
  int index = 0;
  for (auto it : RS){
    std::cout << "node" << it.first << std::endl;
    std::cout << REnodeToString(it.first) << ":  ";
    std::cout << REnodeToString(it.second) << std::endl;
    index++;
  }
}

std::string REnodeClass::ReturnLastWord(REnode* e) {
  std::string r;
  switch (e->KindReturn()){
    case Kind::REGEXP_NONE:{
      break;
    }
    case Kind::REGEXP_RUNE:{
      r.push_back(e->Rune_Class.min);
      break;
    }
    case Kind::REGEXP_CONCAT:{
      for (auto node = e->Children.rbegin(); node!= e->Children.rend(); node++){
        r = ReturnLastWord(*node);
        if (!r.empty())
          break;
      }
      break;
    }
    case Kind::REGEXP_UNION:{
      break;
    }
    case Kind::REGEXP_STAR:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
      break;
    }
    case Kind::REGEXP_PLUS:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
      break;
    }
    case Kind::REGEXP_OPT:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
      break;
    }
    case Kind::REGEXP_CHARCLASS:{
      if (e->Rune_Class.min == e->Rune_Class.max)
        r.push_back(e->Rune_Class.max);
      break;
    }
    case Kind::REGEXP_DIFF:
      break;
    case Kind::REGEXP_COMPLEMENT:
      break;
    case Kind::REGEXP_STRING:
      break;
    case Kind::REGEXP_LOOP:{
      r =  ReturnLastWord(e->Children[0]);
      if (!r.empty())
          break;
      break;
    }  
    case Kind::REGEXP_REPEAT:{
      break;
    }  
    case Kind::REGEXP_Lookbehind:{
      break;
    } 
    default:
      break;
  }
  return r;  
}

REnode*  REnodeClass::ReverseNode(REnode* e) {
  REnode* r = initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
  switch (e->KindReturn()){
    case Kind::REGEXP_NONE:{
      *r = *e;
      break;
    }
    case Kind::REGEXP_RUNE:{
      *r = *e;
      break;
    }
    case Kind::REGEXP_CONCAT:{
      r->kind = e->kind;
      r->Status = e->Status;
      for (auto node = e->Children.rbegin(); node!= e->Children.rend(); node++){
        REnode* e2 = ReverseNode(*node);
        r->Children.emplace_back(e2);
      }
      break;
    }
    case Kind::REGEXP_UNION:{
      r->kind = e->kind;
      r->Status = e->Status;
      for (auto node = e->Children.rbegin(); node!= e->Children.rend(); node++){
        REnode* e2 = ReverseNode(*node);
        r->Children.emplace_back(e2);
      }
      break;
    }
    case Kind::REGEXP_STAR:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
      r->kind = e->kind;
      r->Status = e->Status;
      REnode* e2 = ReverseNode(e->Children[0]);
      r->Children.emplace_back(e2);
      break;
    }
    case Kind::REGEXP_PLUS:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
      r->kind = e->kind;
      r->Status = e->Status;
      REnode* e2 = ReverseNode(e->Children[0]);
      r->Children.emplace_back(e2);
      break;
    }
    case Kind::REGEXP_OPT:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
      r->kind = e->kind;
      r->Status = e->Status;
      REnode* e2 = ReverseNode(e->Children[0]);
      r->Children.emplace_back(e2);
      break;
    }
    case Kind::REGEXP_CHARCLASS:{
      *r = *e;
      break;
    }
    case Kind::REGEXP_DIFF:
      break;
    case Kind::REGEXP_COMPLEMENT:
      break;
    case Kind::REGEXP_STRING:
      break;
    case Kind::REGEXP_LOOP:{
      r->kind = e->kind;
      r->Status = e->Status;
      r->Counting = e->Counting;
      REnode* e2 = ReverseNode(e->Children[0]);
      r->Children.emplace_back(e2);
      break;
    }  
    case Kind::REGEXP_REPEAT:{
      r->kind = e->kind;
      r->Status = e->Status;
      r->Counting = e->Counting;
      REnode* e2 = ReverseNode(e->Children[0]);
      r->Children.emplace_back(e2);
      break;
    }  
    case Kind::REGEXP_Lookbehind:{
      r->kind = Kind::REGEXP_Lookbehind;
      r->Status = e->Status;
      r->Counting = e->Counting;
      REnode* e2 = ReverseNode(e->Children[0]);
      r->Children.emplace_back(e2);
      break;
    } 
    default:
      break;
  }
  return r;  
}

REnode* REnodeClass::CopyREnode(REnode* e1){
  REnode* e = initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
  switch (e1->KindReturn())
  {
  case Kind::REGEXP_NONE:{
    *e = *e1; 
      break;
  }
  case Kind::REGEXP_RUNE:{
    *e = *e1;
    break;
  }
  case Kind::REGEXP_CONCAT:{
    e->kind = e1->kind;
    e->Status = e1->Status;
    for (long unsigned int i = 0; i < e1->Children.size(); i++){
      REnode* e2 = CopyREnode(e1->Children[i]);
      e->Children.emplace_back(e2);
    }
    break;
  }
  case Kind::REGEXP_UNION:{
    e->kind = e1->kind;
    e->Status = e1->Status;
    for (long unsigned int i = 0; i < e1->Children.size(); i++){
      REnode* e2 = CopyREnode(e1->Children[i]);
      e->Children.emplace_back(e2);
    }
    break;
  }
  case Kind::REGEXP_STAR:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
    e->kind = e1->kind;
    e->Status = e1->Status;
    REnode* e2 = CopyREnode(e1->Children[0]);
    e->Children.emplace_back(e2);
    break;
  }
  case Kind::REGEXP_PLUS:{
    e->kind = e1->kind;
    e->Status = e1->Status;
    REnode* e2 = CopyREnode(e1->Children[0]);
    e->Children.emplace_back(e2);
    break;
  }
  case Kind::REGEXP_OPT:{
    e->kind = e1->kind;
    e->Status = e1->Status;
    REnode* e2 = CopyREnode(e1->Children[0]);
    e->Children.emplace_back(e2);
    break;
  }
  case Kind::REGEXP_CHARCLASS:{
    *e = *e1;
    break;
  }
  case Kind::REGEXP_DIFF:
    break;
  case Kind::REGEXP_COMPLEMENT:
    break;
  case Kind::REGEXP_STRING:
    break;
  case Kind::REGEXP_LOOP:{
    e->kind = e1->kind;
    e->Status = e1->Status;
    e->Counting = e1->Counting;
    REnode* e2 = CopyREnode(e1->Children[0]);
    e->Children.emplace_back(e2);
    break;
  } 
  case Kind::REGEXP_REPEAT:{
    e->kind = e1->kind;
    e->Status = e1->Status;
    e->Counting = e1->Counting;
    REnode* e2 = CopyREnode(e1->Children[0]);
    e->Children.emplace_back(e2);
    break;
  }
  case Kind::REGEXP_Lookahead:{
    e->kind = e1->kind;
    e->Status = e1->Status;
    e->Counting = e1->Counting;
    REnode* e2 = CopyREnode(e1->Children[0]);
    e->Children.emplace_back(e2);
    break;
  }    
  default:
    break;
  }
  return e;
}

std::map<REnode*, REnode*> REnodeClass::ccontinuation(REnode* e1, unsigned int c){
  // BuildBytemapToString(this->ByteMap);
  // std::cout << REnodeToString(e1) << std::endl;
  std::map<REnode*, REnode*> RSVec;
  switch (e1->KindReturn()){
    case Kind::REGEXP_NONE:{
      break;
    }
    case Kind::REGEXP_RUNE:{
      if (e1->kToNode.find(ByteMap[c]) == e1->kToNode.end()){
        if (ByteMap[c] == 0){
          break;
        }
        else if (e1->Rune_Class.min == c){
          REnode* e2 = initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
          e2->Status = NODE_NULLABLE;
          RSVec.insert(std::make_pair(e1, e2));
          e1->kToNode.insert(std::make_pair(ByteMap[c], RSVec));
          break;
        }
      }
      else {
        RSVec = e1->kToNode[ByteMap[c]];
        break;
      }
      break;
    }
    case Kind::REGEXP_CONCAT:{
      if (e1->kToNode.find(ByteMap[c]) == e1->kToNode.end()){
        for (long unsigned int i = 0; i < e1->Children.size(); i++){
          auto RS1 = ccontinuation(e1->Children[i], c);
          // if (e1->Children[i]->Iscompute == true){
          //   REnode* e3 = initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
          //   if (i == )
          // }
          if (RS1.size() != 0){
            for (auto it : RS1){
              REnode* e2 = initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
              if (it.second->KindReturn() == Kind::REGEXP_NONE){
                if (i == e1->Children.size() - 1)
                  e2 = it.second;
                else{
                  if (i == e1->Children.size() - 2){
                    e2 = *(e1->Children.end()-1);
                  }
                  else
                    e2->Children.insert(e2->Children.end(), e1->Children.begin() + i + 1, e1->Children.end());
                }
              }
              else{
                if (i == e1->Children.size() - 1)
                  e2 = it.second;
                else{
                  e2->Children.emplace_back(it.second);
                  e2->Children.insert(e2->Children.end(), e1->Children.begin() + i + 1, e1->Children.end());
                }
              }
              isNullable(e2);
              RSVec.insert(std::make_pair(it.first, e2));
            }
          }
          if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE_NOT){
            break;
          }
        }
        e1->kToNode.insert(std::make_pair(ByteMap[c], RSVec));
      }
      else {
        RSVec = e1->kToNode[ByteMap[c]];
        break;
      }
      break;
    }
      
    case Kind::REGEXP_UNION:{
      if (e1->kToNode.find(ByteMap[c]) == e1->kToNode.end()){
        for (long unsigned int i = 0; i < e1->Children.size(); i++){
          auto RS1 = ccontinuation(e1->Children[i], c);
          if (RS1.size() != 0){
            for (auto it : RS1){
              RSVec.insert(it);
            }
          }
        }
        e1->kToNode.insert(std::make_pair(ByteMap[c], RSVec));
      }
      else{
        RSVec = e1->kToNode[ByteMap[c]];
        break;
      }
      break;
    }
    case Kind::REGEXP_INTER:{
      // TODO
      break;
    }  
    case Kind::REGEXP_STAR:{
      if (e1->kToNode.find(ByteMap[c]) == e1->kToNode.end()){
        auto RS1 = ccontinuation(e1->Children[0], c);
        if (RS1.size() != 0){
          for (auto it : RS1){
            if (it.second->KindReturn() == Kind::REGEXP_NONE){
              RSVec.insert(std::make_pair(it.first, e1));
            }
            else{
              REnode* e2 = initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
              e2->Children.emplace_back(it.second);
              e2->Children.emplace_back(e1);
              RSVec.insert(std::make_pair(it.first, e2));
              isNullable(e2);
            }
          }
          e1->kToNode.insert(std::make_pair(ByteMap[c], RSVec));
        }
      }
      else {
        RSVec = e1->kToNode[ByteMap[c]];
        break;
      }
      break;
    }
    case Kind::REGEXP_PLUS:{
      if (e1->kToNode.find(ByteMap[c]) == e1->kToNode.end()){
        e1->kind = Kind::REGEXP_CONCAT;
        e1->UnfoldNode = CopyREnode(e1->Children[0]);
        REnode* e3 = initREnode(Kind::REGEXP_STAR, RuneClass(0, 0));
        e3->Status = NODE_NULLABLE;
        e3->Children = e1->Children;
        e1->Children.pop_back();
        e1->Children.insert(e1->Children.begin(), e3);
        e1->Children.insert(e1->Children.begin(), e1->UnfoldNode);
        for (long unsigned int i = 0; i < e1->Children.size(); i++){
          auto RS1 = ccontinuation(e1->Children[i], c);
          if (RS1.size() != 0){
            for (auto it : RS1){
              REnode* e2 = initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
              if (it.second->KindReturn() == Kind::REGEXP_NONE){
                if (i == e1->Children.size() - 1)
                  e2 = it.second;
                else{
                  if (i == e1->Children.size() - 2){
                    e2 = *(e1->Children.end()-1);
                  }
                  else
                    e2->Children.insert(e2->Children.end(), e1->Children.begin() + i + 1, e1->Children.end());
                }
              }
              else{
                if (i == e1->Children.size() - 1)
                  e2 = it.second;
                else{
                  e2->Children.emplace_back(it.second);
                  e2->Children.insert(e2->Children.end(), e1->Children.begin() + i + 1, e1->Children.end());
                }
              }
              isNullable(e2);
              RSVec.insert(std::make_pair(it.first, e2));
            }
          }
          if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE_NOT){
            break;
          }
        }
        e1->kToNode.insert(std::make_pair(ByteMap[c], RSVec));
      }
      else{
        RSVec = e1->kToNode[ByteMap[c]];
        break;
      }
      break;
    }
    case Kind::REGEXP_OPT:{
      if (e1->kToNode.find(ByteMap[c]) == e1->kToNode.end()){
        auto RS1 = ccontinuation(e1->Children[0], c);
        if (RS1.size() != 0){
          RSVec = RS1;
          e1->kToNode.insert(std::make_pair(ByteMap[c], RSVec));
        }
      }
      else {
        RSVec = e1->kToNode[ByteMap[c]];
        break;
      }
      break;
    }
    case Kind::REGEXP_CHARCLASS:{
      if (e1->kToNode.find(ByteMap[c]) == e1->kToNode.end()){
        if (e1->Rune_Class.min <= c && c <= e1->Rune_Class.max){
          REnode* e2 = initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
          e2->Status = NODE_NULLABLE;
          RSVec.insert(std::make_pair(e1, e2));
          e1->kToNode.insert(std::make_pair(ByteMap[c], RSVec));
          break;
        }
      }
      else {
        RSVec = e1->kToNode[ByteMap[c]];
        break;
      }
      break;
    }
    case Kind::REGEXP_DIFF:
      break;
    case Kind::REGEXP_COMPLEMENT:
      break;
    case Kind::REGEXP_STRING:
      break;
    case Kind::REGEXP_LOOP:{
      if (e1->kToNode.find(ByteMap[c]) == e1->kToNode.end()){
        if (e1->UnfoldNode == nullptr)
          e1->UnfoldNode = CopyREnode(e1->Children[0]);
        auto RS1 = ccontinuation(e1->UnfoldNode, c);
        if (RS1.size() != 0){
          auto e3 = initREnode(Kind::REGEXP_LOOP, RuneClass(0, 0)); // e1 : r{d, d} e3 : r{d-1, d-1}
          e3->Children = e1->Children;
          e3->Status = e1->Status;
          if (e1->Counting.min > 0){
            e3->Counting = RuneClass(e1->Counting.min - 1, e1->Counting.max - 1);
          }
          else{
            e3->Counting = RuneClass(0, e1->Counting.max - 1);
          }
          if (e3->Counting.max == 0){
           e3->kind = Kind::REGEXP_NONE;
           e1->Status = NODE_NULLABLE;
          }
          for (auto it : RS1){
            if (it.second->KindReturn() == Kind::REGEXP_NONE){
              RSVec.insert(std::make_pair(it.first, e3));
            }
            else{
              if (e3->kind == Kind::REGEXP_NONE){
                REnode* e2 =  it.second;
                RSVec.insert(std::make_pair(it.first, e2));
              }
              else{
                REnode* e2 = initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
                e2->Children.emplace_back(it.second);
                e2->Children.emplace_back(e3);
                isNullable(e2);
                RSVec.insert(std::make_pair(it.first, e2));
              }
            }
          }
          e1->kToNode.insert(std::make_pair(ByteMap[c], RSVec));
        }
      }
      else {
        RSVec = e1->kToNode[ByteMap[c]];
        break;
      }
      break;
    }
    case Kind::REGEXP_REPEAT:{
      if (e1->kToNode.find(ByteMap[c]) == e1->kToNode.end()){
        if (e1->UnfoldNode == nullptr)
          e1->UnfoldNode = CopyREnode(e1->Children[0]);
        auto RS1 = ccontinuation(e1->UnfoldNode, c);
        if (RS1.size() != 0){
          auto e3 = initREnode(Kind::REGEXP_REPEAT, RuneClass(0, 0)); // e1 : r{d, d} e3 : r{d-1, d-1}
          e3->Children = e1->Children;
          e3->Status = e1->Status;
          e3->Counting = RuneClass(e1->Counting.min - 1, e1->Counting.max - 1);
          if (e3->Counting.min == 0){
            e3->kind = Kind::REGEXP_NONE;
            e3->Status = NODE_NULLABLE;
          }
          for (auto it : RS1){
            if (it.second->KindReturn() == Kind::REGEXP_NONE){
              RSVec.insert(std::make_pair(it.first, e3));
            }
            else{
              if (e3->kind == Kind::REGEXP_NONE){
                REnode* e2 = it.second;
                RSVec.insert(std::make_pair(it.first, e2));
              }
              else{
                REnode* e2 = initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
                e2->Children.emplace_back(it.second);
                e2->Children.emplace_back(e3);
                isNullable(e2);
                RSVec.insert(std::make_pair(it.first, e2));
              }
            }
          }
          e1->kToNode.insert(std::make_pair(ByteMap[c], RSVec));
        }
      }
      else {
        RSVec = e1->kToNode[ByteMap[c]];
        break;
      }
      break;
    }
    case Kind::REGEXP_Lookahead:{
      if (e1->kToNode.find(ByteMap[c]) == e1->kToNode.end()){
        auto RS1 = ccontinuation(e1->Children[0], c);
        if (RS1.size() != 0){
          for (auto it : RS1){
            if (it.second->KindReturn() == Kind::REGEXP_NONE){
              RSVec.insert(std::make_pair(it.first, it.second));
            }
            else{
              REnode* e2 = initREnode(Kind::REGEXP_Lookahead, RuneClass(0, 0));
              e2->Children.emplace_back(it.second);
              RSVec.insert(std::make_pair(it.first, e2));
              isNullable(e2);
            }
          }
          e1->kToNode.insert(std::make_pair(ByteMap[c], RSVec));
        }
      }
      else {
        RSVec = e1->kToNode[ByteMap[c]];
        break;
      }
      break;
    }
    default: break;
  }
  return RSVec;
}

void REnodeClass::isNullable(REnode *e1){
  if (e1->Status != NODE_NULLABLE_UNKNOWN)
    return;
  switch (e1->KindReturn())
  {
  case Kind::REGEXP_NONE:{
    e1->Status = NODE_STATUS::NODE_NULLABLE;
    break;
  }
  case Kind::REGEXP_RUNE:{
    e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
    break;
  }
  case Kind::REGEXP_CONCAT:{
    e1->Status = NODE_STATUS::NODE_NULLABLE;
    for (long unsigned int i = 0; i < e1->Children.size(); i++){
      isNullable(e1->Children[i]);
      if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE_NOT){
        e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
        break;
      }
    }
    break;
  }
  case Kind::REGEXP_UNION:{
    for (long unsigned int i = 0; i < e1->Children.size(); i++){
      isNullable(e1->Children[i]);
      if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        break;
      }
    }
    e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
    break;
  }
  case Kind::REGEXP_STAR:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
    e1->Status = NODE_STATUS::NODE_NULLABLE;
    isNullable(e1->Children[0]);
    break;
  }
  case Kind::REGEXP_PLUS:{
    isNullable(e1->Children[0]);
    if (e1->Children[0]->Status == NODE_STATUS::NODE_NULLABLE){
      e1->Status = NODE_STATUS::NODE_NULLABLE;
    }
    else{
      e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
    }
    break;
  }
  case Kind::REGEXP_OPT:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
    e1->Status = NODE_STATUS::NODE_NULLABLE;
    isNullable(e1->Children[0]);
    break;
  }
  case Kind::REGEXP_CHARCLASS:{
    e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
    break;
  }
  case Kind::REGEXP_DIFF:
    break;
  case Kind::REGEXP_COMPLEMENT:
    break;
  case Kind::REGEXP_STRING:
    break;
  case Kind::REGEXP_LOOP:{
    isNullable(e1->Children[0]);
    if (e1->Children[0]->Status == NODE_STATUS::NODE_NULLABLE){
      e1->Status = NODE_STATUS::NODE_NULLABLE;
    }
    else if (e1->Counting.min == 0){
      e1->Status = NODE_STATUS::NODE_NULLABLE;
    }
    else {
      e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
    }
    break;
  }
  case Kind::REGEXP_REPEAT:{
    isNullable(e1->Children[0]);
    if (e1->Children[0]->Status == NODE_STATUS::NODE_NULLABLE){
      e1->Status = NODE_STATUS::NODE_NULLABLE;
    }
    else{
      e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
    }
    break;
  }  
  case Kind::REGEXP_Lookahead:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
    isNullable(e1->Children[0]);
    e1->Status = NODE_STATUS::NODE_NULLABLE;
    break;
  }
  default:
    break;
  }
}

bool RegExpSymbolic::AC_include(Node e1, Node e2) {
  std::set<RuneClass> BytemapRange;
  REnodeClass REClass = REnodeClass("");
  // REnode REnode2 = linearize(e1);
  return true;
}

bool RegExpSymbolic::FULLMATCH(std::wstring r, std::string str) {
  auto Pa = Parer(r, 0);
  REnodeClass REClass = Pa.Re;
  auto e1 = REClass.Renode;
  std::vector<uint8_t> uvec;
  std::map<REnode*, REnode*> RS2;
  RS2.insert(std::make_pair(e1, e1));
  for (uint8_t itc : str){
    std::map<REnode*, REnode*> RS3;
    std::cout << "matching: " << int(itc) << std::endl;
    for (auto it : RS2){
      auto RS1 = REClass.ccontinuation(it.second, itc);
      // REClass.RuneSequenceToString(RS1);
      for (auto IT : RS1)
        RS3.insert(IT);
    }    
    RS2 = RS3;
    REClass.RuneSequenceToString(RS2);
    if (RS2.size() == 0){
      std::cout << "match failed" << std::endl;
      return false;
    }
  }
  for (auto it : RS2){
    if (it.second->Status == NODE_STATUS::NODE_NULLABLE){
      std::cout << "match successfully" << std::endl;
      return true;
    }
  }
  std::cout << "match failed" << std::endl;
  return false;
}

void RegExpSymbolic::DumpAlphabet(std::set<uint8_t>& A){
  std::cout << "The alphabet: ";
  for (auto it : A){
    std::cout << int(it) << " ";
  }
  std::cout << "" << std::endl;
}

RegExpSymbolic::DFA::DFA(){};

RegExpSymbolic::DFA::DFA(REnodeClass e){
  IndexMax = 0;
  REClass = e;
  std::map<REnode*, REnode*> RS2;
  RS2.insert(std::make_pair(e.Renode, e.Renode));
  DState = new DFAState(Begin, RS2);
  for (auto it : DState->NodeSequence){
    REClass.isNullable(it.second);
    if (it.second->Status == NODE_STATUS::NODE_NULLABLE){
      DState->DFlag = Match;
    }
  }
}

RegExpSymbolic::DFA::DFAState* RegExpSymbolic::DFA::StepOneByte(DFAState* BeginState, uint8_t itc) {
  if (BeginState->Next.find(REClass.ByteMap[itc]) != BeginState->Next.end()){
    return BeginState->Next.find(REClass.ByteMap[itc])->second;
  }
  std::map<REnode*, REnode*> RS3;
  DFAState *NS = new DFAState(Normal, RS3);
  for (auto it : BeginState->NodeSequence){
    if (it.second->KindReturn() == Kind::REGEXP_NONE)
      continue;  
    auto RS1 = REClass.ccontinuation(it.second, itc);
    for (auto IT : RS1){
      if (Node2Index.find(IT.first) == Node2Index.end()){
        Node2Index.insert(std::make_pair(IT.first, IndexMax));
        IndexMax++;
      }
      if (NS->NodeSequence.find(IT.first) == NS->NodeSequence.end()){
        NS->NodeSequence.insert(IT);
        NS->IndexSequence.insert(Node2Index.find(IT.first)->second);
      }
    }  
  }
  if (NS->NodeSequence.size() == 0){
    // std::cout << "match failed" << std::endl;
    return nullptr;
  }
  else{
    if (!BeginState->IndexSequence.empty()){
      NS = FindInDFACache(dfacache, NS);
      BeginState->Next.insert(std::make_pair(REClass.ByteMap[itc], NS));
      BeginState = NS;
    }
    else{
      NS = FindInDFACache(dfacache, NS);
      BeginState = NS;
    }
    
  }
  // DumpState(BeginState);
  // REClass.RuneSequenceToString(BeginState->NodeSequence);
  for (auto it : BeginState->NodeSequence){
    if (it.second->Status == NODE_STATUS::NODE_NULLABLE){
      // std::cout << "match successfully" << std::endl;
      BeginState->DFlag = Match;
      break;
    }
    REClass.isNullable(it.second);
    if (it.second->Status == NODE_STATUS::NODE_NULLABLE){
      BeginState->DFlag = Match;
      break;
    }
  }
  return BeginState;
}


// bool RegExpSymbolic::DFA::Fullmatch(std::wstring Pattern, std::string str) {
//   REClass = Parer(Pattern).Re;
//   auto e1 = REClass.Renode;
//   std::vector<uint8_t> uvec;
//   std::map<REnode*, REnode*> RS2;
//   RS2.insert(std::make_pair(e1, e1));
//   DFAState* BeginState = new DFAState(Begin, RS2);
//   for (uint8_t itc : str){
//     if (BeginState->Next.find(itc) != BeginState->Next.end()){
//       BeginState = BeginState->Next[itc];
//       continue;
//     }
//     std::map<REnode*, REnode*> RS3;
//     DFAState *NS = new DFAState(Begin, RS3);
//     std::cout << "matching: " << int(itc) << std::endl;
//     for (auto it : BeginState->NodeSequence){
//       std::cout << "begin: " << REClass.REnodeToString(it.second) << std::endl;
//       auto RS1 = REClass.ccontinuation(it.second, itc);
//       REClass.RuneSequenceToString(RS1);
//       for (auto IT : RS1){
//         if (Node2Index.find(IT.first) == Node2Index.end()){
//           Node2Index.insert(std::make_pair(IT.first, IndexMax));
//           IndexMax++;
//         }
//         if (NS->NodeSequence.find(IT.first) == NS->NodeSequence.end()){
//           NS->NodeSequence.insert(IT);
//           NS->IndexSequence.insert(Node2Index.find(IT.first)->second);
//         }
//       }  
//     }
//     if (NS->NodeSequence.size() == 0){
//       std::cout << "match failed" << std::endl;
//       return false;
//     }
//     else{
//       NS = FindInDFACache(dfacache, NS);
//       BeginState->Next.insert(std::make_pair(itc, NS));
//       BeginState = NS;
//     }
//     DumpState(BeginState);
//     // REClass.RuneSequenceToString(BeginState->NodeSequence);  
//   }
//   for (auto it : BeginState->NodeSequence){
//     REClass.isNullable(it.second);
//     if (it.second->Status == NODE_STATUS::NODE_NULLABLE){
//       std::cout << "match successfully" << std::endl;
//       return true;
//     }
//   }
//   std::cout << "match failed" << std::endl;
//   return false;
// }

void RegExpSymbolic::DFA::DumpState(DFAState* s){
  std::cout << "The node index: ";
  for (auto i : s->IndexSequence){
    std::cout << i << " ";
  }
  std::cout << "" << std::endl;
}

RegExpSymbolic::DFA::DFACache* RegExpSymbolic::DFA::Step2Left(DFACache* DC, int c){
  DFACache* dc = DC;
  for (int i = 0; i < c; i++){
    if (dc->left == nullptr){
      dc->left = new DFACache(IsNULL, nullptr, nullptr);
      dc = dc->left;
    }
    else{
      dc = dc->left;
    }
  }
  return dc;
}

RegExpSymbolic::DFA::DFACache* RegExpSymbolic::DFA::Step2Right(DFACache* DC, int c){
  DFACache* dc = DC;
  for (int i = 0; i < c; i++){
    if (dc->right == nullptr){
      dc->right = new DFACache(IsNULL, nullptr, nullptr);
      dc = dc->right;
    }
    else{
      dc = dc->right;
    }
  }
  return dc;
}

RegExpSymbolic::DFA::DFAState* RegExpSymbolic::DFA::FindInDFACache(DFACache* DC, DFAState* s){
  int BeginiIndex = 0;
  for (auto i : s->IndexSequence){
    if (i - BeginiIndex > 0){
      DC = Step2Left(DC, i - BeginiIndex);
    }
    DC = Step2Right(DC, 1);
    BeginiIndex = i;
  }
  if (DC->DCFlage == IsNotNULL){
    return DC->DS;
  }else{
    DC->DCFlage = IsNotNULL;
    DC->DS = s;
    return s;
  }
}

void RegExpSymbolic::DFA::MaintainNode2Index(DFAState* NS, std::map<REnode*, REnode*> RS1){
  for (auto IT : RS1){
    if (Node2Index.find(IT.first) == Node2Index.end()){
      Node2Index.insert(std::make_pair(IT.first, IndexMax));
      IndexMax++;
    }
    if (NS->NodeSequence.find(IT.first) == NS->NodeSequence.end()){
      NS->NodeSequence.insert(IT);
      NS->IndexSequence.insert(Node2Index.find(IT.first)->second);
    }
  }  
}

void RegExpSymbolic::IntersectionDFA::ComputeAlphabet(std::set<uint8_t>& A1, uint8_t* ByteMap1, uint8_t* ByteMap2){
  std::set<uint8_t> color_set1;
  color_set1.insert(ByteMap1[0]);
  if (ByteMap1[0] != 0 && ByteMap2[0] != 0)
    Alphabet.insert(0);
  for (int i = 0; i < 256; i++){
    if (color_set1.find(ByteMap1[i]) != color_set1.end()) 
      continue;
    else{
      color_set1.insert(ByteMap1[i]);
      if (ByteMap1[i] != 0 && ByteMap2[i] != 0)
        Alphabet.insert(i);
    }
  }

  std::set<uint8_t> color_set2;
  color_set2.insert(ByteMap2[0]);
  if (ByteMap2[0] != 0 && ByteMap1[0] != 0)
    Alphabet.insert(0);
  for (int i = 0; i < 256; i++){
    if (color_set2.find(ByteMap2[i]) != color_set2.end()) 
      continue;
    else{
      color_set2.insert(ByteMap2[i]);
      if (ByteMap2[i] != 0 && ByteMap1[i] != 0)
        Alphabet.insert(i);
    }
  }
}

RegExpSymbolic::IntersectionDFA::IntersectionDFA(Node r1, Node r2){
  e1 = REnodeClass("");
  e2 = REnodeClass("");
  D1 = DFA(e1);
  D2 = DFA(e2);
  SSBegin = new SimulationState(Begin, D1.DState, D2.DState);
  TODOCache.push(*SSBegin);
  ComputeAlphabet(Alphabet, e1.ByteMap, e2.ByteMap);
  std::copy(std::begin(e1.ByteMap),std::end(e1.ByteMap),std::begin(ByteMap));
  e1.BuildBytemap(ByteMap, e2.BytemapRange);
  e1.BuildBytemapToString(ByteMap);
  RegExpSymbolic::DumpAlphabet(Alphabet);
}



bool RegExpSymbolic::IntersectionDFA::Intersect(){
  DumpSimulationState(SSBegin);
  if (IsIntersect(SSBegin))
    return true;
  else
    return false;  
}

bool RegExpSymbolic::IntersectionDFA::IsIntersect(SimulationState* s){
  DumpSimulationState(s);
  DoneCache.insert(std::make_pair(*s, s));
  s->IsIntersect = false;
  for (auto c : Alphabet){
    if (s->byte2state.find(ByteMap[c]) == s->byte2state.end()){
      DFA::DFA::DFAState* nextd1 = D1.StepOneByte(s->d1, c);
      DFA::DFA::DFAState* nextd2 = D2.StepOneByte(s->d2, c);
      if (nextd1 == nullptr || nextd2 == nullptr){
        continue;
      }
      std::cout << "matching: " << int(c) << " " << std::endl;
      std::cout << "D1 match flag: " << nextd1->DFlag << " D2 match flag: " << nextd2->DFlag << std::endl; 
      std::cout << "D1 " << nextd1 << std::endl;   
      std::cout << "D2 " << nextd2 << std::endl;   
      D1.DumpState(nextd1);
      e1.RuneSequenceToString(nextd1->NodeSequence);
      D2.DumpState(nextd2);
      auto ns = new SimulationState(Normal, nextd1, nextd2);
      // DumpSimulationState(ns);
      auto itc = DoneCache.find(*ns);
      if (itc != DoneCache.end()){
        if (itc->second->IsIntersect == true){
          s->IsIntersect = true;
          s->byte2state.insert(std::make_pair(ByteMap[c], itc->second));
        }
        else if (itc->second->IsDone == true && itc->second->IsIntersect == false)
          s->byte2state.insert(std::make_pair(ByteMap[c], nullptr));  
        else{
          s->byte2state.insert(std::make_pair(ByteMap[c], itc->second));  
        }  
      }
      else{
        if (nextd1->DFlag == RegExpSymbolic::DFA::Normal && nextd2->DFlag == RegExpSymbolic::DFA::Normal)
        {
          s->byte2state.insert(std::make_pair(ByteMap[c], ns));
          ns->IFlag = Normal;
          if (IsIntersect(ns))
            s->IsIntersect = true;
          else
            continue;  
        }
        else if (nextd1->DFlag == RegExpSymbolic::DFA::Match && nextd2->DFlag == RegExpSymbolic::DFA::Match){
          s->byte2state.insert(std::make_pair(ByteMap[c], ns));
          ns->IFlag = Match;
          s->IsIntersect = true;
          IsIntersect(ns);
        }
        else{
          s->byte2state.insert(std::make_pair(ByteMap[c], ns));
          ns->IFlag = Normal;
          if (IsIntersect(ns))
            s->IsIntersect = true;
          else
            continue;  
        }
      }
    }
  }
  s->IsDone = true;
  if (s->IsIntersect){
    return true;
  }
  else
    return false;
}

void RegExpSymbolic::IntersectionDFA::DumpSimulationState(SimulationState* s){
  std::cout << "SimulationState: " << s << " IFlag: " << s->IFlag << " IsIntersect: " << s->IsIntersect << \
  " IsDone" << s->IsDone << std::endl;
  D1.DumpState(s->d1);
  D2.DumpState(s->d2);
}





}  // namespace solverbin