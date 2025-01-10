import os
import sqlite3
import base64

# conn = sqlite3.connect('../Datasets/DataBase/regexlib.db')

# # 创建一个游标对象
# cursor = conn.cursor()

# # 执行 SQL 查询
# # cursor.execute("SELECT regexes.regex_base64 FROM hunter_results, regexes where hunter_results.vulnerable = '1' and regexes.id = hunter_results.id")
# cursor.execute("SELECT regexes.regex_base64 FROM regexes")

# # 获取所有查询结果
# rows = cursor.fetchall()

# print(rows)

# 创建文件夹regexes
if not os.path.exists('regexes'):
    os.makedirs('regexes')


# 打开文件并按行读取
file_path = '/home/HybridAlgSolver/Datasets/perl_hunter_better(1).txt'  # 替换为你的文件路径

with open(file_path, 'r') as file:
    rows = file.readlines()  # 读取所有行并存入列表

# 去掉每行末尾的换行符
rows = [line.strip() for line in rows]
    

for i, line in enumerate(rows):
    if i % 1000 == 0:
        print(i)
    # 将每行正则写入一个新的文件
    with open('regexes/{}.txt'.format(i+1), 'w') as f:
        # 解码 Base64 数据
        # decoded_bytes = base64.b64decode(line[0])
        # decoded_string = decoded_bytes.decode('utf-8')
        # f.write(decoded_string)
        f.write(line)