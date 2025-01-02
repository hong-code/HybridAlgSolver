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
#include "DetectAmbiguity.h"
#include <openssl/evp.h>

namespace solverbin{


  	void DetectABTNFA_Lookaround::ComputeAlphabet_Colormap(uint8_t* ByteMap, std::set<uint8_t> &Alphabet, std::map<uint8_t, std::vector<uint8_t>> ColorMap){
		std::set<uint8_t> color_set;
		color_set.insert(ByteMap[0]);
    std::vector<uint8_t> RuneRange;
    ColorMap.insert(std::make_pair(ByteMap[0], RuneRange));
		if (ByteMap[0] != 0){

    }
			Alphabet.insert(0);
		for (int i = 0; i < 256; i++){
			if (color_set.find(ByteMap[i]) != color_set.end()) 
				continue;
			else{
				color_set.insert(ByteMap[i]);
				if (ByteMap[i] != 0)
					Alphabet.insert(i);
			}
		}
	}

  std::string base64_encode(const std::string &input) {
    // 计算编码后的大小
    int len = 4 * ((input.length() + 2) / 3);
    char *encoded = new char[len + 1];

    // 编码
    EVP_EncodeBlock((unsigned char*)encoded, (const unsigned char*)input.c_str(), input.length());

    std::string result(encoded);
    delete[] encoded;
    return result;
}

  void DetectABTNFA_Lookaround::DumpAlphabet(std::set<uint8_t>& A){
    std::cout << "The alphabet: ";
    for (auto it : A){
      std::cout << int(it) << " ";
    }
    std::cout << "" << std::endl;
  }

  bool DetectABTNFA_Lookaround::Writefile(){
    attack_string = InterStr + WitnessStr;
    auto initState = solverbin::FollowAtomata(this->e1);
    auto dfa = solverbin::DFA(&initState);
    if (!dfa.Complement(dfa.DState, attack_string, Suffix)) 
      std::cout <<  "no match" << std::endl;
    std::ofstream Outfile;
    NumberOfCandidates++;
    if (mkdir(Output.c_str(), 0777) == 0) {
      std::cout << "Directory created successfully: " << Output << std::endl;
    } else {
      std::cerr << "Error: Unable to create directory " << Output << std::endl;
    }
    Outfile.open(Output + "/" + std::to_string(NumberOfCandidates) + ".txt");
    if (!Outfile.is_open()) {
      std::cerr << "Failed to open the file." << std::endl;
      return 0;
    }
    while (attack_string.size() <= length)
      attack_string.append(WitnessStr);
    attack_string.append(Suffix);  
    Outfile << attack_string;
    std::cout << "file is closed" << std::endl;
    Suffix.clear();
    Outfile.close();
    return true;
  }

  bool DetectABTNFA_Lookaround::WriteInBase64() {
    attack_string = InterStr + WitnessStr;
    auto initState = solverbin::FollowAtomata(this->e1);
    auto dfa = solverbin::DFA(&initState);
    if (!dfa.Complement(dfa.DState, attack_string, Suffix))
      std::cout <<  "no match" << std::endl;
    std::ofstream Outfile;
    NumberOfCandidates++;
    if (mkdir(Output.c_str(), 0777) == 0) {
      std::cout << "Directory created successfully: " << Output << std::endl;
    } else {
      std::cerr << "Error: Unable to create directory " << Output << std::endl;
    }
    Outfile.open(Output + "/" + std::to_string(NumberOfCandidates) + ".txt");
    if (!Outfile.is_open()) {
      std::cerr << "Failed to open the file." << std::endl;
      return 0;
    }
    Outfile << base64_encode(InterStr) << '\n';
    Outfile << base64_encode(WitnessStr) << '\n';
    Outfile << base64_encode(Suffix);
    std::cout << "file is closed" << std::endl;
    Suffix.clear();
    Outfile.close();
    return true;
  }

  DetectABTNFA_Lookaround::DetectABTNFA_Lookaround(REnodeClass r, int l, std::string Path, int Is_Lazy){
    isLazy = Is_Lazy;
    length = l;
    Output = Path;
    e1 = r;
    F1 = FollowAtomata(e1);
    SSBegin = new TernarySimulationState(Begin, F1.NState, F1.NState, F1.NState);
    e1.ComputeAlphabet(e1.ByteMap, Alphabet);
    if (debug.PrintBytemap) e1.BuildBytemapToString(e1.ByteMap);
    if (debug.PrintAlphabet) DumpAlphabet(Alphabet);
  }

  void DetectABTNFA_Lookaround::DumpTernarySimulationState(TernarySimulationState* TSS){
    std::cout << "SimulationState: " << TSS << " IFlag: " << TSS->IFlag << " IsIntersect: " << TSS->IsSat << 
    " IsDone" << TSS->IsDone << std::endl;
    std::cout << "continuation" << e1.REnodeToString(TSS->NS1->Ccontinuation) << std::endl;
    std::cout << ": continuation" << e1.REnodeToString(TSS->NS2->NS1->Ccontinuation) << std::endl;
    std::cout << ": continuation" << e1.REnodeToString(TSS->NS2->NS2->Ccontinuation) << std::endl;
    F1.DumpState(TSS->NS1);
    F1.DumpState(TSS->NS2->NS1);
    F1.DumpState(TSS->NS2->NS2);
  }

