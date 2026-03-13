import csv
import subprocess
import os
import shutil
import base64
from concurrent.futures import ThreadPoolExecutor, as_completed

# 1. 配置路径
input_csv = "/home/HybridAlgSolver/Datasets/DataBase/Java_regex_with_redos.csv"
binary_path = "/home/HybridAlgSolver/build/GenerateASTDatasets"
output_path = "/home/HybridAlgSolver/Output/ASTs_java"
regex_dir = os.path.join(output_path, "regex_files")

# 检查文件夹是否存在
if os.path.exists(output_path):
    shutil.rmtree(output_path)
    print(f"已删除存在的文件夹: {output_path}")

# 注意：regex_dir 在 output_path 下面，output_path 删掉后它也就没了，这里判断其实可有可无
if os.path.exists(regex_dir):
    shutil.rmtree(regex_dir)
    print(f"已删除存在的文件夹: {regex_dir}")

# 创建新文件夹
os.makedirs(output_path)
print(f"已创建新文件夹: {output_path}")
os.makedirs(regex_dir)
print(f"已创建新文件夹: {regex_dir}")

def worker(id, row):
    raw_regex_b64 = row["Regex"]
    print(f"[Original] ID {id}: {raw_regex_b64}")

    redos_status = row["ReDoS Status"]
    redos_status = "1" if redos_status == "Has ReDoS" else "0"

    # base64 解码 + 写入文件
    try:
        regex = base64.b64decode(raw_regex_b64).decode("utf-8")
        print(f"[Decoded] ID {id}: {regex}")
        regex_file = f"{regex_dir}/{id}.txt"
        with open(regex_file, "w", encoding="utf-8", newline="") as f:
            f.write(regex)
    except Exception as e:
        return (id, f"[Decode Error] ID {id}: {e}")

    # 调用二进制
    try:
        print(f"Processing ID {id} with regex: {regex} and status: {redos_status}")
        result = subprocess.run(
            [binary_path, regex_file, redos_status, output_path + "/" + str(id) + "_" + redos_status + ".txt"],
            capture_output=True, text=True, check=True, timeout=120
        )
        output = result.stdout.strip()
        return (id, output)
    except subprocess.TimeoutExpired:
        return (id, "Error: Timeout")
    except subprocess.CalledProcessError as e:
        return (id, f"Error: {e}")

# 2. 打开原始 CSV 并读取（多线程处理）
max_workers = min(32, os.cpu_count() or 4)  # 你也可以直接写死 8/16

with open(input_csv, mode='r', newline='', encoding='utf-8') as infile:
    reader = csv.DictReader(infile)
    rows = list(reader)

with ThreadPoolExecutor(max_workers=max_workers) as ex:
    futures = []
    for id, row in enumerate(rows, start=1):
        futures.append(ex.submit(worker, id, row))

    for fut in as_completed(futures):
        id, output = fut.result()
        # 这里如果你不想刷屏，可以不打印 output，只打印状态
        print(f"[Done] ID {id}")
        # if output:
        #     print(f"[Result] ID {id}: {output}")

print(f"所有数据已处理完，结果保存在 '{output_path}'。")