#include <iostream>
#include <fstream>
#include <locale>
#include <codecvt>
#include <unistd.h>
#include "Solver/solver_kind.h"
#include "Solver/solver.h"
#include "Parser/parser.h"
#include "Solver/DetectAmbiguity/DetectAmbiguity.h"


int main(int argc, char* argv[]){
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
    Regex_list.emplace_back(unicodeStr);
  }
  // Regex_list[Regex_list.size() - 1].push_back(c);
  std::vector<solverbin::REnodeClass> ReList;
  for (auto str : Regex_list){
    auto ren = solverbin::Parer(str, 0);
    ReList.emplace_back(ren.Re);
  }
  // auto kk = RR.FMDFA.Fullmatch(R"(a+(a?){0,5}aaaaaaaaaaaa)", "aaaaaaaaaaaaa");
  auto kk = solverbin::DetectABTNFA(ReList[0]);
  auto k1 = kk.IsABT(kk.SSBegin);
  if (k1){
    std::cout <<  "prefix: " << kk.InterStr << std::endl;
    std::cout << "infix: " << kk.WitnessStr << std::endl;
  }
  else
    std::cout << "false" << std::endl;
  // int1.Intersect();
} 