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

  bool RegExpSymbolic::IntersectionK::ComputAllState(std::vector<std::set<RegExpSymbolic::FollowAtomata::NFAState*>> NextV, int i, SimulationState* s, SimulationState* ns){
    if (i == 0)
      for (auto it : NextV[0]){
        s->NS = it;
        if (i == RegExN - 1)
          s->Next = nullptr;
        else  
          s->Next = (SimulationState*)malloc(sizeof(SimulationState));
        i++;
        if (ComputAllState(NextV, i, s, s->Next))
          return true;
        else
          i--;  

      }
    else if (i == RegExN){
      if (!IsInCache(s, Scache)){
        if (IfMatch(s)){
          return true;
        }
        else {
          if (IsIntersect(s))
            return true;
        }
      }
    }  
    else {
      for (auto it : NextV[i]){
        ns->NS = it;
        if (i == RegExN - 1)
          ns->Next = nullptr;
        else  
          ns->Next = (SimulationState*)malloc(sizeof(SimulationState));
        i++;  
        if (ComputAllState(NextV, i, s, ns->Next))
          return true;
        else
          i--;
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

  // void RegExpSymbolic::IntersectionK::InsertInCache(SimulationState* ss, SimulationCache* sc){
  //   while (ss != nullptr){
  //     auto NextCache = new SimulationCache(ss->NS);
  //     sc->NS2Cache.insert(std::make_pair(ss->NS, NextCache));
  //     sc = NextCache;
  //     ss = ss->Next;
  //   }
  // }

   bool RegExpSymbolic::IntersectionK::IsInCache(SimulationState* ss, SimulationCache* sc){
    bool ret = true;
    while (ss != nullptr){
      auto nextCache = sc->NS2Cache.find(ss->NS->Node2Continuation.first);
      if (nextCache == sc->NS2Cache.end()){
        auto NextCache = new SimulationCache(ss->NS);
        sc->NS2Cache.insert(std::make_pair(ss->NS->Node2Continuation.first, NextCache));
        ret = false;
        sc = NextCache;
        ss = ss->Next;
      }
      else{
        ss = ss->Next;  
        sc = nextCache->second;
      }
    }
    
    return ret;
  }

  RegExpSymbolic::IntersectionK::IntersectionK(std::vector<REnodeClass> ReList){
    RegExN = ReList.size();
    REClassList = ReList;
    for (auto it : REClassList)
      FList.emplace_back(FollowAtomata(it));
    auto SS = new SimulationState(FList[0].NState);
    SSBegin = SS;
    for (int i = 1; i < FList.size(); i++){
      SS->Next = new SimulationState(FList[i].NState);
      SS = SS->Next;
    };
    Scache = new SimulationCache((FollowAtomata::NFAState*)malloc(sizeof(FollowAtomata::NFAState)));
    // IsInCache(SSBegin, Scache);
    ComputeAlphabet(REClassList);
    // RegExpSymbolic::DumpAlphabet(Alphabet);
  }

  bool RegExpSymbolic::IntersectionK::Intersect(){
    if (IfMatch(SSBegin))
      return true;
    if (IsIntersect(SSBegin))
      return true;
    else
      return false;  
  }

  bool RegExpSymbolic::IntersectionK::IsIntersect(SimulationState* s){
    // std::cout << "witness str: " << InterStr << std::endl;
    // DumpSimulationState(s);
    for (auto c : Alphabet){
      // std::cout << "matching: " << int(c) << " " << std::endl;
      // s->byte2state.insert(std::make_pair(ByteMap[c], SimulationSet));
      auto ss = s;
      std::vector<std::set<RegExpSymbolic::FollowAtomata::NFAState*>> NextList;
      int FollowID = 0;
      bool ISN = false;
      while (ss != nullptr){
        auto nextns1 = FList[FollowID].StepOneByte(ss->NS, c);
        if (nextns1.size() == 0)
          ISN = true;
        NextList.emplace_back(nextns1);
        ss = ss->Next;
        FollowID = FollowID + 1;
      }
      if (ISN){
        continue;
      }
      InterStr.push_back(c);
      auto currs = (SimulationState*)malloc(sizeof(SimulationState));
      int level = 0;
      if (ComputAllState(NextList, level, currs, nullptr)){
        return true;
      }
      else
        InterStr.pop_back();
      
    }

    return false;
  }
}

