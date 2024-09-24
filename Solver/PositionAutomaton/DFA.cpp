#include "PositionAutomaton.h"
#include "../solver.h"

#include <cmath>
#include <map>
#include <list>
#include <bitset>



using namespace solverbin;


namespace solverbin{


  void DFA::DumpState(DFAState* s){
    std::cout << "The node index: ";
    for (auto i : s->IndexSequence){
      std::cout << i << " ";
    }
    std::cout << "" << std::endl;
  }

  DFA::DFACache* DFA::Step2Left(DFACache* DC, int c){
    DFACache* dc = DC;
    for (int i = 0; i < c; i++){
      if (dc->left == nullptr){
        dc->left = new DFACache(IsNULL, nullptr, nullptr);
        dc = dc->left;
      }
      else{
        dc = dc->left;
      }
    }
    return dc;
  }

  DFA::DFACache* DFA::Step2Right(DFACache* DC, int c){
    DFACache* dc = DC;
    for (int i = 0; i < c; i++){
      if (dc->right == nullptr){
        dc->right = new DFACache(IsNULL, nullptr, nullptr);
        dc = dc->right;
      }
      else{
        dc = dc->right;
      }
    }
    return dc;
  }

  DFA::DFAState* DFA::FindInDFACache(DFACache* DC, DFAState* s){
    int BeginiIndex = 0;
    for (auto i : s->IndexSequence){
      if (i - BeginiIndex > 0){
        DC = Step2Left(DC, i - BeginiIndex);
      }
      DC = Step2Right(DC, 1);
      BeginiIndex = i;
    }
    if (DC->DCFlage == IsNotNULL){
      return DC->DS;
    }else{
      DC->DCFlage = IsNotNULL;
      DC->DS = s;
      return s;
    }
  }

  void DFA::MaintainNode2Index(DFAState* NS, std::set<FollowAtomata::State*> RS1){
    std::set<int> IndexSequence;
    for (auto IT : RS1){
      auto Index = Node2Index.find(IT);
      if (Index == Node2Index.end()){
        Node2Index.insert(std::make_pair(IT, IndexMax));
        NS->IndexSequence.insert(IndexMax);
        NS->NodeSequence.insert(IT);
        IndexMax++;
      }
      else {
        NS->NodeSequence.insert(IT);
        NS->IndexSequence.insert(Index->second);
      }
    }  
  }


    DFA::DFAState* DFA::StepOneByte(DFAState* s, uint8_t c){
    std::set<FollowAtomata::State*> NFAStateVec;
    auto itc = s->Next.find(FA.REClass.ByteMap[c]);
    if (itc != s->Next.end()){
      return itc->second;
    }
    // bool Mark = false;
    for (auto i : s->NodeSequence){
      if (c >= i->ValideRange.min && c <= i->ValideRange.max){
        auto Tuple = FA.FirstNode(i->Ccontinuation);
        // if (Tuple.second.size() == 0)
        //   Mark = true;
        i->FirstSet = Tuple.second;
        i->FirstSet.insert(i->FirstSet.end(), Tuple.first.begin(), Tuple.first.end());
        if (i->Ccontinuation->Isnullable){
          i->DFlag = FollowAtomata::Match;
        }else
          i->DFlag = FollowAtomata::Normal;
        NFAStateVec.insert(FA.FindInNFACache(FA.nfacache, i));
      }
      else
        continue;
      
    }
    DFAState* NextDFAState = (DFAState* )malloc(sizeof(DFAState));
    MaintainNode2Index(NextDFAState, NFAStateVec);
    auto UniqueDFAState = FindInDFACache(dfacache, NextDFAState);
    if (UniqueDFAState != NextDFAState) {
      delete NextDFAState;
      NextDFAState = nullptr;
    }
    s->Next.insert(std::make_pair(FA.REClass.ByteMap[c], NextDFAState));
    return NextDFAState;
  }

}