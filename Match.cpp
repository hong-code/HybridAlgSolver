#include <iostream>
#include "Membership/MatchFunctions.h"
#include "Parser/parser.h"

int main(int argc, char* argv[]){
  std::wstring ren  = L"([\\u3007-\\u3400])";
  auto ren1 = solverbin::Parer(ren);
  
}