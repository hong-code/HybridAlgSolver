#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <queue>
#include <iostream>
#include <string.h>

#include "../solver.h"



namespace solverbin{

  class FollowAtomata{
    public:
      enum StateFlag{
        Begin,
        Normal,
        Match,
        Unmatch
      };

      enum CacheFlag{
        IsNULL,
        IsNotNULL
      };

      struct State
      {
        StateFlag DFlag = Normal;
        REnode* Ccontinuation;
        RuneClass ValideRange;
        std::set<int> IndexSequence;
        std::vector<State*> FirstSet;
        std::map<int, std::vector<State*>> NextStates;
        State() : DFlag(), Ccontinuation(), ValideRange(){};
        State(std::set<int> IndexS, REnode* CurrState, RuneClass RC) : IndexSequence(IndexS), Ccontinuation(CurrState), ValideRange(RC){};
      };

      State* NState;
      State* MatchState = new FollowAtomata::State();
      REnodeClass REClass;
      struct NFACache{
        CacheFlag NCFlage;
        NFACache* left;
        NFACache* right;
        State* DS;
        NFACache() : NCFlage(), left(), right(){};
        NFACache(CacheFlag NCF, NFACache* N1, NFACache* N2) : NCFlage(NCF), left(N1), right(N2){};
      };
      std::map<REnode*, int> Node2Index; // map from the node to the index
      std::map<REnode*, std::vector<State*>> Node2NFAState; // map from the node to the index
      std::map<REnode*, std::vector<State*>> Node2LookAState; 
      int FindIndexOfNodes(REnode* e);
      std::vector<State*> MergeState(std::vector<State*> SV1, State* s2);
      int IndexMax = 0;
      NFACache* nfacache = new NFACache(IsNULL, nullptr, nullptr);
      std::pair<std::vector<FollowAtomata::State*>, std::vector<FollowAtomata::State*>> FirstNode(REnode* e1);
      NFACache* Step2Left(NFACache* DC, int c); // step to the left 
      NFACache* Step2Right(NFACache* DC, int c); // step to the left 
      State* FindInNFACache(NFACache* DC, State* s);
      std::vector<State*> StepOneByte(State* s, uint8_t c);
      bool Complement(State* InitState, std::string preffix, std::string &suffix);
      void Isnullable(REnode* e);
      static void DumpState(State* s);
      void ProcessCounting(RuneClass&);
      FollowAtomata();
      FollowAtomata(REnodeClass e);
      FollowAtomata(Node r);
  };


}
