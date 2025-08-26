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
  std::ofstream A("OutputGraphs/A.txt");
  std::ofstream graph_indicator("OutputGraphs/graph_indicator.txt");
  std::ofstream edge_labels("OutputGraphs/edge_labels.txt");
  std::ofstream nodes_labels("OutputGraphs/nodes_labels.txt");
  std::ofstream graph_labels("OutputGraphs/graphs_labels.txt");
  std::ifstream infile;
  infile.open(argv[1], std::ios::binary);
  std::string line;
  std::vector<std::wstring> Regex_list;
  wchar_t c;
  int index = 1;
  int graph_index = 1;
  while (getline(infile, line))
  {
    std::map<int, int> Index2Index;
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
    for (const auto& s : StateSet) {
      graph_indicator << graph_index << "\n";
      nodes_labels << (s->Ccontinuation->Status == solverbin::NODE_STATUS::NODE_NULLABLE ? 1 : 0) << "\n";
      Index2Index[s->Index] = index;
      index++;
    }
    for (const auto& t : TransitionSet) {
      A << Index2Index[t.src] << ", " << Index2Index[t.dst] << "\n";
      edge_labels << (int)(t.symbol) << "\n";
    }
    graph_index++;
  }
  infile.close();
  A.close();
  graph_indicator.close();
  edge_labels.close();
  nodes_labels.close();
  // write to a csv file

  return 0;


}