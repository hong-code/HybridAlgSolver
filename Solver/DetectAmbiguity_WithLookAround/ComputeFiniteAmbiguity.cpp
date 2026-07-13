#include <unordered_map>
#include <array>
#include <algorithm>
#include <stack>
#include <queue>
#include "DetectAmbiguity.h"



namespace solverbin{
	bool DetectABTNFA_Lookaround::DetectFiniteAmbiguity(){
    constexpr int MaxLengthLimit = 100000;
    struct DPCell{
      int path_count = 0;
      int predecessor_state = -1;
      char witness_char = 0;
    };
    auto initState = solverbin::FollowAtomata(this->e1);
    auto dfa = solverbin::DFA(&initState);
    std::array<std::unordered_map<int, DPCell>, MaxLengthLimit + 1> dp;
    dp[0][dfa.DState->id].path_count = 1;
    std::queue<std::pair<DFA::DFAState*, int>> stk;
    stk.push(std::pair<DFA::DFAState*, int>(dfa.DState, 0));
    int MaxLength = MaxLengthLimit;
    int ActualMaxLength = 0;
    while (!stk.empty())
    {
      auto CurrentPair = stk.front();
      DFA::DFAState* CurrentState = CurrentPair.first;
      auto length = CurrentPair.second;
      stk.pop();
      if (length >= MaxLengthLimit){
        continue;
      }
      for (auto c : Alphabet){
        auto NextState = dfa.StepOneByte(CurrentState, c);
        if (this->MatchingFunction == 1){
          if (NextState == nullptr || NextState->NodeSequence.size() == 0 || NextState->DFlag == DFA::Match){
            // std::cout << "Error: NextState NodeSequence size is zero! or NextState is nullable" << std::endl;
            continue;
          }
        }
        else {
          if (NextState == nullptr || NextState->NodeSequence.size() == 0){
            // std::cout << "Error: NextState NodeSequence size is zero! or NextState is nullable" << std::endl;
            continue;
          }
        }
        
        auto &CurrentDP = dp[length][CurrentState->id];
        if (CurrentDP.path_count == 0){
          std::cout << "Error: dp value is zero!" << std::endl;
        }
        int NumberOfPaths = CurrentDP.path_count;
        for (auto de : CurrentState->Next[dfa.FA->REClass.ByteMap[c]].second){
          NumberOfPaths += (de - 1);
        }
        auto &NextDP = dp[length + 1][NextState->id];
        if (NumberOfPaths > NextDP.path_count){
          NextDP.path_count = NumberOfPaths;
          NextDP.predecessor_state = CurrentState->id;
          NextDP.witness_char = static_cast<char>(c);
          if (length + 1 > ActualMaxLength){
            ActualMaxLength = length + 1;
          }
          if (length < this->length){
            stk.push(std::pair<DFA::DFAState*, int>(NextState, length + 1));
          } 
        }

      }
    }
    if (ActualMaxLength < MaxLength){
      MaxLength = ActualMaxLength;
    }
    MaxDegreeOfAmbiguity = 0;
    MaxAmbiguityWitnessString.clear();
    int IndexofReturnState = dfa.DState->id;
    for (auto &it1 : dp[MaxLength]){
      if (it1.second.path_count > MaxDegreeOfAmbiguity){
        IndexofReturnState = it1.first;
        MaxDegreeOfAmbiguity = it1.second.path_count;
      }
    }
    std::string witness;
    witness.reserve(MaxLength);
    int WitnessState = IndexofReturnState;
    for (int i = MaxLength; i > 0; --i){
      auto CellIt = dp[i].find(WitnessState);
      if (CellIt == dp[i].end()){
        break;
      }
      witness.push_back(CellIt->second.witness_char);
      WitnessState = CellIt->second.predecessor_state;
    }
    std::reverse(witness.begin(), witness.end());
    MaxAmbiguityWitnessString = witness;
    std::cout << "MaxDegreeOfAmbiguity: " << MaxDegreeOfAmbiguity << std::endl;
    // std::cout << "witness string with MaxDegreeOfAmbiguity: " << witness << std::endl;
    if (MaxDegreeOfAmbiguity > MaxLength){
      return true;
    }
    return false;
  };
} 