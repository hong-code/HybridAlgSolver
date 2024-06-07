
#include "regexp_symbolic.h"
#include "../solver.h"

#include <cmath>
#include <map>
#include <list>
#include <bitset>

using namespace solverbin;




namespace solverbin{


void RegExpSymbolic::IntersectionNFA::ComputeAlphabet(std::set<uint8_t>& A31, uint8_t* ByteMap1, uint8_t* ByteMap2){
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

RegExpSymbolic::IntersectionNFA::IntersectionNFA(Node r1, Node r2){
  e1 = REnodeClass("");
  e2 = REnodeClass("");
  F1 = FollowAtomata(e1);
  F2 = FollowAtomata(e2);
  SSBegin = new SimulationState(Begin, F1.NState, F2.NState);
  TODOCache.push(*SSBegin);
  ComputeAlphabet(Alphabet, e1.ByteMap, e2.ByteMap);
  std::copy(std::begin(e1.ByteMap),std::end(e1.ByteMap),std::begin(ByteMap));
  e1.BuildBytemap(ByteMap, e2.BytemapRange);
  e1.BuildBytemapToString(ByteMap);
  RegExpSymbolic::DumpAlphabet(Alphabet);
}

RegExpSymbolic::IntersectionNFA::IntersectionNFA(REnodeClass r1, REnodeClass r2){
  e1 = r1;
  e2 = r2;
  F1 = FollowAtomata(e1);
  F2 = FollowAtomata(e2);
  SSBegin = new SimulationState(Begin, F1.NState, F2.NState);
  TODOCache.push(*SSBegin);
  ComputeAlphabet(Alphabet, e1.ByteMap, e2.ByteMap);
  std::copy(std::begin(e1.ByteMap),std::end(e1.ByteMap),std::begin(ByteMap));
  e1.BuildBytemap(ByteMap, e2.BytemapRange);
  e1.BuildBytemapToString(ByteMap);
  RegExpSymbolic::DumpAlphabet(Alphabet);
}



bool RegExpSymbolic::IntersectionNFA::Intersect(){
  // DumpSimulationState(SSBegin);
  if (IsIntersect(SSBegin))
    return true;
  else
    return false;  
}

bool RegExpSymbolic::IntersectionNFA::IsIntersect(SimulationState* s){
  // std::cout << "witness str: " << InterStr << std::endl;
  // DumpSimulationState(s);
  DoneCache.insert(std::make_pair(*s, s));
  s->IsIntersect = false;
  for (auto c : Alphabet){
    // std::cout << "matching: " << int(c) << " " << std::endl;
    if (s->byte2state.find(ByteMap[c]) == s->byte2state.end()){
      std::set<SimulationState*> SimulationSet;
      // s->byte2state.insert(std::make_pair(ByteMap[c], SimulationSet));
      auto nextns1 = F1.StepOneByte(s->NS1, c);
      auto nextns2 = F2.StepOneByte(s->NS2, c);
      if (nextns1.empty() || nextns2.empty()){
        continue;
      }
      for (auto nextns1_it : nextns1){
        for (auto nextns2_it : nextns2){
          // std::cout << "D1 match flag: " << nextns1_it->NFlag << " D2 match flag: " << nextns2_it->NFlag << std::endl; 
          // F1.DumpState(nextns1_it);
          // F2.DumpState(nextns2_it);
          auto ns = new SimulationState(Normal, nextns1_it, nextns2_it);
          auto itc = DoneCache.find(*ns);
          if (itc != DoneCache.end()){
            if (itc->second->IsIntersect == true){
              s->IsIntersect = true;
              SimulationSet.insert(itc->second);
            }
            else if (itc->second->IsDone == true && itc->second->IsIntersect == false)
              ;
            else{
              SimulationSet.insert(itc->second); 
            }  
          }
          else{
              if (nextns1_it->NFlag == RegExpSymbolic::FollowAtomata::Normal && nextns2_it->NFlag == RegExpSymbolic::FollowAtomata::Normal)
              {
                SimulationSet.insert(itc->second); 
                ns->IFlag = Normal;
                InterStr = InterStr + char(c);
                if (IsIntersect(ns))
                  s->IsIntersect = true;
                else{
                  // InterStr.pop_back();
                  continue; 
                }
                   
              }
              else if (nextns1_it->NFlag == RegExpSymbolic::FollowAtomata::Match && nextns2_it->NFlag == RegExpSymbolic::FollowAtomata::Match){
                SimulationSet.insert(itc->second); 
                InterStr = InterStr + char(c);
                std::cout << "witness str: " << InterStr << std::endl;
                ns->IFlag = Match;
                s->IsIntersect = true;
                std::cout << "Intersect" << std::endl;
                exit(0);
                IsIntersect(ns);
              }
              else{
                SimulationSet.insert(itc->second); 
                InterStr = InterStr + char(c);
                ns->IFlag = Normal;
                if (IsIntersect(ns))
                  s->IsIntersect = true;
                else{
                  // InterStr.pop_back();
                  continue; 
                }
              }
          }
        }
      }
      s->byte2state.insert(std::make_pair(ByteMap[c], SimulationSet));

      
      // 
      // 
      // std::cout << "D1 " << nextd1 << std::endl;   
      // std::cout << "D2 " << nextd2 << std::endl;   
      // D1.DumpState(nextd1);
      // e1.RuneSequenceToString(nextd1->NodeSequence);
      // D2.DumpState(nextd2);
      
      // DumpSimulationState(ns);
    }
    else 
    continue;

  }
  s->IsDone = true;
  if (s->IsIntersect){
    return true;
  }
  else{
    InterStr.pop_back();
    return false;
  }
    
}

void RegExpSymbolic::IntersectionNFA::DumpSimulationState(SimulationState* s){
  std::cout << "SimulationState: " << s << " IFlag: " << s->IFlag << " IsIntersect: " << s->IsIntersect << 
  " IsDone" << s->IsDone << std::endl;
  std::cout << s->NS1->Node2Continuation.first << ": continuation" << e1.REnodeToString(s->NS1->Node2Continuation.second) << std::endl;
  std::cout << s->NS2->Node2Continuation.first << ": continuation" << e2.REnodeToString(s->NS2->Node2Continuation.second) << std::endl;
  F1.DumpState(s->NS1);
  F2.DumpState(s->NS2);
}

} //solverbin