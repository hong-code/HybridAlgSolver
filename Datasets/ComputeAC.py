import csv

# 文件路径
groundtruth_file = "/home/HybridAlgSolver/Datasets/java_regex_with_redos.csv"
result_file = "/home/HybridAlgSolver/Datasets/java_regex_with_redos_hunter.csv"

# 读取标签
with open(groundtruth_file, 'r', encoding='utf-8') as f1, open(result_file, 'r', encoding='utf-8') as f2:
    gt_labels = [row.strip().split(',')[1] for row in f1 if row.strip()]
    pred_labels = [row.strip().split(',')[1] for row in f2 if row.strip()]

# 检查长度一致
assert len(gt_labels) == len(pred_labels), "两个文件的行数不一致！"

# 计算准确率
correct = sum(g == p for g, p in zip(gt_labels, pred_labels))
accuracy = correct / len(gt_labels)

print(f"总样本数: {len(gt_labels)}")
print(f"预测正确数: {correct}")
print(f"准确率: {accuracy:.4f}")