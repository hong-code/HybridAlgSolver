#include "PositionAutomaton.h"
#include "../solver.h"

#include <cmath>
#include <map>
#include <list>
#include <bitset>



using namespace solverbin;


namespace solverbin{
  std::vector<RuneClass> RangeClass1 = {RuneClass(0, 127) };
  std::vector<RuneClass> RangeClass2 = {RuneClass(194, 223), RuneClass(128, 191) };
  std::vector<RuneClass> RangeClass3 = {RuneClass(224, 224), RuneClass(160, 191), RuneClass(128, 191) };
  std::vector<RuneClass> RangeClass4 = {RuneClass(225, 239), RuneClass(128, 191), RuneClass(128, 191) };
  std::vector<RuneClass> RangeClass5 = {RuneClass(240, 240), RuneClass(144, 191), RuneClass(128, 191), RuneClass(128, 191) };
  std::vector<RuneClass> RangeClass6 = {RuneClass(241, 243), RuneClass(128, 191), RuneClass(128, 191), RuneClass(128, 191) };
  std::vector<RuneClass> RangeClass7 = {RuneClass(244, 244), RuneClass(128, 143), RuneClass(128, 191), RuneClass(128, 191) };


  std::set<DFA::DFAState*> DFAStateSet;


  std::pair<uint8_t, std::pair<uint8_t, RuneClass>> ComputeAttribute(uint8_t Position, uint8_t Kind, int c){
    std::pair<uint8_t, std::pair<uint8_t, RuneClass>>  Attribute;
    bool NewBegin = false;
    switch (Kind)
    {
    case 0: {
      NewBegin = true;
      break;
    }  
    case 1:{
      if (Position == 1) {
        Attribute.first = 2;
        Attribute.second.first = 1;
        Attribute.second.second = RuneClass(0, 244);
      }
      else if (Position == 2) NewBegin = true;
      break;
    }
    case 2:{
        if (Position == 1) {
          Attribute.first = 2;
          Attribute.second.first = 2;
          Attribute.second.second = RuneClass(128, 191);
        }
        else if (Position == 2) {
          Attribute.first = 3;
          Attribute.second.first = 2;
          Attribute.second.second = RuneClass(0, 244);
        }
        else if (Position == 3) NewBegin = true;
        break;
      }
    case 3:{
        if (Position == 1) {
          Attribute.first = 2;
          Attribute.second.first = 3;
          Attribute.second.second = RuneClass(128, 191);
        }
        else if (Position == 2) {
          Attribute.first = 3;
          Attribute.second.first = 3;
          Attribute.second.second = RuneClass(0, 244);
        }
        else if (Position == 3) NewBegin = true;
        break;
      }
    case 4:{
        if (Position == 1) {
          Attribute.first = 2;
          Attribute.second.first = 4;
          Attribute.second.second = RuneClass(128, 191);
        }
        else if (Position == 2) {
          Attribute.first = 3;
          Attribute.second.first = 4;
          Attribute.second.second = RuneClass(128, 191);
        }
        else if (Position == 3) {
          Attribute.first = 4;
          Attribute.second.first = 4;
          Attribute.second.second = RuneClass(0, 244);
        }
        else if (Position == 4) NewBegin = true;
        break;
      }
    case 5:{
        if (Position == 1) {
          Attribute.first = 2;
          Attribute.second.first = 5;
          Attribute.second.second = RuneClass(128, 191);
        }
        else if (Position == 2) {
          Attribute.first = 3;
          Attribute.second.first = 5;
          Attribute.second.second = RuneClass(128, 191);
        }
        else if (Position == 3) {
          Attribute.first = 4;
          Attribute.second.first = 5;
          Attribute.second.second = RuneClass(0, 244);
        }
        else if (Position == 4) NewBegin = true;
        break;
      }
    case 6:{
        if (Position == 1) {
          Attribute.first = 2;
          Attribute.second.first = 6;
          Attribute.second.second = RuneClass(128, 191);
        }
        else if (Position == 2) {
          Attribute.first = 3;
          Attribute.second.first = 6;
          Attribute.second.second = RuneClass(128, 191);
        }
        else if (Position == 3) {
          Attribute.first = 4;
          Attribute.second.first = 6;
          Attribute.second.second = RuneClass(0, 244);
        }
        else if (Position == 4) NewBegin = true;
        break;
      }
    default:
      break;
    }
    if (NewBegin) {
      if (c >= 0 && c <= 127) {
        Attribute.first = 1;
        Attribute.second.first = 0;
        Attribute.second.second = RuneClass(0, 244);
      }
      else if (c >= 194 && c <= 223) { 
        Attribute.first = 1;
        Attribute.second.first = 1;
        Attribute.second.second = RuneClass(128, 191);  
      }
      else if (c == 224) {
        Attribute.first = 1;
        Attribute.second.first = 2;
        Attribute.second.second = RuneClass(160, 191);
      }
      else if (c >= 225 && c <= 239) {
        Attribute.first = 1;
        Attribute.second.first = 3;
        Attribute.second.second = RuneClass(128, 191);
      }
      else if (c >= 240 && c <= 240) {
        Attribute.first = 1;
        Attribute.second.first = 4;
        Attribute.second.second = RuneClass(144, 191);
      }
      else if (c >= 241 && c <= 243) {
        Attribute.first = 1;
        Attribute.second.first = 5;
        Attribute.second.second = RuneClass(128, 191);
      }
      else if (c == 244) {
        Attribute.first = 1;
        Attribute.second.first = 6;
        Attribute.second.second = RuneClass(128, 143);
      }
    }
    return Attribute;
  }

