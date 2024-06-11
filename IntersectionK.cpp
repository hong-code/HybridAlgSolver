#include <iostream>
#include <fstream>
#include "Solver/solver_kind.h"
#include "Solver/solver.h"
#include "Parser/parser.h"
#include "Solver/DetectAmbiguity/DetectAmbiguity.h"



int main(int argc, char* argv[]){
  if (argc != 3){
    std::cout << "parameter error" << std::endl;
  }
  std::ifstream infile;
  infile.open(argv[1], std::ios::binary);
  std::string line;
  bool Ret = true;
  std::vector<std::string> Regex_list;
  char c;
  while (getline(infile, line))
  {
    c = line.back();
    line.pop_back();
    Regex_list.emplace_back(line);
  }
  Regex_list[Regex_list.size() - 1].push_back(c);
  std::vector<solverbin::REnodeClass> ReList;
  for (auto str : Regex_list){
    auto ren = solverbin::Parer(str);
    ReList.emplace_back(ren.Re);
  }
  auto InK = solverbin::RegExpSymbolic::IntersectionK(ReList);
  if ((InK.Intersect() && 1 == std::stoi(argv[2])) || (!InK.Intersect() && 0 == std::stoi(argv[2]))){
    // std::cout << argv[1] << " : Match"  <<  std::endl;
  }
  else
    std::cout << argv[1] << " : NoMatch"  <<  std::endl;
} 