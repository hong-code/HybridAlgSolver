#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import csv
import re
import sqlite3
from pathlib import Path
from typing import List


def safe_filename(s: str) -> str:
    s = (s or "").strip()
    return re.sub(r"[^\w\-\.]+", "_", s)


def fetch_distinct(cursor, table: str, col: str) -> List[str]:
    cursor.execute(f"SELECT DISTINCT {col} FROM {table} WHERE {col} IS NOT NULL;")
    vals = [r[0] for r in cursor.fetchall() if r[0] is not None and str(r[0]).strip() != ""]
    return sorted(set(map(str, vals)))


def export_groundtruth_for_tool(cur, tool: str, out_csv: Path, threshold: float = 1.0) -> int:
    """Per-tool groundtruth from verify_result: max(user_time) per regex id."""
    sql = """
    SELECT
      r.base64regex AS Regex,
      CASE
        WHEN COALESCE(v.max_user_time, 0) >= ? THEN 'Has ReDoS'
        ELSE 'No ReDoS'
      END AS `ReDoS Status`
    FROM regexes r
    LEFT JOIN (
      SELECT id, MAX(COALESCE(user_time, 0)) AS max_user_time
      FROM verify_result
      WHERE tool = ?
      GROUP BY id
    ) v
      ON r.id = v.id
    WHERE r.base64regex IS NOT NULL;
    """
    cur.execute(sql, (threshold, tool))
    rows = cur.fetchall()

    out_csv.parent.mkdir(parents=True, exist_ok=True)
    with out_csv.open("w", newline="", encoding="utf-8") as f:
        w = csv.writer(f)
        w.writerow(["Regex", "ReDoS Status"])
        w.writerows(rows)

    return len(rows)


def export_attacks_for_tool(cur, tool: str, out_csv: Path) -> int:
    """Per-tool attack strings from attack_result."""
    sql = """
    SELECT
      r.base64regex AS Regex,
      a.is_redos AS is_redos,
      COALESCE(a.prefix, '') AS prefix,
      COALESCE(a.infix, '') AS infix,
      COALESCE(a.suffix, '') AS suffix,
      COALESCE(a.repeat_times, -1) AS repeat_times,
      COALESCE(a.elapsed_ms, NULL) AS elapsed_ms
    FROM attack_result a
    JOIN regexes r
      ON r.id = a.id
    WHERE a.tool = ?
      AND r.base64regex IS NOT NULL;
    """
    cur.execute(sql, (tool,))
    rows = cur.fetchall()

    out_csv.parent.mkdir(parents=True, exist_ok=True)
    with out_csv.open("w", newline="", encoding="utf-8") as f:
        w = csv.writer(f)
        w.writerow(["Regex", "is_redos", "prefix", "infix", "suffix", "repeat_times", "elapsed_ms"])
        w.writerows(rows)

    return len(rows)


def main():
    ap = argparse.ArgumentParser(
        description="Export per-tool groundtruth CSVs (verify_result) and per-tool attack CSVs (attack_result) from CVE.db"
    )
    ap.add_argument("--db", required=True, help="Path to CVE.db")
    ap.add_argument("--outdir", required=True, help="Output directory")
    ap.add_argument("--threshold", type=float, default=1.0, help="user_time threshold => Has ReDoS (default=1.0)")
    ap.add_argument("--only", nargs="*", default=None, help="Optional: only export these tools")
    args = ap.parse_args()

    db_path = Path(args.db)
    outdir = Path(args.outdir)

    con = sqlite3.connect(str(db_path))
    cur = con.cursor()

    tools_verify = fetch_distinct(cur, "verify_result", "tool")
    tools_attack = fetch_distinct(cur, "attack_result", "tool")
    tools = sorted(set(tools_verify) | set(tools_attack))

    if args.only:
        only = set(map(str, args.only))
        tools = [t for t in tools if t in only]

    print(f"[INFO] DB: {db_path}")
    print(f"[INFO] Outdir: {outdir}")
    print(f"[INFO] Tools exporting: {len(tools)}")

    gt_dir = outdir / "groundtruth"
    atk_dir = outdir / "attacks"

    for tool in tools:
        tool_safe = safe_filename(tool)

        if tool in tools_verify:
            gt_path = gt_dir / f"{tool_safe}.csv"
            n = export_groundtruth_for_tool(cur, tool, gt_path, threshold=args.threshold)
            print(f"[GT]  {tool:<20} -> {gt_path} rows={n}")

        if tool in tools_attack:
            atk_path = atk_dir / f"{tool_safe}.csv"
            n = export_attacks_for_tool(cur, tool, atk_path)
            print(f"[ATK] {tool:<20} -> {atk_path} rows={n}")

    con.close()
    print("[DONE]")


if __name__ == "__main__":
    main()