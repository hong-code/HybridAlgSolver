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
      bool CheckOneByte(std::vector<State*> DFAState, uint8_t c, RuneClass RC, std::string &suffix);
      void Isnullable(REnode* e);
      static void DumpState(State* s);
      void ProcessCounting(RuneClass&);
      FollowAtomata();
      FollowAtomata(REnodeClass e);
      FollowAtomata(Node r);
  };


  class DFA{
  public:
    enum DFAStateFlag{
      Begin,
      Normal,
      Match,
      Unmatch
    };

    enum DFACacheFlag{
      IsNULL,
      IsNotNULL
    };

    struct DFAState
    {
      DFAStateFlag DFlag;
      std::set<int> IndexSequence; //vector<int> Index
      std::set<FollowAtomata::State*> NodeSequence;
      std::map<uint8_t, DFAState*> Next;
      DFAState() : DFlag(), NodeSequence(){};
      DFAState(DFAStateFlag F,std::set<FollowAtomata::State*> NS) : DFlag(F), NodeSequence(NS){};
    };

    DFAState* DState;
    FollowAtomata* FA;
    struct DFACache{
      DFACacheFlag DCFlage;
      DFACache* left;
      DFACache* right;
      DFAState* DS;
      DFACache() : DCFlage(), left(), right(){};
      DFACache(DFACacheFlag DCF, DFACache* d1, DFACache* d2) : DCFlage(DCF), left(d1), right(d2){};
    };

    DFACache* dfacache = new DFACache(IsNULL, nullptr, nullptr);
    DFACache* Step2Left(DFACache* DC, int c); // step to the left 
    DFACache* Step2Right(DFACache* DC, int c); // step to the left 
    DFAState* FindInDFACache(DFACache* DC, DFAState* s);
    DFAState* StepOneByte(DFAState* s, uint8_t c);
    bool CheckOneByte(DFAState* DFAState, uint8_t Position, uint8_t Kind, RuneClass RC, std::string &suffix);
    bool Complement(DFAState* InitState, std::string preffix, std::string &suffix);
    void MaintainNode2Index(DFAState* s, std::set<FollowAtomata::State*> RS1);
    void DumpState(DFAState* s);
    bool Fullmatch(std::wstring Pattern, std::string str); 
    std::map<FollowAtomata::State*, int> Node2Index; // map from the node to the index
    int IndexMax = 0;
    DFA();
    DFA(FollowAtomata* fa);
  };


}
