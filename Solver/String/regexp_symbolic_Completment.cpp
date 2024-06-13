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

}