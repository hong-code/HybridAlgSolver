/******************************************************************************
 * Top contributors (to current version):
 *   Weihao Su
 *
 * This file is part of the cvc5 project.
 *
 * Copyright (c) 2009-2023 by the authors listed in the file AUTHORS
 * in the top-level source directory and their institutional affiliations.
 * All rights reserved.  See the file COPYING in the top-level source
 * directory for licensing information.
 * ****************************************************************************
 *
 * Incremental Simulation-based Algorithms for Regular Expression Membership Constraints
 */

#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <queue>
#include <iostream>
#include <string.h>

#include "../solver.h"




namespace solverbin {
  #ifndef RuneVector
  typedef std::vector<RuneClass> RuneVector;
  #endif  
  #ifndef int_21
  typedef signed int int_21;
  #endif 

  class RegExpSymbolic {
  private:
//        int label = 0;
//        std::map<int, std::vector<charClass>> position;
//        Node varepsilon = Word::mkEmptyWord(NodeManager::currentNM()->stringType());
//        Node varnothing = NodeManager::currentNM()->mkNode(kind::REGEXP_NONE,std::vector<Node>{});
  public:
    ~RegExpSymbolic() {}
    RegExpSymbolic() {}
    enum REGEXP_OP_KIND{
      REGEXP_string, /**< convert string to regexp (332) */
      REGEXP_concat, /**< regexp concat (333) */
      REGEXP_union, /**< regexp union (334) */
      REGEXP_inter, /**< regexp intersection (335) */
      REGEXP_diff, /**< regexp difference (336) */
      REGEXP_rune, /**< regexp RUNE (337) */
      REGEXP_star, /**< regexp * (338) */
      REGEXP_plus, /**< regexp + (339) */
      REGEXP_opt, /**< regexp ? (340) */
      REGEXP_charclass, /**< regexp range (341) */
      REGEXP_complement, /**< regexp complement (342) */
      REGEXP_none, /**< regexp empty (343) */
      REGEXP_loop,
      // REGEXP_all, /**< regexp all (344) */
      // REGEXP_allchar, /**< regexp all characters (345) */
      REGEXP_repeat, /**< regular expression repeat; first parameter is a REGEXP_REPEAT_OP, second is a regular expression term (347) */
    };



    std::string niceChar(Node r);

    bool AC_include(Node e1, Node e2);

    bool FULLMATCH(std::wstring e1, std::string str); // check if the node is full match

    static void DumpAlphabet(std::set<uint8_t>& A); // dump the alphabet 


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
        NFACache* Step2Left(NFACache* DC, int c); // step to the left 
        NFACache* Step2Right(NFACache* DC, int c); // step to the left 
        NFAState* FindInNFACache(NFACache* DC, NFAState* s);
        void CheckingFollow(std::set<RegExpSymbolic::FollowAtomata::NFAState*> &NFAStateVec);
        std::set<NFAState*> StepOneByte(NFAState* s, uint8_t c);
        static void DumpState(NFAState* s);
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
          std::set<int> IndexSequence;
          std::map<REnode*, REnode*> NodeSequence;
          std::map<uint8_t, DFAState*> Next;
          DFAState() : DFlag(), NodeSequence(){};
          DFAState(DFAStateFlag F,std::map<REnode*, REnode*> NS) : DFlag(F), NodeSequence(NS){};
        };

