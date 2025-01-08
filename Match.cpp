#include <iostream>
#include "Membership/MatchFunctions.h"
#include "Parser/parser.h"

int main(int argc, char* argv[]){
  std::wstring ren  = L"(?=a*)(a?){0,7}aa";
  auto ren1 = solverbin::Parer(ren, 0);

  auto ee = solverbin::MatchFunctions::FullMatch(ren1.Re);
  auto T = ee.Fullmatch("aaaaaaaaa");

  std::cout << T << std::endl;

}