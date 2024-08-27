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
            DFA_State.emplace_back(FindInNFACache(nfacache, i));
          }
          if (i->Ccontinuation->Isnullable){
            i->DFlag = Match;
            return false;
          } else
            i->DFlag = Normal;
        }
        else
          continue;
      }
    }
    return true;
  }
}