#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <queue>
#include <iostream>
#include <string.h>

#include "../solver.h"
#include "../String/regexp_symbolic.h"

namespace solverbin{
    class DetectABTNFA{
      public:
        REnodeClass e1;
        RegExpSymbolic::FollowAtomata F1;
        enum DetectABTFlag{
          Begin,
          Normal,
          IsSat
        };
        struct SimulationState{
          RegExpSymbolic::FollowAtomata::NFAState* NS1;
          RegExpSymbolic::FollowAtomata::NFAState* NS2;
          std::map<u_int8_t, std::set<SimulationState*>> byte2state;
          friend bool operator < (const SimulationState& n1, const SimulationState& n2)
          {
            if (n1.NS1->Node2Continuation.first != n2.NS1->Node2Continuation.first) {
              return n1.NS1->Node2Continuation.first < n2.NS1->Node2Continuation.first;
            }
            else
              return n1.NS2->Node2Continuation.first < n2.NS2->Node2Continuation.first;
          }
          SimulationState(RegExpSymbolic::FollowAtomata::NFAState* e1, RegExpSymbolic::FollowAtomata::NFAState* e2) : NS1(e1), NS2(e2){};
        };

        struct TernarySimulationState{
          DetectABTFlag IFlag;
          bool IsSat;
          bool IsDone;
          RegExpSymbolic::FollowAtomata::NFAState* NS1;
          SimulationState* NS2;
          std::map<u_int8_t, std::set<TernarySimulationState*>> byte2state;
          friend bool operator < (const TernarySimulationState& n1, const TernarySimulationState& n2)
          {
            if (n1.NS1->Node2Continuation.first != n2.NS1->Node2Continuation.first) {
              return n1.NS1->Node2Continuation.first < n2.NS1->Node2Continuation.first;
            }
            if (n1.NS2->NS1->Node2Continuation.first != n2.NS2->NS1->Node2Continuation.first) {
              return n1.NS2->NS1->Node2Continuation.first < n2.NS2->NS1->Node2Continuation.first;
            }
            else
              return n1.NS2->NS2->Node2Continuation.first < n2.NS2->NS2->Node2Continuation.first;
          }
          TernarySimulationState(DetectABTFlag IF, RegExpSymbolic::FollowAtomata::NFAState* e1, RegExpSymbolic::FollowAtomata::NFAState* e2, RegExpSymbolic::FollowAtomata::NFAState* e3) : IFlag(IF), NS1(e1), NS2(new SimulationState(e2, e3)){};
        };
        void DumpTernarySimulationState(TernarySimulationState* TSS);
        TernarySimulationState* SSBegin;
        std::set<uint8_t> Alphabet;
        std::map<TernarySimulationState, TernarySimulationState*> SimulationCache;
        std::map<TernarySimulationState, TernarySimulationState*> DoneCache;
        std::queue<TernarySimulationState> TODOCache;
        std::string InterStr;
        std::string WitnessStr;
        std::multimap<RegExpSymbolic::FollowAtomata::NFAState*, TernarySimulationState*> SimulationQ;
        uint8_t ByteMap[256];
        std::set<TernarySimulationState> DTSimulationState(TernarySimulationState* TS);
        DetectABTNFA(REnodeClass e1);
        DetectABTNFA() {};
        bool Intersect();
        bool IsABT(TernarySimulationState* s);
        bool DetectABTOFS(TernarySimulationState* s, std::set<TernarySimulationState> TSSET);
    };
}