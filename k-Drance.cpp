#include <codecvt>
#include <fstream>
#include <iostream>
#include <locale>
#include <string>
#include <unistd.h>

#include "Solver/solver_kind.h"
#include "Parser/parser.h"
#include "Solver/DetectAmbiguity_WithLookAround/DetectAmbiguity.h"

namespace {
  bool NormalizeRegexLine(const std::string& line, bool partialMatch, std::wstring& regex) {
    std::wstring_convert<std::codecvt_utf8_utf16<wchar_t>> converter;
    regex = converter.from_bytes(line);
    if (regex.empty()) {
      return false;
    }

    if (regex.back() == L'\r') {
      regex.pop_back();
    }
    if (regex.empty()) {
      return false;
    }

    if (regex[0] == L'/') {
      for (int j = static_cast<int>(regex.length()) - 1; j > 1; j--) {
        if (regex[j] == L'/') {
          regex.erase(j, regex.length());
          regex.erase(0, 1);
          break;
        }
      }
    }

    if (partialMatch) {
      size_t i = 0;
      while (i < regex.size() && regex[i] == L'(') {
        i++;
      }
      if (i >= regex.size() || regex[i] != L'^') {
        regex.insert(0, L".*(");
        regex.insert(regex.size(), L")");
      }
    }

    return true;
  }
}

int main(int argc, char* argv[]) {
  if (argc != 8) {
    std::cout << "parameter error" << std::endl;
    std::cout << "Usage: ./k-Drance [RegexFile] [AttackStringOutputFile] [AmbiguityOutputFile] [AttackStringLength] [SimplifiedModeOn] [DecrementalOn] [MatchingFunction]\n" << std::endl;
    std::cout << "[RegexFile]: Path of a file which contains regexes, one regex per line.\n" << std::endl;
    std::cout << "[AttackStringOutputFile]: Path of the file where attack strings will be written.\n" << std::endl;
    std::cout << "[AmbiguityOutputFile]: Path of the file where ambiguity degrees will be written.\n" << std::endl;
    std::cout << "[AttackStringLength]: Length used when searching candidate attack strings.\n" << std::endl;
    std::cout << "[SimplifiedModeOn]: Set to 1 to generate one attack string; set to 0 to generate a series of attack strings.\n" << std::endl;
    std::cout << "[DecrementalOn]: Set to 1 to enable decremental/random mode and vice versa.\n" << std::endl;
    std::cout << "[MatchingFunction]: Set to 1 for partialmatch; set to 0 for fullmatch.\n" << std::endl;
    return 0;
  }

  const std::string regexFile = argv[1];
  const std::string attackStringOutputFile = argv[2];
  const std::string ambiguityOutputFile = argv[3];
  const int attackStringLength = std::stoi(argv[4]);
  const int simplifiedModeOn = std::stoi(argv[5]);
  const int decrementalOn = std::stoi(argv[6]);
  const int matchingFunction = std::stoi(argv[7]);

  std::ifstream infile(regexFile, std::ios::binary);
  if (!infile.is_open()) {
    std::cerr << "Failed to open regex file: " << regexFile << std::endl;
    return 1;
  }

  std::ofstream attackOut(attackStringOutputFile, std::ios::binary);
  if (!attackOut.is_open()) {
    std::cerr << "Failed to open attack string output file: " << attackStringOutputFile << std::endl;
    return 1;
  }

  std::ofstream ambiguityOut(ambiguityOutputFile);
  if (!ambiguityOut.is_open()) {
    std::cerr << "Failed to open ambiguity output file: " << ambiguityOutputFile << std::endl;
    return 1;
  }

  std::string line;
  int lineNumber = 0;
  std::wcout.sync_with_stdio(true);
  while (getline(infile, line)) {
    lineNumber++;

    std::wstring regex;
    if (!NormalizeRegexLine(line, matchingFunction == 1, regex)) {
      continue;
    }

    if (solverbin::debug.PrintRegexString) {
      std::wcout << L"Regex: " << regex << std::endl;
    }

    auto parsedRegex = solverbin::Parer(regex, false);
    auto detector = solverbin::DetectABTNFA_Lookaround(
      parsedRegex.Re,
      attackStringLength,
      "",
      simplifiedModeOn,
      decrementalOn,
      matchingFunction,
      0
    );

    detector.DetectFiniteAmbiguity();
    attackOut << lineNumber << '\t' << detector.MaxAmbiguityWitnessString << '\n';
    ambiguityOut << lineNumber << '\t' << detector.MaxDegreeOfAmbiguity << '\n';
  }

  return 0;
}
