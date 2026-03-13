#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import csv
import json
import os
import re
import sqlite3
from collections import defaultdict

def safe_float(x):
    try:
        return float(x)
    except Exception:
        return None

def sanitize_filename(name: str) -> str:
    """Make tool name safe for filenames."""
    name = name.strip()
    if not name:
        return "UNKNOWN"
    # replace path/space/special chars with underscore
    name = re.sub(r"[^\w.\-]+", "_", name)
    return name[:200]  # avoid overly long names

def extract_median_from_hyperfine(hout: str):
    """
    hyperfine JSON example:
      {"results":[{"median": ..., "mean": ..., ...}], ...}
    Return median (float seconds) or None.
    """
    obj = json.loads(hout)
    results = obj.get("results", [])
    if not results:
        return None
    r0 = results[0]
    return safe_float(r0.get("median"))

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("db", help="Path to sqlite .db file")
    ap.add_argument("--outdir", default="out_medians", help="Output directory")
    ap.add_argument("--with-cmd", action="store_true",
                    help="Also export attack_cmd column if present")
    args = ap.parse_args()

    conn = sqlite3.connect(args.db)
    cur = conn.cursor()

    # Check table exists
    cur.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='attack_result'")
    if cur.fetchone() is None:
        raise SystemExit("ERROR: table 'attack_result' not found in DB.")

    # Check if attack_cmd exists (optional)
    cur.execute("PRAGMA table_info(attack_result)")
    cols = [r[1] for r in cur.fetchall()]
    has_attack_cmd = ("attack_cmd" in cols) and args.with_cmd

    select_cols = "tool, id, is_redos, hyperfine_out" + (", attack_cmd" if has_attack_cmd else "")
    cur.execute(f"""
        SELECT {select_cols}
        FROM attack_result
        WHERE hyperfine_out IS NOT NULL AND TRIM(hyperfine_out) != ''
          AND tool IS NOT NULL AND TRIM(tool) != ''
    """)
    rows = cur.fetchall()

    os.makedirs(args.outdir, exist_ok=True)

    # tool -> list of records
    bucket = defaultdict(list)
    bad_json = 0
    no_median = 0

    for row in rows:
        if has_attack_cmd:
            tool, rid, is_redos, hout, attack_cmd = row
        else:
            tool, rid, is_redos, hout = row
            attack_cmd = None

        try:
            if is_redos == 1:
                med = extract_median_from_hyperfine(hout)
            else:
                med = None    
        except Exception:
            bad_json += 1
            continue

        if med is None:
            no_median += 1
            continue

        rec = {
            "id": rid,
            "is_redos": int(is_redos) if is_redos is not None else "",
            "median_sec": med,
        }
        if has_attack_cmd:
            rec["attack_cmd"] = attack_cmd if attack_cmd is not None else ""
        bucket[tool].append(rec)

    # Write per-tool files
    total_written = 0
    for tool, recs in bucket.items():
        fname = sanitize_filename(tool) + ".csv"
        path = os.path.join(args.outdir, fname)

        fieldnames = ["id", "is_redos", "median_sec"] + (["attack_cmd"] if has_attack_cmd else [])
        Total_time = 0
        with open(path, "w", newline="", encoding="utf-8") as f:
            w = csv.DictWriter(f, fieldnames=fieldnames)
            w.writeheader()
            for r in recs:
                w.writerow(r)
                Total_time += r["median_sec"]
        AVG_time = Total_time / len(recs) if recs else 0
        total_written += len(recs)
        print(f"Wrote {len(recs)} rows for tool '{tool}' (avg median: {AVG_time:.2f} sec)")

    print("=== Done ===")
    print(f"DB: {args.db}")
    print(f"Tools found: {len(bucket)}")
    print(f"Rows written (median extracted): {total_written}")
    print(f"Skipped: bad_json={bad_json}, no_median_field={no_median}")
    print(f"Output dir: {os.path.abspath(args.outdir)}")

if __name__ == "__main__":
    main()