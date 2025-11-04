import pandas as pd

# 读取原始 CSV 文件
input_filename = "/home/HybridAlgSolver/Datasets/java_regex_with_redos.csv"
df = pd.read_csv(input_filename)

# 设置你想要抽取的样本数量
sample_size = 3000  # 比如抽取 100 条记录，修改为你需要的数量

# 随机抽取指定数量的行
df_sample = df.sample(n=sample_size, random_state=42)  # 设置 random_state 以保证可复现

# 保存抽取的子集到新的 CSV 文件
output_filename = "/home/HybridAlgSolver/Datasets/sampled_java_regex_with_redos.csv"
df_sample.to_csv(output_filename, index=False)

print(f"已成功抽取 {sample_size} 条数据并保存到 '{output_filename}'。")