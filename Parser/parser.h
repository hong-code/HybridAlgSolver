#include <iostream>
#include "../Solver/solver.h"



namespace solverbin {
  class Parser{
    public:
      #ifndef RuneSequence
        typedef std::vector<REnode*> RuneSequence;
      #endif  
      std::string regex_string;
      int CaptureGroup = 1;
      REnodeClass Re;
      bool GREWIA = false;
      Parser(std::wstring regex_string, bool GREWIA);
      Parser();
      REnode* Parse(REnode* r, std::wstring &RegexString);
      signed int getcharacter(std::wstring &RegexString);
      void InsertRune(std::vector<RuneClass> &RuneSet, RuneClass RC);
      REnode* LargeUnicodeBlock2Node(std::wstring &RegexString);
      REnode* RetNode(std::vector<RuneClass> &vecR);
      std::vector<RuneClass> unicode2utf_8(unsigned long unicode);
      std::vector<RuneClass> ProcessingBlash(std::wstring &RegexString);
  };
}