#include "PositionAutomaton.h"
#include "../solver.h"

#include <cmath>
#include <map>



using namespace solverbin;


namespace solverbin{


  void DFA::DumpState(DFAState* s){
    std::cout << "The node index: ";
    for (auto i : s->IndexSequence){
      std::cout << i << " ";
    }
    for (auto i : s->NodeSequence){
      std::cout << FA->REClass.REnodeToString(i->Ccontinuation) << std::endl;
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
    std::set<FollowAtomata::State*> NodeSequence;
    for (auto IT : RS1){
      auto Index = Node2Index.find(IT);
      if (Index == Node2Index.end()){
        Node2Index.insert(std::make_pair(IT, IndexMax));
        IndexSequence.insert(IndexMax);
        NodeSequence.insert(IT);
        IndexMax++;
      }
      else {
        NodeSequence.insert(IT);
        IndexSequence.insert(Index->second);
      }
    }  
    NS->IndexSequence = IndexSequence;
    NS->NodeSequence = NodeSequence;
  }


  DFA::DFAState* DFA::StepOneByte(DFAState* s, uint8_t c){
    DFAState* NextDFAState = new DFAState(FA->REClass.color_max);
    for (auto j : s->NodeSequence){
      auto NFAStateVector = FA->StepOneByte(j, c);
      for (auto i : NFAStateVector){
          if (i->Ccontinuation->Status == NODE_STATUS::NODE_NULLABLE){
            i->DFlag = FollowAtomata::Match;
            NextDFAState->DFlag = DFA::Match;
          }else
            i->DFlag = FollowAtomata::Normal;
          NextDFAState->IndexSequence.insert(i->Index);
          NextDFAState->NodeSequence.insert(i);
      }
    }
    if (NextDFAState->NodeSequence.size() == 0){
      s->Next[FA->REClass.ByteMap[c]] = DeadState;
      return DeadState;
    }
    else{
      auto UniqueDFAState = FindInDFACache(dfacache, NextDFAState);
      if (UniqueDFAState != NextDFAState) {
        delete NextDFAState;
      }
      s->Next[FA->REClass.ByteMap[c]] =  UniqueDFAState;
      return UniqueDFAState;
    }
  }

  bool DFA::Fullmatch(DFAState* Init_state, std::string str){
    DFAState* CurrState = Init_state;
    for (auto c : str){
      if (CurrState->Next[FA->REClass.ByteMap[c]] != nullptr)
        CurrState = CurrState->Next[FA->REClass.ByteMap[c]];
      else
        CurrState = StepOneByte(CurrState, c);
      // std::cout<< "consume " << c << std::endl;
      // DumpState(CurrState);
      if (CurrState == nullptr || CurrState->DFlag == DFA::Dead)
        return false;
    }
    if (CurrState->DFlag == DFA::Match)
      return true;
    else
      return false;
  }

  DFA::DFA(FollowAtomata* fa){ 
    FA = fa;
    DState = new DFAState(FA->REClass.color_max);
    DState->IndexSequence.insert(0);
    DState->NodeSequence.insert(FA->NState);
    // for (auto i : FA->NState->FirstSet)
    //   DState->NodeSequence.insert(i);
    if (FA->NState->Ccontinuation->Status == NODE_STATUS::NODE_NULLABLE)
      DState->DFlag = DFA::Match;
    else  
      DState->DFlag = DFA::Begin;  
    IndexMax++;
    FindInDFACache(dfacache, DState);
  }
  

}