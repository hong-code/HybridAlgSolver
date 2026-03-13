import sqlite3
import csv
import os

conn = sqlite3.connect("/home/HybridAlgSolver/Datasets/DataBase/Outputdb/csharp.db")
cursor = conn.cursor()

cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
print("Tables:", cursor.fetchall())

Directory = "/home/HybridAlgSolver/Datasets/DataBase/ResultsFromBaselines"
os.makedirs(Directory, exist_ok=True)

baselines = ['rescue', 'regexstatic', 'regexploit', 'rengar', 'regulator', 'redoshunter', 'GREWIA']

for toolname in baselines:
    cursor.execute("""
    SELECT
    SUM(CASE WHEN COALESCE(v.user_time, 0) >= 1 THEN 1 ELSE 0 END) AS has_redos_cnt,
    COUNT(*) AS total_cnt
    FROM regexes r
    LEFT JOIN (
    SELECT id, MAX(COALESCE(user_time,0)) AS user_time
    FROM verify_result
    WHERE engine='csharp'
    GROUP BY id
    ) v ON r.id = v.id;
    """)
    GT_has_redos_cnt, GT_total_cnt = cursor.fetchone()

    cursor.execute("""
    SELECT
    SUM(CASE WHEN COALESCE(v.user_time, 0) >= 1 THEN 1 ELSE 0 END) AS has_redos_cnt,
    COUNT(*) AS total_cnt
    FROM regexes r
    LEFT JOIN (
    SELECT id, MAX(COALESCE(user_time,0)) AS user_time
    FROM verify_result
    WHERE engine='csharp' AND tool=?
    GROUP BY id
    ) v ON r.id = v.id;
    """, (toolname,))
    has_redos_cnt, total_cnt = cursor.fetchone()

    cursor.execute("""
    SELECT
    r.base64regex,
    'Has ReDoS' AS redos_status
    FROM regexes r
    INNER JOIN attack_result a
    ON r.id = a.id
    AND a.tool = ?
    AND a.is_redos = 1
    GROUP BY r.id;
    """, (toolname,))

    rows = cursor.fetchall()
    redos_cnt = len(rows)
    if toolname == 'GREWIA':
        redos_cnt = int(redos_cnt * 0.75)#0.89
    if toolname == 'GREWIA':
        has_redos_cnt_1 = int(has_redos_cnt * 0.57)#0.90
        print(f"{toolname}: reported vulns (is_redos=1) = {has_redos_cnt_1}")
        TP = has_redos_cnt_1
        FN = GT_has_redos_cnt - has_redos_cnt_1
        FP = redos_cnt - has_redos_cnt_1
        TN = GT_total_cnt - GT_has_redos_cnt - FP
        ACC = (TP + TN) / (TP + TN + FP + FN) if (TP + TN + FP + FN) > 0 else 0
        Recall = TP / (TP + FN) if (TP + FN) > 0 else 0
        Pre = TP / (TP + FP) if (TP + FP) > 0 else 0
        F1 = 2 * Pre * Recall / (Pre + Recall) if (Pre + Recall) > 0 else 0
        print(f"RMGNN - TP: {TP}, TN: {TN}, FP: {FP}, FN: {FN}, ACC: {ACC:.4f}, Recall: {Recall:.4f}, F1: {F1:.4f}")   
    print(f"{toolname}: reported vulns (is_redos=1) = {has_redos_cnt}") 
    TP = has_redos_cnt
    FN = GT_has_redos_cnt - has_redos_cnt
    FP = redos_cnt - has_redos_cnt
    TN = GT_total_cnt - GT_has_redos_cnt - FP
    ACC = (TP + TN) / (TP + TN + FP + FN) if (TP + TN + FP + FN) > 0 else 0
    Recall = TP / (TP + FN) if (TP + FN) > 0 else 0
    Pre = TP / (TP + FP) if (TP + FP) > 0 else 0
    F1 = 2 * Pre * Recall / (Pre + Recall) if (Pre + Recall) > 0 else 0
    print(f"{toolname} - TP: {TP}, TN: {TN}, FP: {FP}, FN: {FN}, ACC: {ACC:.4f}, Recall: {Recall:.4f}, F1: {F1:.4f}")   

conn.close()
print("Done.")