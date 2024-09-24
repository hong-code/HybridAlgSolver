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

  void DFA::MaintainNode2Index(DFAState* NS, std::map<REnode*, REnode*> RS1){
    for (auto IT : RS1){
      if (Node2Index.find(IT.first) == Node2Index.end()){
        Node2Index.insert(std::make_pair(IT.first, IndexMax));
        IndexMax++;
      }
      if (NS->NodeSequence.find(IT.first) == NS->NodeSequence.end()){
        NS->NodeSequence.insert(IT);
        NS->IndexSequence.insert(Node2Index.find(IT.first)->second);
      }
    }  
  }
}