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
      if (EulerStr.size() >= 100000) {
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
    // std::cout << "EulerStr: " << EulerStr << std::endl;
    return false;
  }

}