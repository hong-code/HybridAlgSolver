#include <unordered_map>
#include <stack>
#include <queue>
#include "DetectAmbiguity.h"



namespace solverbin{
	bool DetectABTNFA_Lookaround::DetectFiniteAmbiguity(){
    auto initState = solverbin::FollowAtomata(this->e1);
    auto dfa = solverbin::DFA(&initState);
    std::unordered_map<int, std::unordered_map<int, std::pair<int, std::string>>> dp;
    dp[dfa.DState->id][0].first = 1;
    std::queue<std::pair<DFA::DFAState*, int>> stk;
    stk.push(std::pair<DFA::DFAState*, int>(dfa.DState, 0));
    int MaxLength = 1000;
    int ActualMaxLength = 0;
    while (!stk.empty())
    {
      auto CurrentPair = stk.front();
      DFA::DFAState* CurrentState = CurrentPair.first;
      auto length = CurrentPair.second;
      stk.pop();
      for (auto c : Alphabet){
        auto NextState = dfa.StepOneByte(CurrentState, c);
        if (NextState == nullptr || NextState->NodeSequence.size() == 0){
          // std::cout << "Error: NextState NodeSequence size is zero! or NextState is nullable" << std::endl;
          continue;
        }
        if (dp[CurrentState->id][length].first == 0){
          std::cout << "Error: dp value is zero!" << std::endl;
        }
        int NumberOfPaths = dp[CurrentState->id][length].first;
        for (auto de : CurrentState->Next[dfa.FA->REClass.ByteMap[c]].second){
          NumberOfPaths += (de - 1);
        }
        if (NumberOfPaths > dp[NextState->id][length + 1].first){
          dp[NextState->id][length + 1].first = NumberOfPaths;
          dp[NextState->id][length + 1].second = dp[CurrentState->id][length].second + std::string(1, c);
          if (length + 1 > ActualMaxLength){
            ActualMaxLength = length + 1;
          }
          if (length < MaxLength){
            stk.push(std::pair<DFA::DFAState*, int>(NextState, length + 1));
          } 
        }

      }
    }
    if (ActualMaxLength < MaxLength){
      MaxLength = ActualMaxLength;
    }
    int MaxDegreeOfAmbiguity = 0;
    int IndexofReturnState;
    for (auto &it1 : dp){
      if(it1.second.find(MaxLength) != it1.second.end()){
        if (it1.second[MaxLength].first > MaxDegreeOfAmbiguity){
          IndexofReturnState = it1.first;
          MaxDegreeOfAmbiguity = it1.second[MaxLength].first;
        }
      }
    }
    std::cout << "MaxDegreeOfAmbiguity: " << MaxDegreeOfAmbiguity << std::endl;
    std::cout << "witness string with MaxDegreeOfAmbiguity: " << dp[IndexofReturnState][MaxLength].second << std::endl;
    if (MaxDegreeOfAmbiguity > MaxLength){
      return true;
    }
    return false;
  };
} 