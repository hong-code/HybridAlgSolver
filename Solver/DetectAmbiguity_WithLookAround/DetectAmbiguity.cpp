#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <queue>
#include <iostream>
#include <string.h>
#include "DetectAmbiguity.h"

namespace solverbin{
  void DetectABTNFA_Lookaround::DumpAlphabet(std::set<uint8_t>& A){
    std::cout << "The alphabet: ";
    for (auto it : A){
      std::cout << int(it) << " ";
    }
    std::cout << "" << std::endl;
  }

  DetectABTNFA_Lookaround::DetectABTNFA_Lookaround(REnodeClass r){
    e1 = r;
    F1 = FollowAtomata(e1);
    SSBegin = new TernarySimulationState(Begin, F1.NState, F1.NState, F1.NState);
    e1.ComputeAlphabet(e1.ByteMap, Alphabet);
    e1.BuildBytemapToString(e1.ByteMap);
    DumpAlphabet(Alphabet);
  }

  void DetectABTNFA_Lookaround::DumpTernarySimulationState(TernarySimulationState* TSS){
    std::cout << "SimulationState: " << TSS << " IFlag: " << TSS->IFlag << " IsIntersect: " << TSS->IsSat << 
    " IsDone" << TSS->IsDone << std::endl;
    std::cout << "continuation" << e1.REnodeToString(TSS->NS1->Ccontinuation) << std::endl;
    std::cout << ": continuation" << e1.REnodeToString(TSS->NS2->NS1->Ccontinuation) << std::endl;
    std::cout << ": continuation" << e1.REnodeToString(TSS->NS2->NS2->Ccontinuation) << std::endl;
    F1.DumpState(TSS->NS1);
    F1.DumpState(TSS->NS2->NS1);
    F1.DumpState(TSS->NS2->NS2);
  }

  std::set<DetectABTNFA_Lookaround::TernarySimulationState> DetectABTNFA_Lookaround::DTSimulationState(TernarySimulationState* TS){
    std::set<DetectABTNFA_Lookaround::TernarySimulationState> TSSSet;
    if (TS->NS1->Ccontinuation == TS->NS2->NS1->Ccontinuation && TS->NS1->Ccontinuation != TS->NS2->NS2->Ccontinuation){
      TSSSet.insert(TernarySimulationState(Normal, TS->NS1, TS->NS2->NS2, TS->NS2->NS2));
      TSSSet.insert(TernarySimulationState(Normal, TS->NS2->NS2, TS->NS1, TS->NS2->NS2));
    }
    else if (TS->NS1->Ccontinuation == TS->NS2->NS2->Ccontinuation && TS->NS1->Ccontinuation != TS->NS2->NS1->Ccontinuation){
      TSSSet.insert(TernarySimulationState(Normal, TS->NS1, TS->NS2->NS1, TS->NS2->NS1));
      TSSSet.insert(TernarySimulationState(Normal, TS->NS2->NS1, TS->NS2->NS1, TS->NS1));
    }
    else if (TS->NS2->NS1->Ccontinuation == TS->NS2->NS2->Ccontinuation && TS->NS1->Ccontinuation != TS->NS2->NS1->Ccontinuation){
      TSSSet.insert(TernarySimulationState(Normal, TS->NS1, TS->NS1, TS->NS2->NS1));
      TSSSet.insert(TernarySimulationState(Normal, TS->NS1, TS->NS2->NS1, TS->NS1));
    }
    return TSSSet;
  }

  bool DetectABTNFA_Lookaround::DetectABTOFS(TernarySimulationState* TSS, std::set<TernarySimulationState> TSSET){
    std::cout << "witness str: " << WitnessStr << std::endl;
    DumpTernarySimulationState(TSS);
    for (auto c : Alphabet){
      std::cout << "matching: " << int(c) << " " << std::endl;
      // if (TSS->byte2state.find(ByteMap[c]) == TSS->byte2state.end()){
        std::set<TernarySimulationState*> TernarySimulationSet;
        auto nextns1 = F1.StepOneByte(TSS->NS1, c);
        auto nextns2 = F1.StepOneByte(TSS->NS2->NS1, c);
        auto nextns3 = F1.StepOneByte(TSS->NS2->NS2, c);
        if (nextns1.empty() || nextns2.empty() || nextns3.empty())
          continue;
        for (auto nextns1_it : nextns1){
          for (auto nextns2_it : nextns2){
            for (auto nextns3_it : nextns3){
              auto ns = new TernarySimulationState(Normal, nextns1_it, nextns2_it, nextns3_it);
              DumpTernarySimulationState(ns);
              auto itc = SimulationCache.find(*ns);
              if (itc != SimulationCache.end()){
                TernarySimulationSet.insert(itc->second);
              }
              else{
                SimulationCache.insert(std::make_pair(*ns, ns));
                WitnessStr.push_back(c);
                if (TSSET.find(*ns) != TSSET.end()){
                  return true;
                }
                if (DetectABTOFS(ns, TSSET)){
                  return true;
                }
                else
                  WitnessStr.pop_back();
              }
            }
          }
        }
        TSS->byte2state.insert(std::make_pair(ByteMap[c], TernarySimulationSet));  
      // }
      // else
      //   continue;
    }
    return false;
  }

  bool DetectABTNFA_Lookaround::IsABT(TernarySimulationState* TSS){
    std::cout << "witness str: " << InterStr << std::endl;
    DumpTernarySimulationState(TSS);
    for (auto c : Alphabet){
      std::cout << "matching: " << int(c) << " " << std::endl;
      // if (TSS->byte2state.find(ByteMap[c]) == TSS->byte2state.end()){
        std::set<TernarySimulationState*> TernarySimulationSet;
        auto nextns1 = F1.StepOneByte(TSS->NS1, c);
        auto nextns2 = F1.StepOneByte(TSS->NS2->NS1, c);
        auto nextns3 = F1.StepOneByte(TSS->NS2->NS2, c);
        if (nextns1.empty() || nextns2.empty() || nextns3.empty())
          continue;
        for (auto nextns1_it : nextns1){
          for (auto nextns2_it : nextns2){
            for (auto nextns3_it : nextns3){
              auto ns = new TernarySimulationState(Normal, nextns1_it, nextns2_it, nextns3_it);
              DumpTernarySimulationState(ns);
              auto itc = DoneCache.find(*ns);
              if (itc != DoneCache.end()){
                TernarySimulationSet.insert(itc->second);
              }
              else{
                DoneCache.insert(std::make_pair(*ns, ns));
                auto TSSET = DTSimulationState(ns);
                InterStr.push_back(c);
                if (!TSSET.empty()){
                  DumpTernarySimulationState(ns);
                  if (DetectABTOFS(ns, TSSET)){
                    InterStr = InterStr + WitnessStr;
                    return true;
                  }
                  else {
                    SimulationCache.clear();
                    WitnessStr = "";
                  }
                }
                if (IsABT(ns)){
                  return true;
                }
                else {
                  InterStr.pop_back();
                }
              }
            }
          }
        }
        TSS->byte2state.insert(std::make_pair(ByteMap[c], TernarySimulationSet));  
      // }
      // else
      //   continue;
    }
    return false;
  }
  
}