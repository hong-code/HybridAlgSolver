import base64
import re
import sys

def main():
    # 检查是否提供了两个命令行参数
    if len(sys.argv) != 3:
        print("Usage: python regex_file_matcher.py <base64_regex> <file_path>")
        return

    # 获取命令行参数
    base64_regex = sys.argv[1]
    file_path = sys.argv[2]

    try:
        # 解码 Base64 编码的正则表达式
        regex = base64.b64decode(base64_regex).decode('utf-8')

        # 编译正则表达式
        pattern = re.compile(regex)

        # 读取整个文件内容
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()

            # 查找匹配项
            matches = pattern.finditer(content)
            for match in matches:
                print(f"Found match: {match.group()} at position {match.start()}")

        except IOError as e:
            print(f"Error reading file: {e}")

    except base64.binascii.Error as e:
        print(f"Error decoding Base64 regex: {e}")

if __name__ == "__main__":
    main()