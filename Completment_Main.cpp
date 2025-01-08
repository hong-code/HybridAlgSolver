#include <iostream>
#include <fstream>
#include <locale>
#include <codecvt>
#include <unistd.h>
#include "Solver/solver_kind.h"
#include "Parser/parser.h"
#include "Solver/PositionAutomaton/PositionAutomaton.h"


int main(int argc, char* argv[]) {

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
    // if (unicodeStr[0] != '^')
    //   unicodeStr.insert(0, L".*");
    Regex_list.emplace_back(unicodeStr);
  }

  std::vector<solverbin::REnodeClass> ReList;
  std::wcout.sync_with_stdio(true);
  for (auto str : Regex_list){
    if (solverbin::debug.PrintRegexString) std::wcout << L"Regex: " << str << std::endl;
    auto ren = solverbin::Parer(str, 0);
    ReList.emplace_back(ren.Re);
    auto initState = solverbin::FollowAtomata(ren.Re);
    std::string Suffix;
    auto dfa = solverbin::DFA(&initState);
    dfa.Complement(dfa.DState, "abcdaabcda", Suffix);
    std::cout << "Suffix: " << Suffix << " Length: " << Suffix.length() << std::endl;
    std::ofstream outfile;  // 创建ofstream对象

    // 打开文件，如果文件不存在将创建，存在则覆盖
    outfile.open("output.txt");

    if (!outfile) {
        std::cerr << "File could not be opened!" << std::endl;
        return 1;
    }
    outfile << Suffix << std::endl;
    outfile.close();
  }

}