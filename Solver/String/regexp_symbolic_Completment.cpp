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
  }

  std::string RegExpSymbolic::CompletmentDFA::ComputeCompletmentDFA(){
    FULLmatchDFA::DFAState* curr_ = D1.DState;
    for (auto it : Prefix_string){
      curr_ = D1.StepOneByte(curr_, it);
      if (curr_ == nullptr)
        return "";
    }
    
  }
}