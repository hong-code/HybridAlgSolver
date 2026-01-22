#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import re
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple

import pandas as pd

REGEX_COL_CANDIDATES = ["Regex", "regex", "base64regex", "regex_base64", "pattern"]
STATUS_COL_CANDIDATES = ["ReDoS Status", "redos status", "status", "label", "vulnerable", "has redos"]

POSITIVE_TOKENS = {"has redos", "vulnerable", "true", "yes", "y", "1", "pos", "positive"}


def norm(x) -> str:
    return str(x).strip().lower()


def pick_col(df: pd.DataFrame, candidates: List[str]) -> Optional[str]:
    m = {norm(c): c for c in df.columns}
    for k in candidates:
        kk = norm(k)
        if kk in m:
            return m[kk]
    return None


def is_positive(v) -> bool:
    if pd.isna(v):
        return False
    s = norm(v)
    if s in POSITIVE_TOKENS:
        return True
    if "has redos" in s or "vulnerable" in s:
        return True
    try:
        return float(s) >= 1.0
    except Exception:
        return False


def normalize_b64(x: str) -> str:
    s = str(x).strip()
    if s.lower().startswith("b64:"):
        s = s[4:].strip()
    s = "".join(s.split())
    return s


def safe_filename(s: str) -> str:
    s = (s or "").strip()
    return re.sub(r"[^\w\-\.]+", "_", s)


def load_tool_vuln_set(csv_path: Path) -> Set[str]:
    df = pd.read_csv(csv_path)
    regex_col = pick_col(df, REGEX_COL_CANDIDATES)
    status_col = pick_col(df, STATUS_COL_CANDIDATES)
    if regex_col is None or status_col is None:
        raise ValueError(
            f"[{csv_path}] missing columns. Need Regex + Status. Found: {list(df.columns)}"
        )
    df2 = df[[regex_col, status_col]].dropna(subset=[regex_col])
    df_pos = df2[df2[status_col].apply(is_positive)]
    return set(df_pos[regex_col].map(normalize_b64).astype(str).tolist())


def main():
    ap = argparse.ArgumentParser(
        description="Export ALL UpSet-style intersection groups from per-tool CSVs (Has ReDoS sets)."
    )
    ap.add_argument("--indir", required=True, help="Directory containing tool CSVs (*.csv)")
    ap.add_argument("--outdir", required=True, help="Output directory for intersections")
    ap.add_argument("--glob", default="*.csv", help="Glob for tool csvs (default: *.csv)")
    ap.add_argument("--min-size", type=int, default=1, help="Only export intersections with >= this size (default=1)")
    ap.add_argument("--top", type=int, default=0,
                    help="If >0, only export top-K intersections by size (default=0 means export all)")
    ap.add_argument("--only", nargs="*", default=None, help="Optional: only include these tools (file stems)")
    args = ap.parse_args()

    indir = Path(args.indir)
    outdir = Path(args.outdir)
    outdir.mkdir(parents=True, exist_ok=True)

    files = sorted(indir.glob(args.glob))
    if args.only:
        only = set(args.only)
        files = [p for p in files if p.stem in only]

    if not files:
        raise SystemExit(f"No CSV files found in {indir} with glob={args.glob}")

    tool2set: Dict[str, Set[str]] = {}
    for p in files:
        tool = p.stem
        s = load_tool_vuln_set(p)
        tool2set[tool] = s
        print(f"[LOAD] {tool:<18} HasReDoS={len(s)}  from {p.name}")

    tools = sorted(tool2set.keys())
    union = set().union(*tool2set.values())
    print(f"[INFO] tools={len(tools)} union_size={len(union)}")

    # 为每个 regex 生成 “命中工具集合” key
    groups: Dict[Tuple[str, ...], List[str]] = {}
    for rx in union:
        hit = tuple(sorted([t for t in tools if rx in tool2set[t]]))
        if not hit:
            continue
        groups.setdefault(hit, []).append(rx)

    # 过滤 min-size
    items = [(k, v) for k, v in groups.items() if len(v) >= args.min_size]
    # 按交集大小降序
    items.sort(key=lambda kv: len(kv[1]), reverse=True)

    # top-K
    if args.top and args.top > 0:
        items = items[: args.top]

    # summary
    summary_rows = []
    for hit, rx_list in items:
        name = "INTER__" + "__".join([safe_filename(x) for x in hit])
        summary_rows.append({
            "intersection": ",".join(hit),
            "k": len(hit),
            "size": len(rx_list),
            "file": f"{name}.csv"
        })

        out_path = outdir / f"{name}.csv"
        pd.DataFrame({"Regex": rx_list}).to_csv(out_path, index=False)

    summary_path = outdir / "intersections_summary.csv"
    pd.DataFrame(summary_rows).to_csv(summary_path, index=False)

    # 额外导出：每个工具的 ONLY（只被该工具命中）
    only_dir = outdir / "only"
    only_dir.mkdir(parents=True, exist_ok=True)
    for t in tools:
        only_set = tool2set[t].copy()
        for other in tools:
            if other == t:
                continue
            only_set -= tool2set[other]
        if len(only_set) >= args.min_size:
            pd.DataFrame({"Regex": sorted(only_set)}).to_csv(only_dir / f"ONLY__{safe_filename(t)}.csv", index=False)

    print(f"[OK] wrote {len(summary_rows)} intersection CSVs to: {outdir}")
    print(f"[OK] summary: {summary_path}")
    print(f"[OK] only/  : {only_dir}")


if __name__ == "__main__":
    main()