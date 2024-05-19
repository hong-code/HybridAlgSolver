#include <iostream>
#include "Solver/solver_kind.h"
#include "Solver/solver.h"
#include "Parser/parser.h"
#include "Solver/String/regexp_symbolic.h"


int main(int argc, char* argv[]){
  std::cout << "Hello, World!" << std::endl;
  std::string s = R"(^(([\p{Lu}\p{Ll}]|[1-9]|\-|\.)+)@{1}((([\p{Lu}\p{Ll}]|[1-9]|\-){1,67})|(([\p{Lu}\p{Ll}]|[1-9]|\-)+\.([\p{Lu}\p{Ll}]|[1-9]|\-){1,67}))\.((([a-z]|[A-Z]|[1-9]){2,4})(\.([a-z]|A|Z|[1-9]){2})?)\z)";
  auto ren  = R"([a-z\u3007\u3400-\u4DBF\u4D00-\u4F09\u4E00-\u9FEF])";
  auto tt  = R"(\p{L})";
  auto s2 = R"(((\w|\d|\-|\.)+)@{1}(((\w|\d|\-){1,67})|((\w|\d|\-)+\.(\w|\d|\-){1,67}))\.((([a-z]|[A-Z]|\d){2,4})(\.([a-z]|A|Z|\d){2})?)\z)";
  auto s1 = R"(2@v\.X)";
  auto ren1 = solverbin::Parer(s);
  auto ren2 = solverbin::Parer(s2);
  auto int1 = solverbin::RegExpSymbolic::IntersectionNFA(ren1.Re, ren2.Re);
  solverbin::RegExpSymbolic RR;
  auto s5 = R"(a+(a?){0,5}aaaaaaaaaaaa)";
  auto ren3 = solverbin::Parer(s5);
  auto kk = RR.FMDFA.Fullmatch(R"(a+(a?){0,5}aaaaaaaaaaaa)", "aaaaaaaaaaaaa");
  // int1.Intersect();
} 