#include <iostream>
#include <fstream>
#include <locale>
#include <codecvt>
#include <unistd.h>
#include "Solver/solver_kind.h"
#include "Parser/parser.h"
#include "Solver/DetectAmbiguity_WithLookAround/DetectAmbiguity.h"


int main(int argc, char* argv[]){

  if (argc != 7){
    std::cout << "parameter error" << std::endl;
    std::cout << "Usage: ./GREWIA [RegexFile] [OutputDirectory] [AttackStringLength] [SimplifiedModeOn] [DecrementalOn] [MatchingFunction]\n" << std::endl;
    std::cout << "[RegexFile]: Path of a file which contain a regex.\n" << std::endl;
    std::cout << "[OutputDirectory]: Path of a directory where the candidate attack string will be write to.\n" << std::endl;
    std::cout << "[AttackStringLength]: Length of candidate attack string.\n" << std::endl;
    std::cout << "[SimplifiedModeOn]: Set to 1 indicate letting GREWIA generate a attack strings; Set to 0 indicate letting GREWIA generate a series of attack strings.\n" << std::endl;
    std::cout << "[DecrementalOn]: Set to 1 indicate Decremental method is on and vice verse.\n" << std::endl;
    std::cout << "[MatchingFunction]: Set to 1 indicate targeting to partialmatch; Set to 0 indicate targeting to fullmatch.\n" << std::endl;
    return 0;
  }
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
    if (unicodeStr[0] == '/'){
      for (int j = unicodeStr.length()-1; j > 1; j--){
        if (unicodeStr[j] == '/' ){
          unicodeStr.erase(j, unicodeStr.length());
          unicodeStr.erase(0, 1);
          break;
        }
      }
    }
    if (std::stoi(argv[6]) == 1){
      int i = 0;
      while (unicodeStr[i] == '(')
        i++;
      if (unicodeStr[i] != '^'){
        unicodeStr.insert(0, L".*(");
        unicodeStr.insert(unicodeStr.size(), L")");
      }
    }
    Regex_list.emplace_back(unicodeStr);
    std::vector<solverbin::REnodeClass> ReList;
    std::wcout.sync_with_stdio(true);
    for (auto str : Regex_list){
      if (solverbin::debug.PrintRegexString) std::wcout << L"Regex: " << str << std::endl;
      auto ren = solverbin::Parer(str, true);
      ReList.emplace_back(ren.Re);
      auto kk = solverbin::DetectABTNFA_Lookaround(ren.Re, std::stoi(argv[3]), argv[2], std::stoi(argv[4]), std::stoi(argv[5]), std::stoi(argv[6]), 0);
      auto k1 = kk.IsABT(kk.SSBegin);
      if (k1){
        std::cout <<  "prefix: " << kk.InterStr << std::endl;
        std::cout << "infix: " << kk.WitnessStr << std::endl;
      }
      else
        std::cout << "false" << std::endl;
    }
  }
} 