        DFAState* DState;
        REnodeClass REClass;
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
        void MaintainNode2Index(DFAState* s, std::map<REnode*, REnode*> RS1);
        void DumpState(DFAState* s);
        bool Fullmatch(std::wstring Pattern, std::string str); 
        std::map<REnode*, int> Node2Index; // map from the node to the index
        int IndexMax = 0;
        DFA();
        DFA(REnodeClass e);
    };
    DFA FMDFA;

    class IntersectionDFA{
      public:
        REnodeClass e1;
        REnodeClass e2;
        DFA D1;
        DFA D2;
        enum IntersectionFlag{
          Begin,
          Normal,
          Match,
          Isintersect
        };
        struct SimulationState{
          IntersectionFlag IFlag;
          bool IsIntersect;
          bool IsDone;
          DFA::DFA::DFAState* d1;
          DFA::DFA::DFAState* d2;
          std::map<u_int8_t, SimulationState*> byte2state;
          friend bool operator < (const SimulationState& n1, const SimulationState& n2)
          {
            if (n1.d1 != n2.d1) {
              return n1.d1 < n2.d1;
            }
            else
              return n1.d2 < n2.d2;
          }
          SimulationState(IntersectionFlag IF, DFA::DFA::DFAState* e1, DFA::DFA::DFAState* e2) : IFlag(IF), d1(e1), d2(e2){};
        };
        void DumpSimulationState(SimulationState* s);
        SimulationState* SSBegin;
        std::set<uint8_t> Alphabet;
        std::map<SimulationState, SimulationState*> SimulationCache;
        std::map<SimulationState, SimulationState*> DoneCache;
        std::queue<SimulationState> TODOCache;
        uint8_t ByteMap[256];
        void ComputeAlphabet(std::set<uint8_t>& A1, uint8_t* ByteMap1, uint8_t* ByteMap2);
        IntersectionDFA(Node r1, Node r2);
        IntersectionDFA() {};
        bool Intersect();
        bool IsIntersect(SimulationState* s);
    };

    IntersectionDFA IS;


    class IntersectionNFA{
      public:
        REnodeClass e1;
        REnodeClass e2;
        FollowAtomata F1;
        FollowAtomata F2;
        enum IntersectionFlag{
          Begin,
          Normal,
          Match,
          Isintersect
        };
        struct SimulationState{
          IntersectionFlag IFlag;
          bool IsIntersect;
          bool IsDone;
          FollowAtomata::NFAState* NS1;
          FollowAtomata::NFAState* NS2;
          std::map<u_int8_t, std::set<SimulationState*>> byte2state;
          friend bool operator < (const SimulationState& n1, const SimulationState& n2)
          {
            if (n1.NS1->Node2Continuation.first != n2.NS1->Node2Continuation.first) {
              return n1.NS1->Node2Continuation.first < n2.NS1->Node2Continuation.first;
            }
            else
              return n1.NS2->Node2Continuation.first < n2.NS2->Node2Continuation.first;
          }
          SimulationState(IntersectionFlag IF, FollowAtomata::NFAState* e1, FollowAtomata::NFAState* e2) : IFlag(IF), NS1(e1), NS2(e2){};
        };
        void DumpSimulationState(SimulationState* s);
        SimulationState* SSBegin;
        std::set<uint8_t> Alphabet;
        std::map<SimulationState, SimulationState*> SimulationCache;
        std::map<SimulationState, SimulationState*> DoneCache;
        std::queue<SimulationState> TODOCache;
        std::string InterStr;
        uint8_t ByteMap[256];
        void ComputeAlphabet(std::set<uint8_t>& A1, uint8_t* ByteMap1, uint8_t* ByteMap2);
        IntersectionNFA(Node r1, Node r2);
        IntersectionNFA() {};
        IntersectionNFA(REnodeClass r1, REnodeClass r2);
        bool Intersect();
        bool IsIntersect(SimulationState* s);
    };

    IntersectionNFA INS;


    class InclusionDFA{
      public:
        REnodeClass e1;
        REnodeClass e2;
        DFA D1;
        DFA D2;
        enum InclusionFlag{
          Begin,
          Normal,
          Match,
          IsInclusion
        };
        enum InclusionState{
          equivalence,
          LBelong2R,
          RBelong2L
        };
        InclusionState ICState = equivalence;
        struct SimulationState{
          InclusionFlag IFlag;
          bool IsInclusion;
          bool IsDone;
          DFA::DFA::DFAState* d1;
          DFA::DFA::DFAState* d2;
          std::map<u_int8_t, SimulationState*> byte2state;
          friend bool operator < (const SimulationState& n1, const SimulationState& n2)
          {
            if (n1.d1 != n2.d1) {
              return n1.d1 < n2.d1;
            }
            else
              return n1.d2 < n2.d2;
          }
          SimulationState(InclusionFlag IF, DFA::DFA::DFAState* e1, DFA::DFA::DFAState* e2) : IFlag(IF), d1(e1), d2(e2){};
        };
        void DumpSimulationState(SimulationState* s);
        SimulationState* SSBegin;
        std::set<uint8_t> Alphabet;
        std::map<SimulationState, SimulationState*> SimulationCache;
        std::map<SimulationState, SimulationState*> DoneCache;
        std::queue<SimulationState> TODOCache;
        uint8_t ByteMap[256];
        void ComputeAlphabet(std::set<uint8_t>& A1, uint8_t* ByteMap1, uint8_t* ByteMap2);
        InclusionDFA(Node r1, Node r2);
        InclusionDFA() {};
        bool Inclusion();
        bool Isinclusion(SimulationState* s);
    };

    InclusionDFA ICS;

    class IntersectionK{
      public:
        std::vector<REnodeClass> REClassList;
        std::vector<FollowAtomata> FList;
        std::vector<REnode*> ReNodeList;
        int RegExN;
        enum IntersectionFlag{
          Begin,
          Normal,
          Match,
          Isintersect
        };

        struct SimulationState{
          FollowAtomata::NFAState* NS;
          SimulationState* Next;
          std::map<u_int8_t, std::set<SimulationState*>> byte2state;
          SimulationState() : NS(), Next() {};
          SimulationState(FollowAtomata::NFAState* ns) : NS(ns), Next(nullptr) {};
        };

        // a Cache store k state
        struct SimulationCache{
          FollowAtomata::NFAState* NS1;
          std::map<REnode*, SimulationCache*> NS2Cache;
          SimulationCache() : NS1()  {};
          SimulationCache(FollowAtomata::NFAState* ns) : NS1(ns) {};
        };

        void DumpSimulationState(SimulationState* s);
        SimulationState* SSBegin;
        std::set<uint8_t> Alphabet;
        SimulationCache* Scache;
        std::string InterStr;
        uint8_t ByteMap[256];
        bool IsinAlphabet(uint8_t k, std::vector<REnodeClass> REClassList);
        void ComputeAlphabet(std::vector<REnodeClass> REClassList);
        bool IsEmptyStateIn(std::vector<std::set<RegExpSymbolic::FollowAtomata::NFAState*>>);
        bool ComputAllState(std::vector<std::set<RegExpSymbolic::FollowAtomata::NFAState*>> NextV, int i, SimulationState* s, SimulationState* ns);
        bool IfMatch(SimulationState* SS);
        void InsertInCache(SimulationState* ss, SimulationCache* sc);
        bool IsInCache(SimulationState* ss, SimulationCache* sc);
        IntersectionK(std::vector<REnodeClass> RList);
        IntersectionK() {};
        bool Intersect();
        bool IsIntersect(SimulationState* s);
    };

    class CompletmentDFA{
      public:
        REnodeClass e1;
        DFA D1;
        std::string Prefix_string;
        std::set<uint8_t> Alphabet_completment;
        CompletmentDFA() {};
        CompletmentDFA(REnodeClass e1, std::string Prefix_string);
        std::set<uint8_t> ComputeAlphabet(uint8_t bytemap[256]);
        int CheckeRuneLevel(int i, int rune_level);
        std::string ComputeCompletmentDFA();
    };

  };//class




}

