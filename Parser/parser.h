#include <iostream>
#include "../Solver/solver.h"
#include "../Solver/String/regexp_symbolic.h"


namespace solverbin {
  class Parer{
    public:
      #ifndef RuneSequence
        typedef std::vector<REnode*> RuneSequence;
      #endif  
      std::string regex_string;
      REnodeClass Re;
      REnode* root =  Re.initREnode(Kind::REGEXP_CONCAT, {0, 0});
      REnode* Parse(REnode* r, std::string &RegexString);
      int getcharacter(std::string &RegexString);
  };
}