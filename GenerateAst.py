import csv
import subprocess
import os
import shutil

# 1. 配置路径
input_csv = "/home/HybridAlgSolver/Datasets/sampled_java_regex_with_redos.csv"   # 原始 CSV 文件
binary_path = "/home/HybridAlgSolver/build/GenerateASTDatasets"     # C++ 二进制程序路径
output_path = "/home/HybridAlgSolver/Output/ASTs"


# 检查文件夹是否存在
if os.path.exists(output_path):
    # 如果存在，删除整个文件夹及其内容
    shutil.rmtree(output_path)
    print(f"已删除存在的文件夹: {output_path}")

# 创建新文件夹
os.makedirs(output_path)
print(f"已创建新文件夹: {output_path}")

# 2. 打开原始 CSV 并读取
with open(input_csv, mode='r', newline='', encoding='utf-8') as infile:
    reader = csv.DictReader(infile)
    rows = list(reader)

    id = 0
    for row in rows:
        regex = row["Regex"]
        redos_status = row["ReDoS Status"]
        if redos_status == "Has ReDoS":
            redos_status = "1"
        else:
            redos_status = "0"

        # 调用二进制程序
        # 假设二进制支持从命令行参数传入 regex 和 status
        try:
            print(f"Processing ID {id} with regex: {regex} and status: {redos_status}")
            result = subprocess.run(
                [binary_path, regex, redos_status, output_path+"/"+str(id)+"_"+redos_status+".txt" ],
                capture_output=True, text=True, check=True # 设置超时时间为10秒
            )
            output = result.stdout.strip()  # 获取二进制输出
        except subprocess.TimeoutExpired:
            output = "Error: Timeout"
        except subprocess.CalledProcessError as e:
            output = f"Error: {e}"
        else:
            id += 1


print(f"所有数据已处理完，结果保存在 '{output_path}'。")