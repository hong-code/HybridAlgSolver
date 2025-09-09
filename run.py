import subprocess
import os

def run_regex_from_file(file_path, command):
    with open(file_path, "r", encoding="utf-8") as f:
        GraphIndex = 1
        NodeIndex = 0
        for i, line in enumerate(f, 1):
            regex = line.strip()
            if not regex:
                continue  # 跳过空行

            tmp_file = f"tmp_regex_{i}.txt"
            # 写入临时文件
            with open(tmp_file, "w", encoding="utf-8") as tf:
                tf.write(regex)

            print(f"[{i}] Running regex saved in {tmp_file}")

            try:
                # 构造命令，例如: mytool --file tmp_regex.txt
                cmd = command + [tmp_file] + [str(GraphIndex)] + [str(NodeIndex)]
                result = subprocess.run(cmd, capture_output=True, text=True, timeout=5)

                print("Output:\n", result.stdout)
                if result.stderr:
                    print("Error:\n", result.stderr)
                else:
                    with open("OutputGraphspy/A.txt", "a", encoding="utf-8") as f:
                        with open("OutputGraphs/A.txt", "r", encoding="utf-8") as f2:
                            for line in f2:
                                if (line != '\n'):
                                    f.write(line)
                    with open("OutputGraphspy/graph_indicator.txt", "a", encoding="utf-8") as f:
                        with open("OutputGraphs/graph_indicator.txt", "r", encoding="utf-8") as f2:
                            for line in f2:
                                if (line != '\n'):
                                    f.write(line)
                    with open("OutputGraphspy/edge_labels.txt", "a", encoding="utf-8") as f:
                        with open("OutputGraphs/edge_labels.txt", "r", encoding="utf-8") as f2:
                            for line in f2:
                                if (line != '\n'):
                                    f.write(line)
                    with open("OutputGraphspy/nodes_labels.txt", "a", encoding="utf-8") as f:
                        with open("OutputGraphs/nodes_labels.txt", "r", encoding="utf-8") as f2:
                            for line in f2:
                                if (line != '\n'):
                                    NodeIndex = NodeIndex + 1
                                    f.write(line)
                    with open("OutputGraphspy/graphs_labels.txt", "a", encoding="utf-8") as f:
                        with open("OutputGraphs/graphs_labels.txt", "r", encoding="utf-8") as f2:
                            for line in f2:
                                if (line != '\n'):
                                    f.write(line)
                    GraphIndex = GraphIndex + 1
            except subprocess.TimeoutExpired as e:
                print(f"Timeout: regex in {tmp_file} exceeded 5s, killed.")
                if e.stdout:
                    print("Partial Output:\n", e.stdout)
                if e.stderr:
                    print("Partial Error:\n", e.stderr)
            except Exception as e:
                print(f"Error running regex {regex}: {e}")

            finally:
                # 删除临时文件
                if os.path.exists(tmp_file):
                    os.remove(tmp_file)
                    print(f"Deleted {tmp_file}")

if __name__ == "__main__":
    # 修改这里：假设工具是 mytool --file tmp.txt
    base_command = ["build/GenerateGNNDatesets"]
    run_regex_from_file("regex.txt", base_command)
