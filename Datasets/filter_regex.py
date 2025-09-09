import re

def filter_regex_file(input_file, output_file):
    # 匹配反向引用：\1, \2, ...
    backref_pattern = re.compile(r'\\[1-9][0-9]*')
    
    # 匹配环视：(?=...), (?!...), (?<=...), (?<!...)
    lookaround_pattern = re.compile(r'\(\?([=!<])')

    with open(input_file, 'r', encoding='utf-8') as fin, \
         open(output_file, 'w', encoding='utf-8') as fout:
        for line in fin:
            regex = line.strip()
            if not regex:  # 跳过空行
                continue

            # 如果包含反向引用或环视 -> 丢弃
            if backref_pattern.search(regex) or lookaround_pattern.search(regex):
                continue

            # 否则写入输出文件
            fout.write(regex + '\n')

if __name__ == "__main__":
    input_file = "corpus_snort_regexlib_regex101_unique.txt"   # 输入 txt 文件
    output_file = "corpus_snort_regexlib_regex101_unique_filtered.txt"  # 输出 txt 文件
    filter_regex_file(input_file, output_file)
    print(f"过滤完成，结果已写入 {output_file}")