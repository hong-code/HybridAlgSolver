#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
from pathlib import Path
import base64
import pandas as pd

INPUT_XLSX = "/home/HybridAlgSolver/Datasets/FINAL_REDOS_DATASET.xlsx"
OUTPUT_CSV = "/home/HybridAlgSolver/Datasets/DataBase/ResultsFromBaselines/CVE_regex_with_redos.csv"
OUTPUT_TXT = "/home/HybridAlgSolver/Datasets/DataBase/ResultsFromBaselines/CVE_regex_set.txt"

# 如果一个单元格里包含多个 regex，用这些分隔符拆开（换行/分号/||）
SPLIT_PAT = re.compile(r"(?:\r?\n)+|(?:\s*;\s*)|(?:\s*\|\|\s*)")

# 只取这两列（大小写不敏感）
REGEX_COL_CANDIDATES = {"regex pattern"}
STATUS_COL_CANDIDATES = {"status"}


def normalize(s: str) -> str:
    s = s.strip()
    # 去掉包裹引号
    if len(s) >= 2 and ((s[0] == s[-1] == '"') or (s[0] == s[-1] == "'")):
        s = s[1:-1].strip()
    return s


def extract_cell(v) -> list[str]:
    """
    单元格只有一个 regex：
    - 若形如 /.../flags，则只取最外层 / / 中间的内容（保留内部转义）
    - 否则返回规范化后的原字符串
    """
    if pd.isna(v):
        return []
    s = str(v).strip()
    if not s:
        return []

    s = normalize(s)

    # 只取最外层 /.../ 中间内容（允许末尾有 flags，如 /abc/i）
    # 说明：
    # ^/                以 / 开头
    # ((?:\\/|[^/])*)   内容：要么是转义斜杠 \\/，要么是非 / 的任意字符，重复
    # /([a-zA-Z]*)$     以 / 结束，后面可选 flags
    m = re.match(r"^/((?:\\/|[^/])*)/([a-zA-Z]*)$", s)
    if m:
        inner = m.group(1)
        return [inner]

    # 如果不是 /.../ 的格式，就直接返回原内容（按需你也可以改成 return []）
    return [s]


def map_status(x) -> str | None:
    """
    按你的规则：
      SAFE  -> No ReDoS
      ERROR -> Has ReDoS
    其它值返回 None（你可以按需扩展）
    """
    if pd.isna(x):
        return None
    s = str(x).strip().upper()
    if s == "SAFE":
        return "No ReDoS"
    if s == "VULNERABLE":
        return "Has ReDoS"
    return None


def to_b64(s: str) -> str:
    return base64.b64encode(s.encode("utf-8")).decode("ascii")


def main():
    xlsx_path = Path(INPUT_XLSX)
    if not xlsx_path.exists():
        raise FileNotFoundError(f"找不到输入文件：{xlsx_path}")

    df = pd.read_excel(xlsx_path, sheet_name="All_Vulnerable_Regexes")

    # regex -> label 的聚合：同一 regex 多次出现时，以 Has ReDoS 优先
    label_by_regex: dict[str, str] = {}
    used_cols = set()
    total_rows_used = 0
    total_regex_seen = 0

    # for sheet_name, df in sheets.items():
    col_map = {str(c).strip().lower(): c for c in df.columns}

    regex_cols = [col_map[k] for k in REGEX_COL_CANDIDATES if k in col_map]
    status_cols = [col_map[k] for k in STATUS_COL_CANDIDATES if k in col_map]

    # if not regex_cols or not status_cols:
    #     continue

    regex_col = regex_cols[0]
    status_col = status_cols[0]
    used_cols.update([str(regex_col), str(status_col)])

    for regex_cell, status_cell in zip(df[regex_col].values, df[status_col].values):
        mapped = map_status(status_cell)
        if mapped is None:
            continue  # 忽略未知状态

        regs = extract_cell(regex_cell)
        if not regs:
            continue

        total_rows_used += 1
        total_regex_seen += len(regs)

        for r in regs:
            prev = label_by_regex.get(r)
            # 有风险优先：Has ReDoS 覆盖 No ReDoS
            if prev is None:
                label_by_regex[r] = mapped
            else:
                if prev == "No ReDoS" and mapped == "Has ReDoS":
                    label_by_regex[r] = "Has ReDoS"

    print(f"[Sheet] All_Vulnerable_Regexes: unique_now={len(label_by_regex)}")

    if not used_cols:
        raise ValueError(
            "没有找到需要的列。请确认 Excel 表头是否包含：'Regex Pattern' 和 'ReDoS Status'。"
        )

    # 生成与 Corpus_regex_with_redos.csv 一致的两列：Regex(base64) + ReDoS Status
    out_df = pd.DataFrame(
        {
            "Regex": [to_b64(r) for r in label_by_regex.keys()],
            "ReDoS Status": list(label_by_regex.values()),
        }
    )

    # 稳定输出：按 decoded regex 排序（可选）
    decoded = list(label_by_regex.keys())
    out_df["__decoded"] = decoded
    out_df = out_df.sort_values("__decoded").drop(columns="__decoded").reset_index(drop=True)

    out_path = Path(OUTPUT_CSV)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    print(f"Saved CSV to: {out_path}")

    # 额外输出：regex set (decoded)，一行一个 regex
    txt_path = Path(OUTPUT_TXT)
    txt_path.parent.mkdir(parents=True, exist_ok=True)
    with txt_path.open("w", encoding="utf-8") as f:
        for r in sorted(label_by_regex.keys()):
            f.write(r + "\n")
    print(f"Regex set saved to: {txt_path}")

    print("\n=== Done ===")

    print("\n=== Done ===")
    print(f"Used columns: {sorted(used_cols)}")
    print(f"Rows used (status known): {total_rows_used}")
    print(f"Regex extracted (before dedup): {total_regex_seen}")
    print(f"Unique regex count: {len(label_by_regex)}")
    print(f"Saved to: {out_path}")


if __name__ == "__main__":
    main()