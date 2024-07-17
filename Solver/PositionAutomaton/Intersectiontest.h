#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <queue>
#include <iostream>
#include <string.h>

#include "PositionAutomaton.h"
#include "../solver.h"



namespace solverbin{

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
			bool IsEmptyStateIn(std::vector<std::set<FollowAtomata::NFAState*>>);
			bool ComputAllState(std::vector<std::set<FollowAtomata::NFAState*>> NextV, int i, SimulationState* s, SimulationState* ns);
			bool IfMatch(SimulationState* SS);
			void InsertInCache(SimulationState* ss, SimulationCache* sc);
			bool IsInCache(SimulationState* ss, SimulationCache* sc);
			IntersectionK(std::vector<REnodeClass> RList);
			IntersectionK() {};
			bool Intersect();
			bool IsIntersect(SimulationState* s);
	};
}	