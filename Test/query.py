import os
import sqlite3
import base64

conn = sqlite3.connect('Datasets/DataBase/regexlib.db')
# conn = sqlite3.connect('Datasets/DataBase/snort.db')
# 创建一个游标对象
cursor = conn.cursor()

# 执行 SQL 查询
# cursor.execute("SELECT regexes.regex_base64 FROM hunter_results, regexes where hunter_results.vulnerable = '1' and regexes.id = hunter_results.id")
# cursor.execute("SELECT regexes.regex_base64 FROM regexes")
# cursor.execute("SELECT regexes.regex_base64 FROM regexes, DetectAmbiguity_verify_results WHERE DetectAmbiguity_verify_results.time >= 1 and regexes.id = DetectAmbiguity_verify_results.id \
            # and NOT EXISTS (SELECT * FROM DetectAmbiguity_verify_results, hunter_verify_results where hunter_verify_results.time >= 1 and DetectAmbiguity_verify_results.id = hunter_verify_results.id)")

cursor.execute("SELECT regexes.regex_base64, regexes.id FROM regexes where regexes.id IN (SELECT hunter_verify_results.id FROM hunter_verify_results where hunter_verify_results.id NOT IN (SELECT DetectAmbiguity_verify_results.id FROM DetectAmbiguity_verify_results WHERE  DetectAmbiguity_verify_results.time >= 1) and hunter_verify_results.time >= 1)")
# and NOT EXISTS (SELECT 1 FROM DetectAmbiguity_verify_results, hunter_verify_results where DetectAmbiguity_verify_results.time >= 1
# cursor.execute("SELECT regexes.regex_base64, regexes.id FROM regexes where regexes.id IN (SELECT hunter_verify_results.id FROM hunter_verify_results where hunter_verify_results.id NOT IN (SELECT DetectAmbiguity_verify_results.id FROM DetectAmbiguity_verify_results WHERE  DetectAmbiguity_verify_results.time >= 1) and hunter_verify_results.time >= 1)")



# 获取所有查询结果
rows = cursor.fetchall()

# print(rows)

# 创建文件夹regexes
if not os.path.exists('regexes'):
    os.makedirs('regexes')

    

for i, line in enumerate(rows):
    if i % 1000 == 0:
        print(i)
    # 将每行正则写入一个新的文件
    # with open('regexes/{}.txt'.format(i+1), 'w') as f:
    #     # 解码 Base64 数据
    #     decoded_bytes = base64.b64decode(line[0])
    #     decoded_string = decoded_bytes.decode('utf-8')
    #     f.write(decoded_string)
    decoded_bytes = base64.b64decode(line[0])
    decoded_string = decoded_bytes.decode('utf-8')
    print(decoded_string + ',' + str(line[1]) + ',' + line[0])