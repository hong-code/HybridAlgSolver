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
    std::set<unsigned int> DetectABTNFA_Lookaround::CheckVulnerableStarClosure(std::deque<TernarySimulationState> S, unsigned int index){
        std::set<unsigned int> VulStarIDs;
        for (unsigned int ID = 0; ID < e1.StarID; ID++){
            bool isVulnerable = true;
            for (auto state : S){
                for (auto NodeIndex : state[index]->IndexSequence){
                    auto Node = F1.Index2Node[NodeIndex];
                    if (Node->StarIDs.find(ID) == Node->StarIDs.end()){
                        isVulnerable = false;
                        break;
                    }
                }
            }
            if (isVulnerable)
                VulStarIDs.insert(ID);
        }
        return VulStarIDs;
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
            std::cout << "check the star closure: " << std::endl;
            auto VulSet = CheckVulnerableStarClosure(S, 0);
            std::cout << "The IDs of the vulnerable star closures: ";
            for (auto ID : VulSet){
                std::cout << ID << " ";
                e1.RegexString.erase(e1.StarID2StarPosition[ID], 1);
                e1.RegexString.insert(e1.StarID2StarPosition[ID], L"{0, 10}");
            }
            std::cout << std::endl;
            std::wcout << "The new regex string is " << e1.RegexString << std::endl;
            
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