  std::set<DetectABTNFA_Lookaround::TernarySimulationState> DetectABTNFA_Lookaround::DTSimulationState(TernarySimulationState* TS){
    std::set<DetectABTNFA_Lookaround::TernarySimulationState> TSSSet;
    if (TS->NS1->Ccontinuation == TS->NS2->NS1->Ccontinuation && TS->NS1->Ccontinuation != TS->NS2->NS2->Ccontinuation){
      TSSSet.insert(TernarySimulationState(Normal, TS->NS1, TS->NS2->NS2, TS->NS2->NS2));
      TSSSet.insert(TernarySimulationState(Normal, TS->NS2->NS2, TS->NS1, TS->NS2->NS2));
    }
    else if (TS->NS1->Ccontinuation == TS->NS2->NS2->Ccontinuation && TS->NS1->Ccontinuation != TS->NS2->NS1->Ccontinuation){
      TSSSet.insert(TernarySimulationState(Normal, TS->NS1, TS->NS2->NS1, TS->NS2->NS1));
      TSSSet.insert(TernarySimulationState(Normal, TS->NS2->NS1, TS->NS2->NS1, TS->NS1));
    }
    else if (TS->NS2->NS1->Ccontinuation == TS->NS2->NS2->Ccontinuation && TS->NS1->Ccontinuation != TS->NS2->NS1->Ccontinuation){
      TSSSet.insert(TernarySimulationState(Normal, TS->NS1, TS->NS1, TS->NS2->NS1));
      TSSSet.insert(TernarySimulationState(Normal, TS->NS1, TS->NS2->NS1, TS->NS1));
    }
    return TSSSet;
  }

  bool DetectABTNFA_Lookaround::DetectABTOFS(TernarySimulationState* TSS, std::set<TernarySimulationState> TSSET){
    if (debug.PrintSimulation){
      std::cout << "witness str: " << WitnessStr << std::endl;
      DumpTernarySimulationState(TSS);
    }
    for (auto c : Alphabet){
      if (debug.PrintSimulation) std::cout << "matching: " << int(c) << " " << std::endl;
      auto nextns1 = F1.StepOneByte(TSS->NS1, c);
      auto nextns2 = F1.StepOneByte(TSS->NS2->NS1, c);
      auto nextns3 = F1.StepOneByte(TSS->NS2->NS2, c);
      if (nextns1.empty() || nextns2.empty() || nextns3.empty())
        continue;
      for (auto nextns1_it : nextns1){
        for (auto nextns2_it : nextns2){
          for (auto nextns3_it : nextns3){
            auto ns = new TernarySimulationState(Normal, nextns1_it, nextns2_it, nextns3_it);
            if (debug.PrintSimulation) DumpTernarySimulationState(TSS);
            auto itc = SimulationCache.find(*ns);
            if (itc != SimulationCache.end()){
              
            }
            else{
              SimulationCache.insert(std::make_pair(*ns, ns));
              WitnessStr.push_back(c);
              if (TSSET.find(*ns) != TSSET.end()){
                return true;
              }
              if (DetectABTOFS(ns, TSSET)){
                return true;
              }
              else
                WitnessStr.pop_back();
            }
          }
        }
      }
    }
    return false;
  }

  bool DetectABTNFA_Lookaround::IsABT(TernarySimulationState* TSS){
    if (debug.PrintSimulation){
      std::cout << "witness str: " << WitnessStr << std::endl;
      DumpTernarySimulationState(TSS);
    }
    for (auto c : Alphabet){
      if (debug.PrintSimulation) std::cout << "matching: " << int(c) << " " << std::endl;
      auto nextns1 = F1.StepOneByte(TSS->NS1, c);
      auto nextns2 = F1.StepOneByte(TSS->NS2->NS1, c);
      auto nextns3 = F1.StepOneByte(TSS->NS2->NS2, c);
      if (nextns1.empty() || nextns2.empty() || nextns3.empty())
        continue;
      for (auto nextns1_it : nextns1){
        for (auto nextns2_it : nextns2){
          for (auto nextns3_it : nextns3){
            auto ns = new TernarySimulationState(Normal, nextns1_it, nextns2_it, nextns3_it);
            if (debug.PrintSimulation) DumpTernarySimulationState(ns);
            auto itc = DoneCache.find(*ns);
            if (itc != DoneCache.end()){
            }
            else{
              DoneCache.insert(std::make_pair(*ns, ns));
              auto TSSET = DTSimulationState(ns);
              InterStr.push_back(c);
              if (!TSSET.empty()){
                if (DetectABTOFS(ns, TSSET)){
                  std::string Preff = InterStr + WitnessStr;
                  if (Writefile()){  
                    if (isLazy)
                      return true;
                    else{
                      SimulationCache.clear();
                      WitnessStr = "";
                    }
                  }
                }
                else {
                  SimulationCache.clear();
                  WitnessStr = "";
                }
              }
              if (IsABT(ns)){
                return true;
              }
              else {
                InterStr.pop_back();
              }
            }
          }
        }
      }
    }
    return false;
  }
  
}