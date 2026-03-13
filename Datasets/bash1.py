#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import os
import sqlite3
from pathlib import Path

import pandas as pd


def main():
    ap = argparse.ArgumentParser(
        description="Export per-tool predictions from attack_result to CSV in Corpus_regex_with_redos.csv format."
    )
    ap.add_argument("--db", default="/home/HybridAlgSolver/Datasets/DataBase/Outputdb/CVE.db", help="Path to sqlite db (CVE.db)")
    ap.add_argument("--out_dir", default="/home/HybridAlgSolver/Datasets/DataBase/tool_preds", help="Output directory for per-tool CSVs")
    ap.add_argument(
        "--tools",
        nargs="*",
        default=None,
        help="Optional: only export these tools (e.g., rescue rengar)",
    )
    ap.add_argument(
        "--combined",
        action="store_true",
        help="Also write a combined CSV with an extra 'tool' column",
    )
    args = ap.parse_args()

    db_path = Path(args.db)
    if not db_path.exists():
        raise FileNotFoundError(f"DB not found: {db_path}")

    out_dir = Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    conn = sqlite3.connect(str(db_path))

    # 1) 先把 (tool, id) 聚合：同一regex多次跑，只要有一次 is_redos=1 就判为 1
    # 2) 再 join regexes 拿 base64regex
    sql = """
    WITH agg AS (
      SELECT
        tool,
        id,
        MAX(CASE WHEN is_redos IN (1, '1', 'true', 'TRUE') THEN 1 ELSE 0 END) AS is_redos_any
      FROM attack_result
      GROUP BY tool, id
    )
    SELECT
      agg.tool AS tool,
      r.base64regex AS Regex,
      CASE WHEN agg.is_redos_any = 1 THEN 'Has ReDoS' ELSE 'No ReDoS' END AS "ReDoS Status"
    FROM agg
    JOIN regexes r
      ON r.id = agg.id
    ;
    """

    df = pd.read_sql_query(sql, conn)

    # 可选：只导出指定 tools
    if args.tools:
        keep = set(args.tools)
        df = df[df["tool"].isin(keep)].copy()

    if df.empty:
        print("[Warn] No rows to export. Check db path or tool names.")
        return

    # 每个工具一个文件：只保留 Regex + ReDoS Status 两列（对齐右边文件）
    tools = sorted(df["tool"].unique().tolist())
    for t in tools:
        sub = df[df["tool"] == t][["Regex", "ReDoS Status"]].copy()
        out_path = out_dir / f"{t}_attack_result_pred.csv"
        sub.to_csv(out_path, index=False, encoding="utf-8")
        print(f"[OK] {t}: {len(sub)} rows -> {out_path}")

    # 可选：输出一个合并版（多一列 tool）
    if args.combined:
        combined_path = out_dir / "all_tools_attack_result_pred.csv"
        df[["tool", "Regex", "ReDoS Status"]].to_csv(combined_path, index=False, encoding="utf-8")
        print(f"[OK] Combined -> {combined_path}")

    conn.close()


if __name__ == "__main__":
    main()