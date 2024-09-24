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


  bool DFA::Complement(DFAState* Init_state, std::string Complement_str, std::string &suffix){
    // auto DFAClass = new DFA();
    DFAState* CurrState = Init_state;
    DFAState* NState;
    // std::vector<State*> DFA_State = Init_state->FirstSet;
    for (auto c : Complement_str){
      NState = StepOneByte(CurrState, c);
      CurrState = NState;
      if (NState->DFlag == DFA::Match){
        // return false;
      }
      else
        continue;

    }
    bool IsMatch = false;
    // for (int c = 0; c <= 244; c++) {
    //   for (auto state : DFA_State) {
    //     if (c >= state->ValideRange.min && c <= state->ValideRange.max) {
    //       IsMatch = true;
    //       break;
    //     }
    //   }
    //   if (!IsMatch) {
    //     if (c >= 0 && c <= 127) {
    //       suffix.push_back(c);
    //     }
    //     else if (c >= 194 && c <= 223) {
    //       suffix.push_back(c); suffix.push_back(128);
    //     }
    //     else if (c == 224) {
    //       suffix.push_back(c); suffix.push_back(160); suffix.push_back(128);
    //     }
    //     else if (c >= 225 && c <= 239) {
    //       suffix.push_back(c); suffix.push_back(128); suffix.push_back(128);
    //     }
    //     else if (c == 240) {
    //       suffix.push_back(c); suffix.push_back(144); suffix.push_back(128); suffix.push_back(128);
    //     }
    //     else if (c >= 241 && c <= 244){
    //       suffix.push_back(c); suffix.push_back(128); suffix.push_back(128); suffix.push_back(128);
    //     }
    //     else 
    //       continue;
    //     break;
    //   }
    //   IsMatch = false;
    // }
    return !IsMatch;
  }
}