#include <string>
#include <set>
#include <vector>
#include <map>
#include <sys/stat.h>
#include <sys/types.h>
#include <openssl/evp.h>
#include <iostream>

#include "Utils.h"


namespace solverbin{
    void Utils::ComputeAlphabet_Colormap(uint8_t* ByteMap, std::set<uint8_t> &Alphabet, std::map<uint8_t, std::vector<uint8_t>> &ColorMap){
		std::set<uint8_t> color_set;
		color_set.insert(ByteMap[0]);
    std::vector<uint8_t> RuneRange;
    ColorMap.insert(std::make_pair(ByteMap[0], RuneRange));
		if (ByteMap[0] != 0){
      Alphabet.insert(0);
      RuneRange.emplace_back(0);
    }
		for (int i = 0; i < 256; i++){
      auto Color2Range = ColorMap.find(ByteMap[i]);
			if (color_set.find(ByteMap[i]) != color_set.end()){
        Color2Range->second.emplace_back(i);
      }
			else{
        std::vector<uint8_t> Range;
				color_set.insert(ByteMap[i]);
        Range.emplace_back(i);
        ColorMap.insert(std::make_pair(ByteMap[i], Range));
				if (ByteMap[i] != 0)
					Alphabet.insert(i);
			}
		}
	}

  std::string Utils::base64_encode(const std::string &input){
      // 计算编码后的大小
      int len = 4 * ((input.length() + 2) / 3);
      char *encoded = new char[len + 1];

      // 编码
      EVP_EncodeBlock((unsigned char*)encoded, (const unsigned char*)input.c_str(), input.length());

      std::string result(encoded);
      delete[] encoded;
      return result;
  }
  void Utils::DumpAlphabet(std::set<uint8_t>& A){
    std::cout << "The alphabet: ";
    for (auto it : A){
      std::cout << int(it) << " ";
    }
    std::cout << "" << std::endl;
  }


}