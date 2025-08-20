#include <iostream>
#include <fstream>
#include <locale>
#include <codecvt>
#include <unistd.h>
#include <torch/torch.h>
#include "Solver/solver_kind.h"
#include "Solver/solver.h"
#include "Parser/parser.h"
#include "Solver/PositionAutomaton/PositionAutomaton.h" 

struct GraphData {
    torch::Tensor x;          // 节点特征
    torch::Tensor edge_index; // 边索引 (2, E)
    torch::Tensor edge_attr;  // 边特征 (E, d)
    torch::Tensor y;          // 图/节点标签

    GraphData(torch::Tensor x_, torch::Tensor edge_index_,
              torch::Tensor edge_attr_, torch::Tensor y_)
        : x(x_), edge_index(edge_index_), edge_attr(edge_attr_), y(y_) {}
};

// Input Regexes
// Output .pt

// To begin with just one regex
// Output .py which contains one graph
int main(int argc, char* argv[]) {
  // 创建一个随机张量
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
    std::vector<solverbin::REnodeClass> ReList;
    std::wcout.sync_with_stdio(true);
  }
    for (auto str : Regex_list){
      // we have a list of regexes
      // Convert to automatas
      std::wcout << L"Regex: " << str << std::endl;
      auto ren = solverbin::Parser(str, true);
      auto NFA = solverbin::FollowAtomata(ren.Re);
    }
    torch::Tensor tensor = torch::rand({3, 3});
    std::cout << "Random Tensor:" << std::endl << tensor << std::endl;

    // 简单计算
    auto result = tensor * 2 + 1;
    std::cout << "Result:" << std::endl << result << std::endl;

    return 0;
}