#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <queue>
#include <iostream>
#include <string.h>

#include "../solver.h"
#include "../PositionAutomaton/PositionAutomaton.h"

namespace solverbin{
    class DetectABTNFA_Lookaround{
      public:
        REnodeClass e1;
        FollowAtomata F1;
        enum DetectABTFlag{
          Begin,
          Normal,
          IsSat
        };
        typedef std::vector<FollowAtomata::State*> TernarySimulationState;
        // struct SimulationState{
        //   FollowAtomata::State* NS1;
        //   FollowAtomata::State* NS2;
        //   std::map<u_int8_t, std::set<SimulationState*>> byte2state;
        //   friend bool operator < (const SimulationState& n1, const SimulationState& n2)
        //   {
            
        //     if (n1.NS1->Ccontinuation != n2.NS1->Ccontinuation) {
        //       return n1.NS1->Ccontinuation < n2.NS1->Ccontinuation;
        //     }
        //     else
        //       return n1.NS2->Ccontinuation < n2.NS2->Ccontinuation;
        //   }
        //   SimulationState(FollowAtomata::State* e1, FollowAtomata::State* e2) : NS1(e1), NS2(e2){};
        // };

        // struct TernarySimulationState{
        //   DetectABTFlag IFlag;
        //   bool IsSat;
        //   bool IsDone;
        //   FollowAtomata::State* NS1;
        //   // SimulationState NS2;
        //   std::map<u_int8_t, std::set<TernarySimulationState*>> byte2state;
        //   friend bool operator < (const TernarySimulationState& n1, const TernarySimulationState& n2)
        //   {
        //     if (n1.NS1 != n2.NS1) {
        //       return n1.NS1 < n2.NS1;
        //     }
        //     if (n1.NS2->NS1 != n2.NS2->NS1) {
        //       return n1.NS2->NS1 < n2.NS2->NS1;
        //     }
        //     else
        //       return n1.NS2->NS2 < n2.NS2->NS2;
        //   }
        //   TernarySimulationState(DetectABTFlag IF, FollowAtomata::State* e1, FollowAtomata::State* e2, FollowAtomata::State* e3) : IFlag(IF), NS1(e1), NS2(new SimulationState(e2, e3)){};
        // };
        // 使用 std::set 来存储无重复的元素集合
        std::set<std::vector<FollowAtomata::State*>> DoneCache;

        // 辅助函数：将输入的元素排序
        std::vector<FollowAtomata::State*> getSorted(const std::vector<FollowAtomata::State*>& element) {
            std::vector<FollowAtomata::State*> sortedElement = element;
            std::sort(sortedElement.begin(), sortedElement.end());
            return sortedElement;
        }

        void DumpTernarySimulationState(TernarySimulationState TSS);
        TernarySimulationState SSBegin;
        std::set<uint8_t> Alphabet;
        std::set<TernarySimulationState> SimulationCache;
        // std::map<TernarySimulationState, TernarySimulationState*> DoneCache;
        std::queue<TernarySimulationState> TODOCache;
        std::string InterStr;
        std::string WitnessStr;
        std::string Suffix;
        std::string LastWord;
        std::string attack_string;
        std::string Output;
        std::vector<uint8_t> WitnessStrColor;
        std::map<uint8_t, std::vector<uint8_t>> ColorMap;
        int length = 0;
        int isLazy = 1;
        int IsRandom = 0;
        int NumberOfCandidates = 0;
        int IsFullMatch = 0;
        int ConsiderReverse = 0;
        std::multimap<FollowAtomata::State*, TernarySimulationState> SimulationQ;
        uint8_t ByteMap[256];
        std::set<TernarySimulationState> DTSimulationState(TernarySimulationState TS);
        void ComputeAlphabet_Colormap(uint8_t* ByteMap, std::set<uint8_t> &Alphabet);
        std::string GenerateRandomWitness(std::string& WitnessStr);
        void DumpAlphabet(std::set<uint8_t>& A);
        DetectABTNFA_Lookaround(REnodeClass e1, int l, std::string Path, int IsLazy, int IsRandom, int IsFullMatch, int ConsiderReverse);
        DetectABTNFA_Lookaround() {};
        bool Writefile();
        bool WriteInBase64();
        bool Intersect();
        bool IsABT(TernarySimulationState s);
        bool DetectABTOFS(TernarySimulationState s, std::set<TernarySimulationState> TSSET);
        bool DetectABTOFSDeepFirst(TernarySimulationState TSS_Ex, std::set<TernarySimulationState> TSSET);
    };
}