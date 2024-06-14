#include "regexp_symbolic.h"
#include "../solver.h"

#include <cmath>
#include <map>
#include <list>
#include <bitset>



using namespace solverbin;



namespace solverbin{

  RegExpSymbolic::CompletmentDFA::CompletmentDFA(REnodeClass e1, std::string prefix_string){
    this->e1 = e1;
    this->Prefix_string = prefix_string;
    this->D1 = FULLmatchDFA(e1);
    Alphabet_completment = ComputeAlphabet(e1.ByteMap);
  }

  std::set<uint8_t> RegExpSymbolic::CompletmentDFA::ComputeAlphabet(uint8_t bytemap[256]){
    std::set<uint8_t> alphabet_completment = e1.Alphabet;
    for (int i = 0; i < 256; i++){
      if (bytemap[i] == 0){
        alphabet_completment.insert(i);
      }
    }
    return alphabet_completment;
  }

  std::string RegExpSymbolic::CompletmentDFA::ComputeCompletmentDFA(){
    std::string completment_str = Prefix_string;
    FULLmatchDFA::DFAState* curr_ = D1.DState;
    for (auto it : Prefix_string){
      curr_ = D1.StepOneByte(curr_, it);
      if (curr_ == nullptr)
        return "";
    }
    return completment_str;
  }
}