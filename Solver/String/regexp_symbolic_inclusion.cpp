
#include "regexp_symbolic.h"
#include "../solver.h"

#include <cmath>
#include <map>
#include <list>
#include <bitset>

using namespace solverbin;


namespace solverbin {


  void RegExpSymbolic::InclusionDFA::ComputeAlphabet(std::set<uint8_t>& A1, uint8_t* ByteMap1, uint8_t* ByteMap2){
    std::set<uint8_t> color_set1;
    color_set1.insert(ByteMap1[0]);
    if (ByteMap1[0] != 0 || ByteMap2[0] != 0)
      Alphabet.insert(0);
    for (int i = 0; i < 256; i++){
      if (color_set1.find(ByteMap1[i]) != color_set1.end()) 
        continue;
      else{
        color_set1.insert(ByteMap1[i]);
        if (ByteMap1[i] != 0 || ByteMap2[i] != 0)
          Alphabet.insert(i);
      }
    }

    std::set<uint8_t> color_set2;
    color_set2.insert(ByteMap2[0]);
    if (ByteMap2[0] != 0 || ByteMap1[0] != 0)
      Alphabet.insert(0);
    for (int i = 0; i < 256; i++){
      if (color_set2.find(ByteMap2[i]) != color_set2.end()) 
        continue;
      else{
        color_set2.insert(ByteMap2[i]);
        if (ByteMap2[i] != 0 || ByteMap1[i] != 0)
          Alphabet.insert(i);
      }
    }
  }

  RegExpSymbolic::InclusionDFA::InclusionDFA(Node r1, Node r2){
    e1 = REnodeClass("re");
    e2 = REnodeClass("re");
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



  bool RegExpSymbolic::InclusionDFA::Inclusion(){
    DumpSimulationState(SSBegin);
    if (Isinclusion(SSBegin))
      return true;
    else
      return false;  
  }

  bool RegExpSymbolic::InclusionDFA::Isinclusion(SimulationState* s){
    DumpSimulationState(s);
    DoneCache.insert(std::make_pair(*s, s));
    s->IsInclusion = true;
    for (auto c : Alphabet){
      if (s->byte2state.find(ByteMap[c]) == s->byte2state.end()){
        DFA::DFA::DFAState* nextd1 = D1.StepOneByte(s->d1, c);
        DFA::DFA::DFAState* nextd2 = D2.StepOneByte(s->d2, c);
        if (nextd1 == nullptr && nextd2 != nullptr){
          if (ICState == LBelong2R)
            continue;
          else if (ICState == equivalence)
          {
            ICState = LBelong2R;
            continue;
          }
          else{
            s->IsInclusion = false;
            s->IsDone = true;
            return false;
          }
            
        }
        else if (nextd1 != nullptr && nextd2 == nullptr)
        {
          if (ICState == RBelong2L)
            continue;
          else if (ICState == equivalence)
          {
            ICState = RBelong2L;
            continue;
          }
          else{
            s->IsInclusion = false;
            s->IsDone = true;
            return false;
          }
        }
        else if (nextd1 == nullptr && nextd2 == nullptr)
          continue;
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
          if (itc->second->IsInclusion == false){
            s->IsInclusion = false;
            s->byte2state.insert(std::make_pair(ByteMap[c], itc->second));
          }
          else if (itc->second->IsDone == true && itc->second->IsInclusion == true)
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
            if (!Isinclusion(ns)){
              s->IsInclusion = false;
              s->IsDone = true;
              return false;
            }
            else
              continue;  
          }
          else if (nextd1->DFlag == RegExpSymbolic::DFA::Match && nextd2->DFlag == RegExpSymbolic::DFA::Match){
            s->byte2state.insert(std::make_pair(ByteMap[c], ns));
            ns->IFlag = Match;
            if (!Isinclusion(ns)){
              s->IsInclusion = false;
              s->IsDone = true;
              return false;
            }
            else
              continue; 
          }
          else{
            if (nextd1->DFlag == RegExpSymbolic::DFA::Match && nextd2->DFlag == RegExpSymbolic::DFA::Normal){
              if (ICState == equivalence){
                ICState = RBelong2L;
              }
              else if (ICState == RBelong2L)
                continue;
              else{
                s->IsInclusion = false;
                s->IsDone = true;
                return false;
              }  
            }
            else {
              if (ICState == equivalence){
                ICState = LBelong2R;
              }
              else if (ICState == LBelong2R)
                continue;
              else{
                s->IsInclusion = false;
                s->IsDone = true;
                return false;
              }
            }
          }
        }
      }
    }
    s->IsDone = true;
    return true;
  }

  void RegExpSymbolic::InclusionDFA::DumpSimulationState(SimulationState* s){
    std::cout << "SimulationState: " << s << " IFlag: " << s->IFlag << " IsIntersect: " << s->IsInclusion << \
    " IsDone" << s->IsDone << std::endl;
    D1.DumpState(s->d1);
    D2.DumpState(s->d2);
  }
    

} //solverbin