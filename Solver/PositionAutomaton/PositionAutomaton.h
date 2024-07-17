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
      enum NFAStateFlag{
        Begin,
        Normal,
        Match,
        Unmatch
      };

      enum NFACacheFlag{
        IsNULL,
        IsNotNULL
      };

      struct NFAState
      {
        std::pair<REnode*, REnode*> Node2Continuation;
        NFAStateFlag NFlag;
        std::set<int> IndexSequence;
        std::map<REnode*, REnode*> NodeSequence;
        std::map<uint8_t, std::set<NFAState*>> Next;
        NFAState() : NFlag(), NodeSequence(){};
        NFAState(NFAStateFlag F,std::map<REnode*, REnode*> NS) : NFlag(F), NodeSequence(NS){};
      };

      NFAState* NState;
      REnodeClass REClass;
      struct NFACache{
        NFACacheFlag NCFlage;
        NFACache* left;
        NFACache* right;
        NFAState* DS;
        NFACache() : NCFlage(), left(), right(){};
        NFACache(NFACacheFlag NCF, NFACache* N1, NFACache* N2) : NCFlage(NCF), left(N1), right(N2){};
      };
      std::map<REnode*, int> Node2Index; // map from the node to the index
      std::map<REnode*, NFAState*> Node2NFAState; // map from the node to the index
      int IndexMax = 0;
      NFACache* nfacache = new NFACache(IsNULL, nullptr, nullptr);
      std::map<REnode*, REnode*> FirstNode(REnode* e1);
      NFACache* Step2Left(NFACache* DC, int c); // step to the left 
      NFACache* Step2Right(NFACache* DC, int c); // step to the left 
      NFAState* FindInNFACache(NFACache* DC, NFAState* s);
      std::set<NFAState*> StepOneByte(NFAState* s, uint8_t c);
      static void DumpState(NFAState* s);
      FollowAtomata();
      FollowAtomata(REnodeClass e);
      FollowAtomata(Node r);
  };
}
