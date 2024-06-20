#include "MatchFunctions.h"


namespace solverbin{

  bool MatchFunctions::FullMatch::Fullmatch(std::string str) {
    std::vector<uint8_t> uvec;
    std::map<REnode*, REnode*> RS2;
    RS2.insert(std::make_pair(e1.Renode, e1.Renode));
    RegExpSymbolic::DFA::DFAState* BeginState = new RegExpSymbolic::DFA::DFAState(dfa.Begin, RS2);
    for (uint8_t itc : str){
      if (BeginState->Next.find(itc) != BeginState->Next.end()){
        BeginState = BeginState->Next[itc];
        continue;
      }
      std::map<REnode*, REnode*> RS3;
      RegExpSymbolic::DFA::DFAState *NS = new RegExpSymbolic::DFA::DFAState(dfa.Begin, RS3);
      std::cout << "matching: " << int(itc) << std::endl;
      for (auto it : BeginState->NodeSequence){
        std::cout << "begin: " << REnodeClass::REnodeToString(it.second) << std::endl;
        auto RS1 = e1.ccontinuation(it.second, itc);
        e1.RuneSequenceToString(RS1);
        for (auto IT : RS1){
          if (dfa.Node2Index.find(IT.first) == dfa.Node2Index.end()){
            dfa.Node2Index.insert(std::make_pair(IT.first, dfa.IndexMax));
            dfa.IndexMax++;
          }
          if (NS->NodeSequence.find(IT.first) == NS->NodeSequence.end()){
            NS->NodeSequence.insert(IT);
            NS->IndexSequence.insert(dfa.Node2Index.find(IT.first)->second);
          }
        }  
      }
      if (NS->NodeSequence.size() == 0){
        std::cout << "match failed" << std::endl;
        return false;
      }
      else{
        NS = dfa.FindInDFACache(dfa.dfacache, NS);
        BeginState->Next.insert(std::make_pair(itc, NS));
        BeginState = NS;
      }
      dfa.DumpState(BeginState);
      // REClass.RuneSequenceToString(BeginState->NodeSequence);  
    }
    for (auto it : BeginState->NodeSequence){
      e1.isNullable(it.second);
      if (it.second->Status == NODE_STATUS::NODE_NULLABLE){
        std::cout << "match successfully" << std::endl;
        return true;
      }
    }
    std::cout << "match failed" << std::endl;
    return false;
  }
}