import sqlite3
import csv

# 连接数据库
conn = sqlite3.connect("/home/HybridAlgSolver/Datasets/sp25_rq1.db")
cursor = conn.cursor()

# 查看所有表
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
print("Tables:", cursor.fetchall())

# CSV 文件名
filename = "/home/HybridAlgSolver/Datasets/java_regex_with_redos.csv"

# CSV 文件名
filename1 = "/home/HybridAlgSolver/Datasets/java_regex_with_redos_hunter.csv"

# 创建并写入 CSV 文件


# 查看某张表的数据
cursor.execute("SELECT DISTINCT regexes.regex FROM regexes;")
res = cursor.fetchall()
print("Number of distinct regexes:", len(res))
cursor.execute("""
SELECT 
    regexes.regex,
    CASE
        WHEN MAX(COALESCE(partial_100k.usertime, 0)) >= 1 THEN 'Has ReDoS'
        WHEN MAX(partial_100k.usertime) IS NULL THEN 'No ReDoS'
        ELSE 'No ReDoS'
    END AS redos_status
FROM regexes
LEFT JOIN partial_100k ON regexes.id = partial_100k.id AND partial_100k.engine = 'java_match'
GROUP BY regexes.regex;
""")
rows = cursor.fetchall()
print("Number of distinct regexes:", len(rows))

# 写入 CSV 文件
with open(filename, mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    
    # 写入表头
    writer.writerow(["Regex", "ReDoS Status"])
    
    # 写入数据
    for row in rows:
        writer.writerow(row)

cursor.execute("""
SELECT 
    regexes.regex,
    CASE
        WHEN MAX(COALESCE(partial_100k.usertime, 0)) >= 1 THEN 'Has ReDoS'
        WHEN MAX(partial_100k.usertime) IS NULL THEN 'No ReDoS'
        ELSE 'No ReDoS'
    END AS redos_status
FROM regexes
LEFT JOIN partial_100k ON regexes.id = partial_100k.id AND partial_100k.engine = 'java_match' AND partial_100k.tool = 'rengar'
GROUP BY regexes.regex;
""")
rows = cursor.fetchall()
# 写入 CSV 文件
with open(filename1, mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    
    # 写入表头
    writer.writerow(["Regex", "ReDoS Status"])
    
    # 写入数据
    for row in rows:
        writer.writerow(row)


# 关闭数据库连接
conn.close()

print(f"CSV 文件 '{filename}' 已创建并写入数据。")