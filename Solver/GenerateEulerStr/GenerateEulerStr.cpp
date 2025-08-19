#include <cmath>
#include <sys/stat.h>
#include <sys/types.h>
#include <openssl/evp.h>


#include "GenerateEulerStr.h"


namespace solverbin{
  GenerateEulerStr::GenerateEulerStr(REnodeClass e1, int Length, std::string Path, int IsLazy, int IsRandom, int IsFullMatch, int ConsiderReverse){
    this->e1 = e1;
    this->Length = Length;
    this->Path = Path;
    this->IsLazy = IsLazy;
    this->IsRandom = IsRandom;
    this->IsFullMatch = IsFullMatch;
    this->ConsiderReverse = ConsiderReverse;
    LongestEulerStr.second = 0;
    if (ConsiderReverse == 1) {
      this->LastWord = e1.ReturnLastWord(e1.Renode);
    }
    this->FolowA = FollowAtomata(this->e1);
    this->FolowDFA = DFA(&this->FolowA);
    Utils::ComputeAlphabet_Colormap(e1.ByteMap, Alphabet, ColorMap);
    if (debug.PrintBytemap) e1.BuildBytemapToString(e1.ByteMap);
    if (debug.PrintAlphabet) Utils::DumpAlphabet(Alphabet);
  }

  bool GenerateEulerStr::FindEulerStrBFS(DFA::DFAState* state){
    std::queue<std::tuple<DFA::DFAState*, std::set<transition>, std::string>> queue;
    queue.push({state, {}, ""});
    DFAStateSet.insert({state});
    while (!queue.empty()) {
      auto currentState = queue.front();
      queue.pop();
      for (auto c : Alphabet) {
        auto NextState = std::get<0>(currentState)->Next[FolowDFA.FA->REClass.ByteMap[c]];
        if (NextState == nullptr) {
          NextState = FolowDFA.StepOneByte(std::get<0>(currentState), c);
        }
        // if (NextState->NodeSequence.size() == std::get<0>(currentState)->NodeSequence.size()) {
        //   continue;
        // }
        if (NextState->DFlag == DFA::DFAStateFlag::Match || NextState->DFlag == DFA::DFAStateFlag::Dead || DFAStateSet.find(NextState) != DFAStateSet.end()){
          DFAStateSet.insert({NextState});
          EulerStr.append(std::get<2>(currentState));
          continue;
        }
        DFAStateSet.insert({NextState});
        std::get<2>(currentState).push_back(c);
        if (std::get<2>(currentState).size() > LongestEulerStr.second) {
          std::cout << "EulerStr: " << std::get<2>(currentState) << std::endl;
          LongestEulerStr.first = std::get<2>(currentState);
          LongestEulerStr.second = std::get<2>(currentState).size();
        }
        if (EulerStr.size() >= 100000000) {
          return true;
        }
        if (debug.PrintEulerString) {
          std::cout << "begin state "; 
          FolowDFA.DumpState(std::get<0>(currentState));
          std::cout << "transition to state ";
          FolowDFA.DumpState(NextState);
        }
        queue.push({NextState, {}, std::get<2>(currentState)});
      }
    }
    return false;
  } 

  bool GenerateEulerStr::FindEulerStr(DFA::DFAState* state){
    for (auto c : Alphabet){
      auto NextState =  state->Next[FolowDFA.FA->REClass.ByteMap[c]];
      if (NextState == nullptr) {
        NextState = FolowDFA.StepOneByte(state, c);
      }
      if (NextState->DFlag == DFA::DFAStateFlag::Match || NextState->DFlag == DFA::DFAStateFlag::Dead || TransitionSet.find({state, c, NextState}) != TransitionSet.end()){
        continue;
      }
      TransitionSet.insert({state, c, NextState});
      EulerStr.push_back(c);
      if (EulerStr.size() > LongestEulerStr.second) {
        LongestEulerStr.first = EulerStr;
        LongestEulerStr.second = EulerStr.size();
      }
      if (EulerStr.size() >= 300000) {
        return true;
      }
      if (debug.PrintEulerString) {
        std::cout << "begin state "; 
        FolowDFA.DumpState(state);
        std::cout << "transition to state ";
        FolowDFA.DumpState(NextState);
      }
      if (FindEulerStr(NextState)) {
        return true;
      }
      EulerStr.pop_back();
      TransitionSet.erase({state, c, NextState});
    }
    std::cout << "EulerStr: " << EulerStr << std::endl;
    return false;
  }

  bool GenerateEulerStr::FindSimpleStr(DFA::DFAState* state){
    for (auto c : Alphabet){
      auto NextState =  state->Next[FolowDFA.FA->REClass.ByteMap[c]];
      if (NextState == nullptr) {
        NextState = FolowDFA.StepOneByte(state, c);
      }
      if (NextState->DFlag == DFA::DFAStateFlag::Match || NextState->DFlag == DFA::DFAStateFlag::Dead || DFAStateSet.find({NextState}) != DFAStateSet.end()){
        continue;
      }
      DFAStateSet.insert(NextState);
      EulerStr.push_back(c);
      if (EulerStr.size() > LongestEulerStr.second) {
        LongestEulerStr.first = EulerStr;
        LongestEulerStr.second = EulerStr.size();
      }
      if (EulerStr.size() >= 100000) {
        return true;
      }
      if (debug.PrintEulerString) {
        std::cout << "begin state "; 
        FolowDFA.DumpState(state);
        std::cout << "transition to state ";
        FolowDFA.DumpState(NextState);
      }
      if (FindSimpleStr(NextState)) {
        return true;
      }
      EulerStr.pop_back();
      DFAStateSet.erase( NextState);
    }
    std::cout << "EulerStr: " << EulerStr << std::endl;
    return false;
  }

}