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

  bool CheckOneByte(std::vector<FollowAtomata::State*> DFAState, uint8_t c, RuneClass RC, std::string &suffix){
    return false;
  }


  bool FollowAtomata::Complement(FollowAtomata::State* Init_state, std::string Complement_str, std::string &suffix){
    // auto DFAClass = new DFA();
    std::vector<State*> DFA_State = Init_state->FirstSet;
    for (auto c : Complement_str){
      std::vector<State*> DFA_NextState;
      for (auto i : DFA_State){
        if (c >= i->ValideRange.min && c <= i->ValideRange.max){
          if (i->FirstSet.empty()){
            auto Tuple = FirstNode(i->Ccontinuation);
            i->FirstSet = Tuple.second;
            i->FirstSet.insert(i->FirstSet.end(), Tuple.first.begin(), Tuple.first.end());
            if (i->Ccontinuation->Isnullable){
              i->DFlag = Match;
            } else
              i->DFlag = Normal;
            auto NFASTATE = FindInNFACache(nfacache, i);
            DFA_NextState.insert(DFA_NextState.end(), NFASTATE->FirstSet.begin(), NFASTATE->FirstSet.end());
          } 
          else {
            DFA_NextState.insert(DFA_NextState.end(), i->FirstSet.begin(), i->FirstSet.end());
          }
        }
        else
          continue;
      }
      if (DFA_NextState.empty())
        return false;
      else {
        DFA_State = DFA_NextState;
        DFA_NextState.clear();
      }  
      
    }
    bool IsMatch = false;
    for (int c = 0; c <= 244; c++) {
      for (auto state : DFA_State) {
        if (c >= state->ValideRange.min && c <= state->ValideRange.max) {
          IsMatch = true;
          break;
        }
      }
      if (!IsMatch) {
        if (c >= 0 && c <= 127) {
          suffix.push_back(c);
        }
        else if (c >= 194 && c <= 223) {
          suffix.push_back(c); suffix.push_back(128);
        }
        else if (c == 224) {
          suffix.push_back(c); suffix.push_back(160); suffix.push_back(128);
        }
        else if (c >= 225 && c <= 239) {
          suffix.push_back(c); suffix.push_back(128); suffix.push_back(128);
        }
        else if (c == 240) {
          suffix.push_back(c); suffix.push_back(144); suffix.push_back(128); suffix.push_back(128);
        }
        else if (c >= 241 && c <= 244){
          suffix.push_back(c); suffix.push_back(128); suffix.push_back(128); suffix.push_back(128);
        }
        else 
          continue;
        break;
      }
      IsMatch = false;
    }
    return !IsMatch;
  }
}