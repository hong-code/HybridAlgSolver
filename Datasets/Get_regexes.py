#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
from pathlib import Path
import pandas as pd

INPUT_XLSX = "/home/HybridAlgSolver/Datasets/redos_cve_v2.xlsx"
OUTPUT_TXT = "/home/HybridAlgSolver/Datasets/regex_unique.txt"

# 如果一个单元格里包含多个 regex，用这些分隔符拆开（换行/分号/||）
SPLIT_PAT = re.compile(r"(?:\r?\n)+|(?:\s*;\s*)|(?:\s*\|\|\s*)")

TARGET_COLS = {"regex pattern"}  # 只要这两列（大小写不敏感）


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


def main():
    xlsx_path = Path(INPUT_XLSX)
    if not xlsx_path.exists():
        raise FileNotFoundError(f"找不到输入文件：{xlsx_path}")

    sheets = pd.read_excel(xlsx_path, sheet_name=None)

    uniq = set()
    used_cols = set()
    total = 0

    for sheet_name, df in sheets.items():
        # 只挑 regex/pattern 列（大小写不敏感）
        col_map = {str(c).strip().lower(): c for c in df.columns}
        picked = [col_map[k] for k in TARGET_COLS if k in col_map]

        if not picked:
            continue

        used_cols.update([str(c) for c in picked])

        for c in picked:
            for v in df[c].values:
                regs = extract_cell(v)
                total += len(regs)
                uniq.update(regs)

        print(f"[Sheet] {sheet_name}: picked_cols={picked}, unique_now={len(uniq)}")

    if not used_cols:
        raise ValueError(
            "在所有 sheet 中都没找到列名为 regex 或 pattern 的列（大小写不敏感）。"
            "请检查 Excel 表头是否叫别的名字。"
        )

    out_path = Path(OUTPUT_TXT)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with out_path.open("w", encoding="utf-8") as f:
        for r in sorted(uniq):
            f.write(r + "\n")

    print("\n=== Done ===")
    print(f"Used columns: {sorted(used_cols)}")
    print(f"Extracted (before dedup): {total}")
    print(f"Unique regex count: {len(uniq)}")
    print(f"Saved to: {out_path}")


if __name__ == "__main__":
    main()