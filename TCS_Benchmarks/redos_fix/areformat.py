import re
import shutil
import os

count = 0
# 依次读取文件夹下所有txt文件
for root, dirs, files in os.walk("/cav21/zaligvinder/models/redos_fix/redos_fix"):
    for file in files:
        if file.endswith('.smt2'):
            file_path = os.path.join(root, file)
            with open(file_path, 'r') as f:
                lines = f.readlines()
            with open(file_path, 'w') as f:
                for line in lines:
                    # line = re.sub(r'\(re.union\s+\(re.range\s+"(\\u\{\w+\})"\s+"(\\u\{\w+\})"\s*\)\s*\)', r'(re.range "\1" "\2")', line)
                    # line = re.sub(r'\(re.range\s+(\\u\{\w+\})\s+(\\u\{\w+\})\s*\)', r'(re.range "\1" "\2")', line)
                    # line = re.sub(r'\(re\.union\s+\(str\.to\.re\s+"(\\u\{\w+\})"\s*\)\s*\)', r'(re.range "\1" "\2")', line)

                    # line = re.sub(r'\(re.range\s+"(\\u\{\w+\})"\s+"(\\u\{ffff\})"\s*\)', r'(re.range "\1" "\\u{ff}")', line)
                    # if re.search(r'\(re.range\s+"(\\u\{\w+\})"\s+"(\\u\{ffff\})"\s*\)', line):
                    #     count += 1
                    #     print(file_path, count)

                    # line = re.sub(r'\(re.range\s+"(\\u\{\w+\})"\s+"(\\u\{\w{3,4}\})"\s*\)', r'(re.range "\1" "\\u{ff}")', line)
                    line = re.sub(r'\(str\.to\.re\s+"(\\u\{\w{3,4}\})"\s*\)', r'(re.range "\1" "\\u{ff}")', line)


                    f.write(line)
    print(len(files))
