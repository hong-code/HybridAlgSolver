#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <queue>
#include <iostream>
#include <string.h>
#include <stack>

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
        std::set<unsigned int> VulnerableStar;
        std::deque<TernarySimulationState> S;
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
        void FindVulnerableLocation(std::deque<TernarySimulationState> S);
        std::set<unsigned int> CheckVulnerableStarClosure(std::deque<TernarySimulationState> S, unsigned int index);
        void CheckVulnerablePath(std::deque<TernarySimulationState> S, unsigned int index);
        bool Writefile();
        bool WriteInBase64();
        bool Intersect();
        bool IsABT(TernarySimulationState s);
        bool DetectABTOFS(TernarySimulationState s, std::set<TernarySimulationState> TSSET);
        bool DetectABTOFSDeepFirst(TernarySimulationState TSS_Ex, std::set<TernarySimulationState> TSSET);
    };
}