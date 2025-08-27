#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <queue>
#include <iostream>
#include <string.h>

#include "../solver.h"



namespace solverbin{

  class PositionAutomaton{
    public:
      enum StateFlag{
        Begin,
        Normal,
        Match,
        Unmatch,
        Dead
      };

      enum CacheFlag{
        IsNULL,
        IsNotNULL
      };

      struct State
      {
        StateFlag DFlag = Normal;
        REnode* Ccontinuation;
        int Index;
        RuneClass ValideRange;
        std::vector<State*> FirstSet;
        std::vector<std::vector<State*>> NextStates;
        State() : DFlag(), Ccontinuation(), ValideRange(){};
        State(int IndexS, REnode* CurrState, RuneClass RC) : Index(IndexS), Ccontinuation(CurrState), ValideRange(RC){};
        State(int IndexS, REnode* CurrState, RuneClass RC, int ColorMax) : Index(IndexS), Ccontinuation(CurrState), ValideRange(RC) {NextStates = std::vector<std::vector<State*>>(ColorMax+1);};
      };

      struct Transition {
        int src;
        int dst;
        int symbol;
      };

      State* NState;
      State* DeadState = new State();
      State* MatchState = new PositionAutomaton::State();
      REnodeClass REClass;
      struct NFACache{
        CacheFlag NCFlage;
        NFACache* left;
        NFACache* right;
        State* DS;
        NFACache() : NCFlage(), left(), right(){};
        NFACache(CacheFlag NCF, NFACache* N1, NFACache* N2) : NCFlage(NCF), left(N1), right(N2){};
      };
      std::map<REnode*, std::vector<State*>> Node2NFAState; // map from the node to the index
      std::map<int, State*> Index2State;
      // int FindIndexOfNodes(REnode* e);
      std::vector<State*> MergeState(std::vector<State*> SV1, State* s2);
      int IndexMax = 0;
      NFACache* nfacache = new NFACache(IsNULL, nullptr, nullptr);
      std::vector<PositionAutomaton::State*> FirstNode(REnode* e1);
      NFACache* Step2Left(NFACache* DC, int c); // step to the left 
      NFACache* Step2Right(NFACache* DC, int c); // step to the left 
      std::vector<State*> StepOneByte(State* s, uint8_t c);
      bool CheckOneByte(std::vector<State*> DFAState, uint8_t c, RuneClass RC, std::string &suffix);
      void ComputeFullNFA(std::set<State*>& StateSet, std::vector<Transition>& TransitionSet);
      void Isnullable(REnode* e);
      static void DumpState(State* s);
      void ProcessCounting(RuneClass&);
      PositionAutomaton();
      PositionAutomaton(REnodeClass e);
      PositionAutomaton(Node r);
  };


  class DFA{
  public:
    enum DFAStateFlag{
      Begin,
      Normal,
      Match,
      Dead
    };

    enum DFACacheFlag{
      IsNULL,
      IsNotNULL
    };

    struct DFAState
    {
      DFAStateFlag DFlag;
      std::set<int> IndexSequence; //vector<int> Index
      std::set<PositionAutomaton::State*> NodeSequence;
      std::vector<DFAState*> Next; // 256 is the size of the byte map
      DFAState(int ColorMax) : DFlag(), NodeSequence(){Next = std::vector<DFAState*>(ColorMax+1, nullptr);};
      DFAState(DFAStateFlag F, std::set<PositionAutomaton::State*> NS, int ColorMax) : DFlag(F), NodeSequence(NS){Next = std::vector<DFAState*>(ColorMax+1, nullptr);};
    };

    DFAState* DState;
    DFAState* DeadState = new DFAState(Dead, std::set<PositionAutomaton::State*>(), 0);
    PositionAutomaton* FA;
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
    void MaintainNode2Index(DFAState* s, std::set<PositionAutomaton::State*> RS1);
    void DumpState(DFAState* s);
    bool Fullmatch(DFAState* Init_state, std::string str); 
    std::map<PositionAutomaton::State*, int> Node2Index; // map from the node to the index
    int IndexMax = 0;
    DFA() {};
    DFA(PositionAutomaton* fa);
  };


}
