#include "regexp_symbolic.h"
#include "../solver.h"

#include <cmath>
#include <map>
#include <list>
#include <bitset>

namespace solverbin{

  bool RegExpSymbolic::IntersectionK::IfMatch(SimulationState* SS){
    while (SS != nullptr){
      if (SS->NS->NFlag == RegExpSymbolic::FollowAtomata::Match){
        SS = SS->Next;
        continue;
      }
      else {
        return false;
      }
    }
    return true;
  }

  bool RegExpSymbolic::IntersectionK::ComputAllState(std::vector<std::set<RegExpSymbolic::FollowAtomata::NFAState*>> NextV, int i, SimulationState* s, SimulationState* ns, SimulationCache* SC){
    if (i == 0)
      for (auto it : NextV[0]){
        s->NS = it;
        i++;
        auto Ca = SC->NS2Cache.find(it);
        s->Next = (SimulationState*)malloc(sizeof(SimulationState));
        if (Ca == SC->NS2Cache.end())
          if (ComputAllState(NextV, i, s, s->Next, nullptr))
            return true;
        else
          if (ComputAllState(NextV, i, s, s->Next, Ca->second));
            return true;
      }
    else if (i == RegExN){
      if (SC == nullptr){
        if (IfMatch(s)){
          return true;
        }
        else {
          IntersectionK(s);
        }
      }
    }  
    else {
      for (auto it : NextV[i]){
        ns->NS = it;
        i++;
        ns->Next = (SimulationState*)malloc(sizeof(SimulationState));
        auto Ca = SC->NS2Cache.find(it);
        if (Ca == SC->NS2Cache.end())
          if (ComputAllState(NextV, i, s, ns->Next, nullptr))
            return true;
        else
          if (ComputAllState(NextV, i, s, ns->Next, Ca->second));
            return true;
      }
    }
    return false;
  }

  bool RegExpSymbolic::IntersectionK::IsEmptyStateIn(std::vector<std::set<RegExpSymbolic::FollowAtomata::NFAState*>> NextV){
    for (auto it : NextV){
      if (it.empty())
        return false;
    }
    return true;
  }

  void RegExpSymbolic::IntersectionK::DumpSimulationState(SimulationState* s){
    while (s != nullptr){
      std::cout << s->NS->Node2Continuation.first << ": continuation" <<  REnodeClass::REnodeToString(s->NS->Node2Continuation.second) << std::endl;
      FollowAtomata::DumpState(s->NS);
      s = s->Next;
    }
  }

  bool RegExpSymbolic::IntersectionK::IsinAlphabet(uint8_t k, std::vector<REnodeClass> REClassList){
    for (auto it : REClassList){
      if (it.ByteMap[k] == 0){
        return false;
      }
    }
    return true;
  }

  void RegExpSymbolic::IntersectionK::ComputeAlphabet(std::vector<REnodeClass> REClassList){
    for (auto it : REClassList){
      std::set<uint8_t> color_set1;
      color_set1.insert(it.ByteMap[0]);
      if (IsinAlphabet(0, REClassList))
        Alphabet.insert(0);
      for (int i = 0; i < 256; i++){
        if (color_set1.find(it.ByteMap[i]) != color_set1.end()) 
          continue;
        else{
          color_set1.insert(it.ByteMap[i]);
          if (IsinAlphabet(i, REClassList))
            Alphabet.insert(i);
        }
      }
    }
  }

  void RegExpSymbolic::IntersectionK::InsertInCache(SimulationState* ss, SimulationCache* sc){
    while (ss != nullptr){
      auto NextCache = new SimulationCache(ss->NS);
      sc->NS2Cache.insert(std::make_pair(ss->NS, NextCache));
      sc = NextCache;
      ss = ss->Next;
    }
  }

  RegExpSymbolic::IntersectionK::IntersectionK(std::vector<REnodeClass> ReList){
    RegExN = ReList.size();
    REClassList = ReList;
    for (auto it : REClassList)
      FList.emplace_back(FollowAtomata(it));
    
    SSBegin = new SimulationState(FList[0].NState);
    auto SS = SSBegin->Next;
    for (int i = 1; i < FList.size(); i++){
      SS = new SimulationState(FList[i].NState);
      SS = SS->Next;
    };
    Scache = new SimulationCache((FollowAtomata::NFAState*)malloc(sizeof(FollowAtomata::NFAState)));
    InsertInCache(SSBegin, Scache);
    ComputeAlphabet(REClassList);
    RegExpSymbolic::DumpAlphabet(Alphabet);
  }

  bool RegExpSymbolic::IntersectionK::Intersect(){
    if (IsIntersect(SSBegin))
      return true;
    else
      return false;  
  }

  bool RegExpSymbolic::IntersectionK::IsIntersect(SimulationState* s){
    // std::cout << "witness str: " << InterStr << std::endl;
    // DumpSimulationState(s);
    InsertInCache(s, Scache);
    for (auto c : Alphabet){
      // std::cout << "matching: " << int(c) << " " << std::endl;
      if (s->byte2state.find(ByteMap[c]) == s->byte2state.end()){
        std::set<SimulationState*> SimulationSet;
        // s->byte2state.insert(std::make_pair(ByteMap[c], SimulationSet));
        auto ss = s;
        std::vector<std::set<RegExpSymbolic::FollowAtomata::NFAState*>> NextList;
        int FollowID = 0;
        while (ss != nullptr){
          auto nextns1 = FList[FollowID].StepOneByte(ss->NS, c);
          NextList.emplace_back(nextns1);
          ss = ss->Next;
          FollowID = FollowID + 1;
        }
        if (IsEmptyStateIn(NextList)){
          continue;
        }
        InterStr.push_back(c);
        auto currs = (SimulationState*)malloc(sizeof(SimulationState));
        int level = 0;
        s->byte2state.insert(std::make_pair(ByteMap[c], SimulationSet));
        if (ComputAllState(NextList, level, s, currs, nullptr)){
          return true;
        }
        else
          InterStr.pop_back();
      }
      else 
      continue;
    }

    return false;
  }
}

