#include "PositionAutomaton.h"
#include "../solver.h"

#include <cmath>
#include <map>
#include <list>
#include <bitset>



using namespace solverbin;


namespace solverbin{
  bool FollowAtomata::Complement(FollowAtomata::State* Init_state, std::string Complement_str){
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
    return true;
  }
}