  void CompleteStr(uint8_t Position, uint8_t Kind, std::string &suffix){
    switch (Kind)
    {
    case 0:
      return;
    case 1:{
      if (Position == 1) {
        suffix.push_back(128);
      break;
    }
    case 2:{
        if (Position == 1) { 
          suffix.push_back(160); suffix.push_back(128);
        }
        else if (Position == 2) {
          suffix.push_back(128);
        }
        break;
      }
    case 3:{
        if (Position == 1) {
          suffix.push_back(128); suffix.push_back(128);
        }
        else if (Position == 2) {
          suffix.push_back(128);
        }
        break;
      }
    case 4:{
        if (Position == 1) {
          suffix.push_back(144); suffix.push_back(128); suffix.push_back(128);
        }
        else if (Position == 2){
          suffix.push_back(128); suffix.push_back(128);
        }
        else if (Position == 3)
          suffix.push_back(128);
        break;
      }
    case 5:{
        if (Position == 1) {
          suffix.push_back(128); suffix.push_back(128); suffix.push_back(128);
        }
        else if (Position == 2){
          suffix.push_back(128); suffix.push_back(128);
        }
        else if (Position == 3)
          suffix.push_back(128);
        break;
      }
    case 6:{
        if (Position == 1) {
          suffix.push_back(128); suffix.push_back(128); suffix.push_back(128);
        }
        else if (Position == 2){
          suffix.push_back(128); suffix.push_back(128);
        }
        else if (Position == 3)
          suffix.push_back(128);
        break;
      }
    default:
      break;
    }
  }
}


  bool DFA::CheckOneByte(DFAState* DFAState, uint8_t Position, uint8_t Kind, RuneClass RC, std::string &suffix){
    for (int c = RC.min; c <= RC.max; c++) {
      if (RC.min == 0 && RC.max == 244 && c == 128) {
        c = 194;
      }
      // if (c == 10)
      //   continue;
      auto NState = StepOneByte(DFAState, c);
      if (NState == nullptr){
        suffix.push_back(c);
        CompleteStr(Position, Kind, suffix);
        return true;
      }
      if (NState->DFlag == DFA::Match || DFAStateSet.find(NState) != DFAStateSet.end()) {
        continue;
      }
      DFAStateSet.insert(NState);
      auto Attr = ComputeAttribute(Position, Kind, c);
      suffix.push_back(c);
      return true;
      // if (CheckOneByte(NState, Attr.first, Attr.second.first, Attr.second.second, suffix)) {
      //   return true;
      // }
      // else {
      //   suffix.pop_back();
      //   continue;
      // }
    }
    return false;
  }


  bool DFA::Complement(DFAState* Init_state, std::string Complement_str, std::string &suffix){
    // auto DFAClass = new DFA();
    DFAState* CurrState = Init_state;
    DFAState* NState;
    bool IsPrefixMatch = false;
    // std::vector<State*> DFA_State = Init_state->FirstSet;
    for (auto c : Complement_str){
      NState = StepOneByte(CurrState, c);
      CurrState = NState;
      if (NState == nullptr)
        return false;
      // DumpState(NState);
      if (NState->DFlag == DFA::Match){
        IsPrefixMatch = true;
      }
      else
        continue;

    }
    // return true;
    if (IsPrefixMatch)
      CheckOneByte(CurrState, 1, 0, RuneClass(0, 244), suffix);
    return IsPrefixMatch;
  }
}