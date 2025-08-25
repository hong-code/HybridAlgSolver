#include <iostream>
#include <fstream>
#include <locale>
#include <codecvt>
#include <unistd.h>
#include "Solver/solver_kind.h"
#include "Parser/parser.h"
#include "Solver/PositionAutomaton/PositionAutomaton.h" 

void export_automaton_to_csv(const std::set<solverbin::FollowAtomata::State*> & states,
                             const std::vector<solverbin::FollowAtomata::Transition>& transitions,
                             const std::string& nodes_file,
                             const std::string& edges_file) {
    // 导出 nodes.csv
    std::ofstream nodes_out(nodes_file);
    nodes_out << "id,is_accept\n";
    for (const auto& s : states) {
        nodes_out << s->Index << "," << (s->Ccontinuation->Status == solverbin::NODE_STATUS::NODE_NULLABLE ? 1 : 0) << "\n";
    }
    nodes_out.close();

    // 导出 edges.csv
    std::ofstream edges_out(edges_file);
    edges_out << "src,dst,symbol\n";
    for (const auto& t : transitions) {
        edges_out << t.src << "," << t.dst << "," << t.symbol << "\n";
    }
    edges_out.close();

    std::cout << "Export finished: " << nodes_file << " and " << edges_file << std::endl;
}


int main(int argc, char* argv[]) {
  // 创建一个随机张量
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
    std::wcout.sync_with_stdio(true);
    // we have a list of regexes
    // Convert to automatas
    std::wcout << L"Regex: " << unicodeStr << std::endl;
    auto ren = solverbin::Parser(unicodeStr, false);
    auto NFA = solverbin::FollowAtomata(ren.Re);
    std::set<solverbin::FollowAtomata::State*> StateSet;
    std::vector<solverbin::FollowAtomata::Transition> TransitionSet;
    NFA.ComputeFullNFA(StateSet, TransitionSet);
    export_automaton_to_csv(StateSet, TransitionSet, "nodes.csv", "edges.csv");
  }
  infile.close();
  // write to a csv file

  return 0;


}