#include <iostream>
#include <fstream>
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
  std::vector<std::string> Regex_list;
  while (getline(infile, line))
  {
    line.pop_back();
    Regex_list.emplace_back(line);
  }
  std::string Result = Regex_list[Regex_list.size()-1];
  Regex_list.pop_back();
  if (Result[0] == 'u')
    Ret = false;

  std::vector<solverbin::REnodeClass> ReList;
  for (auto str : Regex_list){
    auto ren = solverbin::Parer(str);
    ReList.emplace_back(ren.Re);
  }
  auto InK = solverbin::RegExpSymbolic::IntersectionK(ReList);
  std::cout << InK.Intersect();
} 