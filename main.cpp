#include <iostream>
#include "Solver/solver_kind.h"
#include "Solver/solver.h"
#include "Parser/parser.h"
#include "Solver/String/regexp_symbolic.h"


int main(int argc, char* argv[]){
  std::cout << "Hello, World!" << std::endl;
  std::string s = R"(\$?([1-9]{1,3},?([1-9]{3},?)*[1-9]{3}(\.[1-9]{0,2})?|[1-9]{1,3}(\.[1-9]{0,2})?|\.([1-9]{1,2})?))";
  auto ren  = R"([a-z\u3007\u3400-\u4DBF\u4D00-\u4F09\u4E00-\u9FEF])";
  auto s1 = R"(\$?(\d{1,3},?(\d{3},?)*\d{3}(\.\d{0,2})?|\d{1,3}(\.\d{0,2})?|\.(\d{1,2})?))";
  auto ren1 = solverbin::Parer(s);
  auto ren2 = solverbin::Parer(s1);
  auto int1 = solverbin::RegExpSymbolic::IntersectionNFA(ren1.Re, ren2.Re);
  int1.Intersect();
} 