#include <string>
#include <set>
#include <map>
#include <vector>

namespace solverbin{
  class Utils{
    public:
      static std::string base64_encode(const std::string &input);
      static void ComputeAlphabet_Colormap(uint8_t* ByteMap, std::set<uint8_t> &Alphabet, std::map<uint8_t, std::vector<uint8_t>> &ColorMap);
      static void DumpAlphabet(std::set<uint8_t>& A);
  };
}