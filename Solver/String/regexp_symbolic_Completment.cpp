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
    this->D1 = DFA(e1);
    Alphabet_completment = ComputeAlphabet(e1.ByteMap);
  }

  std::set<uint8_t> RegExpSymbolic::CompletmentDFA::ComputeAlphabet(uint8_t bytemap[256]){
    int color_completment = bytemap[255];
    std::set<uint8_t> alphabet_completment = e1.Alphabet;
    for (int i = 0; i <= 0xF7; i++){
      if (bytemap[i] == color_completment){
        alphabet_completment.insert(i);
      }
    }
    return alphabet_completment;
  }

  int CheckeRuneLevel(int i, int rune_level){
    if (i >= 0x00 && i <= 0x7F){
      return 0;
    }
    else if (i >= 0xC0 && i <= 0xDF){
      return 1;
    }
    else if (i >= 0xE0 && i <= 0xEF){
      return 2;
    }
    else if (i >= 0xF0 && i <= 0xF7){
      return 3;
    }
    else if (i >= 0x80 && i <= 0xBF){
      return rune_level - 1;
    }
    return -1;
  }

  std::string RegExpSymbolic::CompletmentDFA::ComputeCompletmentDFA(){
    std::string completment_str = Prefix_string;
    DFA::DFAState* curr_ = D1.DState;
    for (auto it : Prefix_string){
      curr_ = D1.StepOneByte(curr_, it);
      if (curr_ == nullptr)
        return "";
    }
    int rune_level = 0;
    for (auto it : Alphabet_completment){
      if (rune_level == 0){
        if (it >= 0x80 && it <= 0xBF){
          continue;  
        }
      }
    }
    return completment_str;
  }
}