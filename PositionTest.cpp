#include <iostream>
#include <fstream>
#include <locale>
#include <codecvt>
#include <unistd.h>
#include "Solver/PositionAutomaton/Intersectiontest.h"
#include "Solver/solver.h"
#include "Parser/parser.h"



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
  auto InK = solverbin::IntersectionK(ReList);
  auto result = InK.Intersect();
  if (result){
    std::cout << "sat" << std::endl;
    std::cout << "witness string: " << InK.InterStr << std::endl;
  }
  else
    std::cout << "unsat" << std::endl;
  // Test our tool.  
  // if ((InK.Intersect() && 1 == std::stoi(argv[2])) || (!InK.Intersect() && 0 == std::stoi(argv[2]))){
  //   std::cout << argv[1] << " : Match"  <<  std::endl;
  //   if (1 == std::stoi(argv[2])){
  //     std::cout << "sat" << std::endl;
  //     std::cout << "witness string: " << InK.InterStr << std::endl;
  //   }
  //   else
  //     std::cout << "unsat" << std::endl;
  // }
  // else{
  //   std::cout << argv[1] << " : NoMatch"  <<  std::endl;
  // }
} 