#include <iostream>
#include <fstream>
#include <locale>
#include <codecvt>
#include <unistd.h>
#include "Solver/solver_kind.h"
#include "Parser/parser.h"
#include "Solver/PositionAutomaton/PositionAutomaton.h" 



int main(int argc, char* argv[]) {
  // 创建一个随机张量
  std::ofstream nodes_out("nodes.csv");
  std::ofstream edges_out("edges.csv");
  std::ifstream infile;
  infile.open(argv[1], std::ios::binary);
  std::string line;
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
    std::vector<solverbin::REnodeClass> ReList;
    std::cout << "Regex: " << line << std::endl;
    std::wcout.sync_with_stdio(true);
    // we have a list of regexes
    // Convert to automatas
    std::wcout << L"Regex: " << unicodeStr << std::endl;
    
    auto ren = solverbin::Parser(unicodeStr, false);
    auto NFA = solverbin::FollowAtomata(ren.Re);
    std::set<solverbin::FollowAtomata::State*> StateSet;
    std::vector<solverbin::FollowAtomata::Transition> TransitionSet;
    NFA.ComputeFullNFA(StateSet, TransitionSet);
    nodes_out << "id,is_accept\n";
    for (const auto& s : StateSet) {
        nodes_out << s->Index << "," << (s->Ccontinuation->Status == solverbin::NODE_STATUS::NODE_NULLABLE ? 1 : 0) << "\n";
    }
    edges_out << "src,dst,symbol\n";
    for (const auto& t : TransitionSet) {
        edges_out << t.src << "," << t.dst << "," << t.symbol << "\n";
    }
  }
  infile.close();
  nodes_out.close();
  edges_out.close();
  // write to a csv file

  return 0;


}