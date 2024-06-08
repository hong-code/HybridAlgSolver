#include <iostream>
#include "../Solver/solver.h"



namespace solverbin {
  class Parer{
    public:
      #ifndef RuneSequence
        typedef std::vector<REnode*> RuneSequence;
      #endif  
      std::string regex_string;
      REnodeClass Re;
      Parer(std::string regex_string);
      Parer();
      REnode* Parse(REnode* r, std::string &RegexString);
      signed int getcharacter(std::string &RegexString);
      void InsertRune(std::vector<RuneClass> &RuneSet, RuneClass RC);
      REnode* LargeUnicodeBlock2Node(std::string &RegexString);
      REnode* RetNode(std::vector<RuneClass> &vecR);
      std::vector<RuneClass> unicode2utf_8(unsigned long unicode);
      std::vector<RuneClass> ProcessingBlash(std::string &RegexString);
  };
}