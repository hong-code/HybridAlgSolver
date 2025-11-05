#include <unordered_map>
#include <stack>
#include <queue>
#include "DetectAmbiguity.h"



namespace solverbin{
	bool DetectABTNFA_Lookaround::DetectFiniteAmbiguity(){
    auto initState = solverbin::FollowAtomata(this->e1);
    auto dfa = solverbin::DFA(&initState);
    std::unordered_map<int, std::unordered_map<int, int>> dp;
    dp[dfa.DState->id][0] = 1;
    std::queue<std::pair<DFA::DFAState*, int>> stk;
    stk.push(std::pair<DFA::DFAState*, int>(dfa.DState, 0));
    int MaxLength = 100;
    while (!stk.empty())
    {
      auto CurrentPair = stk.front();
      DFA::DFAState* CurrentState = CurrentPair.first;
      auto length = CurrentPair.second;
      stk.pop();
      for (auto c : Alphabet){
        auto NextState = dfa.StepOneByte(CurrentState, c);
        if (NextState == nullptr || NextState->NodeSequence.size() == 0){
          std::cout << "Error: NextState NodeSequence size is zero! or NextState is nullable" << std::endl;
          continue;
        }
        if (dp[CurrentState->id][length] == 0){
          std::cout << "Error: dp value is zero!" << std::endl;
        }
        int NumberOfPaths = dp[CurrentState->id][length];
        for (auto de : CurrentState->Next[dfa.FA->REClass.ByteMap[c]].second){
          NumberOfPaths += (de - 1);
        }
        if (NumberOfPaths > dp[NextState->id][length + 1]){
          dp[NextState->id][length + 1] = NumberOfPaths;
          if (length < MaxLength){
            stk.push(std::pair<DFA::DFAState*, int>(NextState, length + 1));
          } 
        }

      }
    }
    int MaxDegreeOfAmbiguity = 0;
    for (auto &it1 : dp){
      if(it1.second.find(MaxLength) != it1.second.end()){
        if (it1.second[MaxLength] > MaxDegreeOfAmbiguity){
          MaxDegreeOfAmbiguity = it1.second[MaxLength];
        }
      }
    }
    std::cout << "MaxDegreeOfAmbiguity: " << MaxDegreeOfAmbiguity << std::endl;
    return false;
  };
} 