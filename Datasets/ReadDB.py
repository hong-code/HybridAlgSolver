import sqlite3
import csv

# 连接数据库
conn = sqlite3.connect("/home/HybridAlgSolver/Datasets/DataBase/Outputdb/CVE.db")
cursor = conn.cursor()

# 查看所有表
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
print("Tables:", cursor.fetchall())

# CSV 文件名
filename = "/home/HybridAlgSolver/Datasets/DataBase/CVE_regex_with_redos.csv"

# CSV 文件名
filename1 = "/home/HybridAlgSolver/Datasets/test_regex_with_redos_hunter.csv"

# 创建并写入 CSV 文件


# 查看某张表的数据
cursor.execute("SELECT DISTINCT regexes.regex FROM regexes;")
res = cursor.fetchall()
print("Number of distinct regexes:", len(res))
cursor.execute("""
SELECT
  r.base64regex,
  CASE
    WHEN COALESCE(v.user_time, 0) >= 1 THEN 'Has ReDoS'
    ELSE 'No ReDoS'
  END AS redos_status
FROM regexes r
LEFT JOIN (
  SELECT id, MAX(COALESCE(user_time, 0)) AS user_time
  FROM verify_result
  WHERE engine = 'nodejs14'
  GROUP BY id
) v
  ON r.id = v.id;
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

print(f"CSV 文件 '{filename}' 已创建并写入数据。")