#include <cmath>
#include <cstdint>
#include <map>
#include <list>
#include <bitset>
#include <queue>
#include <iostream>
#include <string.h>
#include <tuple>

#include "../solver.h"
#include "../PositionAutomaton/PositionAutomaton.h"


namespace solverbin{
  typedef std::tuple<DFA::DFAState*, uint8_t, DFA::DFAState*> transition;
  class GenerateEulerStr{
    public:
      REnodeClass e1;
      int Length;
      int IsLazy;
      int IsRandom;
      int IsFullMatch;
      int ConsiderReverse;
      std::set<transition> TransitionSet;
      std::set<DFA::DFAState*> DFAStateSet;
      std::string LastWord;
      std::string EulerStr;
      std::pair<std::string, int> LongestEulerStr;
      std::string Path;
      std::string RegexFile;
      std::string Regex;
      std::string MatchingFunction;
      std::string RegexEngine;
      FollowAtomata FolowA;
      DFA FolowDFA;
      std::set<uint8_t> Alphabet;
      std::map<uint8_t, std::vector<uint8_t>> ColorMap;
      GenerateEulerStr(REnodeClass e1, int l, std::string Path, int IsLazy, int IsRandom, int IsFullMatch, int ConsiderReverse);
      bool FindEulerStr(DFA::DFAState* state);
      bool FindEulerStrBFS(DFA::DFAState* state);
      bool FindSimpleStr(DFA::DFAState* state);
  };
}