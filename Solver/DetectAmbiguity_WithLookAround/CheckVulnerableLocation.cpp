#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <queue>
#include <iostream>
#include <fstream>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <random>
#include <openssl/evp.h>
#include <queue>

#include "DetectAmbiguity.h"


namespace solverbin{
    // Find the vulnerable star closure
    void DetectABTNFA_Lookaround::CheckVulnerableStarClosure(std::deque<TernarySimulationState> S, unsigned int index){
        std::set<unsigned int> VulStarIDs;
        for (auto Index : S[0][index]->Ccontinuation->StarIDs){
            VulStarIDs.insert(Index);
        } 
        for (auto state : S){
            
        }
    }
        
    // Find the vulnerable path of p to q
    // TODO: Implement the function
    void DetectABTNFA_Lookaround::CheckVulnerablePath(std::deque<TernarySimulationState> S, unsigned int index){
        // 
    }

    // Find the vulnerable location
    void DetectABTNFA_Lookaround::FindVulnerableLocation(std::deque<TernarySimulationState> S){
        if (S[0][0]->Ccontinuation == S.back()[0]->Ccontinuation){
            // The location is vulnerable
            std::cout << "check the star closure" << std::endl;
            CheckVulnerableStarClosure(S, 0);
        }
        else
            CheckVulnerablePath(S, 0);

        if (S[0][1]->Ccontinuation == S.back()[1]->Ccontinuation){
            // The location is vulnerable
            std::cout << "check the star closure" << std::endl;
            CheckVulnerableStarClosure(S, 1);
        }
        else
            CheckVulnerablePath(S, 1);


        if (S[0][2]->Ccontinuation == S.back()[2]->Ccontinuation){
            // The location is vulnerable
            std::cout << "check the star closure" << std::endl;
            CheckVulnerableStarClosure(S, 2);
        }
        else
            CheckVulnerablePath(S, 2);
    }
}