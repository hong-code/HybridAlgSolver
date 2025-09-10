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
  int index = std::stoi(argv[3]) + 1;
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
    if (unicodeStr[0] == '/'){
      for (int j = unicodeStr.length()-1; j > 1; j--){
        if (unicodeStr[j] == '/' ){
          unicodeStr.erase(j, unicodeStr.length());
          unicodeStr.erase(0, 1);
          break;
        }
      }
    }
    Regex_list.emplace_back(unicodeStr);
    std::vector<solverbin::REnodeClass> ReList;
    std::cout << "Regex: " << line << std::endl;
    // std::wcout.sync_with_stdio(true);
    // // we have a list of regexes
    // // Convert to automatas
    // std::wcout << L"Regex: " << unicodeStr << std::endl;
    
    auto ren = solverbin::Parser(unicodeStr, false);
    ren.Re.REnodeToAST(ren.Re.Renode, "");
    bool is_position = false;
    if (is_position){
      auto NFA = solverbin::PositionAutomaton(ren.Re);
      std::set<solverbin::PositionAutomaton::State*> StateSet;
      std::vector<solverbin::PositionAutomaton::Transition> TransitionSet;
      NFA.ComputeFullNFA(StateSet, TransitionSet);
      for (const auto& s : StateSet) {
        graph_indicator << argv[2] << "\n";
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
    else{
      auto NFA = solverbin::FollowAutomaton(ren.Re);
      std::set<solverbin::FollowAutomaton::State*> StateSet;
      std::vector<solverbin::FollowAutomaton::Transition> TransitionSet;
      NFA.ComputeFullNFA(StateSet, TransitionSet);
      for (const auto& s : StateSet) {
        graph_indicator << argv[2] << "\n";
        nodes_labels << (s->Ccontinuation->Status == solverbin::NODE_STATUS::NODE_NULLABLE ? 1 : 0) << "\n";
        Index2Index[s->Index] = index;
        index++;
      }
      for (const auto& t : TransitionSet) {
        A << Index2Index[t.src] << ", " << Index2Index[t.dst] << "\n";
        edge_labels << (int)(t.symbol) << "\n";
      }
      
      std::cout << "Graph: " << graph_index << std::endl;
      graph_index++;
      auto kk = solverbin::DetectABTNFA_Lookaround(ren.Re, 0, "path", 0, 1, 0, 0);
      auto k1 = kk.IsInfiniteAmbiguity(kk.SSBegin);
      if (k1 == true)
        graph_labels << 1 << "\n";
      else
        graph_labels << 0 << "\n";  
    }
  }
  infile.close();
  A.close();
  graph_indicator.close();
  edge_labels.close();
  nodes_labels.close();
  // write to a csv file

  return 0;


}