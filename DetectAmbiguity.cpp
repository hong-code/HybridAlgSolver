#include <iostream>
#include <fstream>
#include <locale>
#include <codecvt>
#include <unistd.h>
#include "Solver/solver_kind.h"
#include "Parser/parser.h"
#include "Solver/DetectAmbiguity_WithLookAround/DetectAmbiguity.h"


int main(int argc, char* argv[]){
  // DebugInformation
  solverbin::Debug PrintInformation;
  PrintInformation.PrintRegexString = true;
  PrintInformation.PrintAlphabet = false;
  PrintInformation.PrintREnode = true;
  PrintInformation.PrintSimulation = false;
  PrintInformation.PrintBytemap = false;

  if (argc != 2){
    std::cout << "parameter error" << std::endl;
  }
  std::ifstream infile;
  infile.open(argv[1], std::ios::binary);
  std::string line;
  bool Ret = true;
  std::vector<std::wstring> Regex_list;
  wchar_t c;
  while (getline(infile, line))
  {
    std::wstring_convert<std::codecvt_utf8_utf16<wchar_t>> converter;
    std::wstring unicodeStr = converter.from_bytes(line);
    c = unicodeStr.back();
    if (c == '\r'){
      unicodeStr.pop_back();
    }
    if (unicodeStr[0] != '^')
      unicodeStr.insert(0, L".*");
    Regex_list.emplace_back(unicodeStr);
  }

  std::vector<solverbin::REnodeClass> ReList;
  std::wcout.sync_with_stdio(true);
  for (auto str : Regex_list){
    if (solverbin::debug.PrintRegexString) std::wcout << L"Regex: " << str << std::endl;
    auto ren = solverbin::Parer(str);
    ReList.emplace_back(ren.Re);
    auto kk = solverbin::DetectABTNFA_Lookaround(ren.Re);
    auto k1 = kk.IsABT(kk.SSBegin);
    if (k1){
      std::cout <<  "prefix: " << kk.InterStr << std::endl;
      std::cout << "infix: " << kk.WitnessStr << std::endl;
    }
    else
      std::cout << "false" << std::endl;
  }

} 