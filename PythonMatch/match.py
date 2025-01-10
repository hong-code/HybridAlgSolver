import re
import sys

# 获取命令行输入的文件路径
if len(sys.argv) != 3:
    print("请提供两个文件路径：正则表达式文件和匹配串文件")
    sys.exit(1)

regex_file_path = sys.argv[1]  # 第一个参数：正则表达式文件
string_file_path = sys.argv[2]  # 第二个参数：待匹配串文件

# 读取正则表达式文件
try:
    with open(regex_file_path, 'r', encoding='utf-8') as regex_file:
        regex_content = regex_file.read().strip()
        regex = re.compile(regex_content)  # 编译正则表达式
except Exception as e:
    print(f"读取正则文件出错: {e}")
    sys.exit(1)

# 读取待匹配串文件
try:
    with open(string_file_path, 'r', encoding='utf-8', errors='ignore') as string_file:
        string_content = string_file.read()  # 读取整个文件内容
except Exception as e:
    print(f"读取匹配串文件出错: {e}")
    sys.exit(1)

# 对整个文件进行匹配
if regex.search(string_content):
    print("文件内容匹配成功")
else:
    print("文件内容未匹配")