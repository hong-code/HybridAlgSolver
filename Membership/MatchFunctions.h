#include <iostream>
#include "../Solver/solver.h"
#include "../Solver/String/regexp_symbolic.h"

namespace solverbin {

  class MatchFunctions{
    class FullMatch{
    private:
      /* data */
    public:
      RegExpSymbolic::DFA dfa;
      REnodeClass e1;
      bool Fullmatch(std::string str);
      ~FullMatch(){};
      FullMatch(REnodeClass e)
      {
        e1 = e;
        dfa = RegExpSymbolic::DFA(e);
      }
      
      FullMatch(){}
    };

  };
  

}