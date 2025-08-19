#include <iostream>
#include <fstream>
#include <locale>
#include <codecvt>
#include <unistd.h>
#include <torch/torch.h>
#include "Solver/solver_kind.h"
#include "Solver/solver.h"
#include "Parser/parser.h"

int main() {
    // 创建一个随机张量
    torch::Tensor tensor = torch::rand({3, 3});
    std::cout << "Random Tensor:" << std::endl << tensor << std::endl;

    // 简单计算
    auto result = tensor * 2 + 1;
    std::cout << "Result:" << std::endl << result << std::endl;

    return 0;
}