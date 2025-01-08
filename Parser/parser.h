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
      bool GREWIA = false;
      Parer(std::wstring regex_string, bool GREWIA);
      Parer();
      REnode* Parse(REnode* r, std::wstring &RegexString);
      signed int getcharacter(std::wstring &RegexString);
      void InsertRune(std::vector<RuneClass> &RuneSet, RuneClass RC);
      REnode* LargeUnicodeBlock2Node(std::wstring &RegexString);
      REnode* RetNode(std::vector<RuneClass> &vecR);
      std::vector<RuneClass> unicode2utf_8(unsigned long unicode);
      std::vector<RuneClass> ProcessingBlash(std::wstring &RegexString);
  };
}