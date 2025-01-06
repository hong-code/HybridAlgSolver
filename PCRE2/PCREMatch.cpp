#include <iostream>
#include <fstream>
#include <sstream>

#include <string>
#define PCRE2_CODE_UNIT_WIDTH 8
#include <pcre2.h>

void read_file_to_string(const std::string& filename, std::string& content) {
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "无法打开文件: " << filename << std::endl;
        exit(1);  // 读取文件失败，退出程序
    }
    std::stringstream buffer;
    buffer << file.rdbuf();
    content = buffer.str();
}

int main(int argc, char* argv[]) {
    if (argc < 3) {
        std::cerr << "使用方法: " << argv[0] << " <正则文件> <匹配文件>" << std::endl;
        return 1;
    }

    // 获取文件路径
    std::string regex_file = argv[1];  // 正则表达式文件路径
    std::string match_file = argv[2];  // 待匹配字符串文件路径

    // 读取正则表达式文件
    std::string pattern;
    read_file_to_string(regex_file, pattern);

    // 读取待匹配字符串文件
    std::string file_content;
    read_file_to_string(match_file, file_content);
    // const char* pattern1 = "^[a-zA-Z0-9_\\-]+@[a-zA-Z0-9_\\-]+\\.[a-zA-Z]+$";
    // 打印读取的正则表达式和待匹配字符串（可选）
    std::cout << "正则表达式: " << pattern << std::endl;
    // std::cout << "待匹配的字符串: " << file_content << std::endl;

    // 编译正则表达式
    PCRE2_SIZE erroroffset;
    int errorcode;
    pcre2_code* re = pcre2_compile(
        (PCRE2_SPTR)pattern.c_str(),        // 正则表达式模式
        PCRE2_ZERO_TERMINATED,              // 正则表达式字符串是以 NULL 结束的
        0,                                  // 编译选项
        &errorcode,                       // 错误偏移
        &erroroffset,                            // 使用默认字符集
        nullptr                             // 没有需要的回调
    );

    if (re == nullptr) {
        std::cerr << "正则表达式编译失败!" << std::endl;
        std::cerr << "错误信息: ";
        // 输出错误的部分
        for (size_t i = erroroffset; i < pattern.size(); ++i) {
            std::cerr << pattern[i];
        }
        std::cerr << std::endl;
        return 1;
        return 1;
    }

    // 创建匹配数据结构
    pcre2_match_data* match_data = pcre2_match_data_create_from_pattern(re, nullptr);

    // 执行正则匹配
    int rc = pcre2_match(
        re,                                    // 编译后的正则表达式
        (PCRE2_SPTR)file_content.c_str(),      // 输入字符串
        file_content.length(),                 // 输入字符串的长度
        0,                                     // 从字符串的开头开始匹配
        0,                                     // 匹配选项（此处没有使用）
        match_data,                            // 匹配结果数据
        nullptr                                // 没有需要的回调
    );

    if (rc < 0) {
        std::cerr << "匹配失败!" << std::endl;
    } else {
        std::cout << "匹配成功!" << std::endl;

        // 提取匹配结果
        PCRE2_SIZE* ovector = pcre2_get_ovector_pointer(match_data);
        for (int i = 0; i < rc; i++) {
            PCRE2_SIZE start = ovector[2 * i];
            PCRE2_SIZE end = ovector[2 * i + 1];
            std::cout << "匹配的子串: " << std::string(file_content.begin() + start, file_content.begin() + end) << std::endl;
        }
    }

    // 释放匹配数据和正则表达式对象
    pcre2_match_data_free(match_data);
    pcre2_code_free(re);

    return 0;
}