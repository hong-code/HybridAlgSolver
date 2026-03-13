#include <iostream>
#include <fstream>
#include <locale>
#include <codecvt>
#include <unistd.h>
#include "Solver/solver_kind.h"
#include "Parser/parser.h"
#include "Solver/Automaton/FollowAutomaton.h"
#include "Solver/DetectAmbiguity_WithLookAround/DetectAmbiguity.h"


int main(int argc, char* argv[]) {
  std::ifstream infile;
  infile.open(argv[1], std::ios::binary);
  std::string line;
  std::getline(infile, line);
  // std::string line = argv[1];
  wchar_t c;
  std::wstring_convert<std::codecvt_utf8_utf16<wchar_t>> converter;
  std::wstring unicodeStr = converter.from_bytes(line);
  c = unicodeStr.back();
  if (c == '\r'){
    unicodeStr.pop_back();
  }
  // if (unicodeStr[0] == '/'){
  //   for (int j = unicodeStr.length()-1; j > 1; j--){
  //     if (unicodeStr[j] == '/' ){
  //       unicodeStr.erase(j, unicodeStr.length());
  //       unicodeStr.erase(0, 1);
  //       break;
  //     }
  //   }
  // }
  std::vector<solverbin::REnodeClass> ReList;
  std::cout << "Regex: " << line << std::endl;
  auto ren = solverbin::Parser(unicodeStr, false);
  std::string returnStr = "";
  ren.Re.REnodeToAST(ren.Re.Renode, "", returnStr);
  std::cout << "AST: \n" << returnStr << std::endl;
  std::ofstream outfile(argv[3]); 
  if (!outfile.is_open()) {
      std::cerr << "Error opening file: " << argv[3] << std::endl;
      return 1;
  }
  outfile << returnStr;
  outfile.close();
  // write to a csv file
  
  return 0;


}