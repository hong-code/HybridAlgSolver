#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
from pathlib import Path
from typing import Dict, Optional, Tuple, List

import pandas as pd


# 你可以按实际列名再加候选
REGEX_COL_CANDIDATES = ["Regex", "regex", "base64regex", "regex_base64", "pattern"]
STATUS_COL_CANDIDATES = ["ReDoS Status", "redos status", "status", "label", "vulnerable", "has redos"]

POSITIVE_TOKENS = {
    "has redos", "redos", "vulnerable", "true", "yes", "y", "1", "pos", "positive"
}
NEGATIVE_TOKENS = {
    "no redos", "not redos", "non-redos", "safe", "false", "no", "n", "0", "neg", "negative"
}


def norm(x) -> str:
    return str(x).strip().lower()


def pick_col(df: pd.DataFrame, candidates: List[str]) -> Optional[str]:
    m = {norm(c): c for c in df.columns}
    for k in candidates:
        kk = norm(k)
        if kk in m:
            return m[kk]
    return None


def normalize_b64(s: str) -> str:
    """统一 base64 形式：去空白/换行/可选前缀 b64:"""
    t = str(s).strip()
    if t.lower().startswith("b64:"):
        t = t[4:].strip()
    t = "".join(t.split())
    return t


def to_bool_label(v) -> Optional[bool]:
    """
    把状态列转成 bool:
      True  -> Has ReDoS
      False -> No ReDoS
      None  -> 无法解析
    """
    if pd.isna(v):
        return None
    s = norm(v)

    # 直接匹配 token
    if s in POSITIVE_TOKENS:
        return True
    if s in NEGATIVE_TOKENS:
        return False

    # 包含匹配（例如 "Has ReDoS (confirmed)")
    if "has redos" in s or "vulnerable" in s:
        return True
    if "no redos" in s or "not redos" in s:
        return False

    # 数值型（有些表可能用 0/1 或 user_time）
    try:
        fv = float(s)
        return fv >= 1.0
    except Exception:
        return None


def load_label_map(csv_path: Path) -> Tuple[Dict[str, bool], str, str]:
    """
    读取一个 CSV，返回:
      regex -> bool_label
    """
    df = pd.read_csv(csv_path)

    regex_col = pick_col(df, REGEX_COL_CANDIDATES)
    status_col = pick_col(df, STATUS_COL_CANDIDATES)
    if regex_col is None or status_col is None:
        raise ValueError(
            f"[{csv_path}] Missing required columns. "
            f"Need one of {REGEX_COL_CANDIDATES} and one of {STATUS_COL_CANDIDATES}. "
            f"Found columns={list(df.columns)}"
        )

    out: Dict[str, bool] = {}
    bad = 0
    for r, st in zip(df[regex_col], df[status_col]):
        if pd.isna(r):
            continue
        rr = normalize_b64(r)
        lb = to_bool_label(st)
        if lb is None:
            bad += 1
            continue
        out[rr] = lb  # 同一 regex 多次出现时，后者覆盖（一般不会有冲突）
    return out, regex_col, status_col


def compute_metrics(
    gt: Dict[str, bool],
    pred: Dict[str, bool],
    missing_as: str = "neg"  # "neg" or "ignore"
) -> Dict[str, float]:
    """
    missing_as:
      - "neg": pred 缺失的 regex 视为预测 False
      - "ignore": pred 缺失的 regex 不计入评估集合
    """
    tp = fp = tn = fn = 0
    used = 0

    for rx, gt_y in gt.items():
        if rx in pred:
            yhat = pred[rx]
        else:
            if missing_as == "ignore":
                continue
            yhat = False

        used += 1
        if yhat and gt_y:
            tp += 1
        elif yhat and (not gt_y):
            fp += 1
        elif (not yhat) and (not gt_y):
            tn += 1
        else:  # not yhat and gt_y
            fn += 1

    precision = tp / (tp + fp) if (tp + fp) > 0 else 0.0
    recall = tp / (tp + fn) if (tp + fn) > 0 else 0.0
    acc = (tp + tn) / used if used > 0 else 0.0
    f1 = (2 * precision * recall / (precision + recall)) if (precision + recall) > 0 else 0.0

    return {
        "N_eval": used,
        "TP": tp, "FP": fp, "TN": tn, "FN": fn,
        "Acc": acc,
        "Prec": precision,
        "Rec": recall,
        "F1": f1,
    }


def main():
    ap = argparse.ArgumentParser(
        description="Compute TP/Acc/Recall/F1 (and more) for each tool CSV vs a given groundtruth CSV."
    )
    ap.add_argument("--gt", required=True, help="Groundtruth CSV path (must contain Regex + ReDoS Status)")
    ap.add_argument("--pred_dir", required=True, help="Directory of tool CSVs (each contains Regex + ReDoS Status)")
    ap.add_argument("--out", default=None, help="Optional output summary CSV path")
    ap.add_argument("--missing-as", choices=["neg", "ignore"], default="neg",
                    help="How to treat regex missing in a tool file: neg=No ReDoS, ignore=skip (default=neg)")
    ap.add_argument("--glob", default="*.csv", help="Glob pattern for tool CSVs in pred_dir (default=*.csv)")
    ap.add_argument("--only", nargs="*", default=None, help="Only evaluate these tool names (file stems)")
    args = ap.parse_args()

    gt_path = Path(args.gt)
    pred_dir = Path(args.pred_dir)

    gt_map, gt_rc, gt_sc = load_label_map(gt_path)
    print(f"[GT] loaded {len(gt_map)} regex labels from {gt_path.name} (cols: {gt_rc}, {gt_sc})")

    files = sorted(pred_dir.glob(args.glob))
    if args.only:
        only = set(args.only)
        files = [p for p in files if p.stem in only]

    if not files:
        raise SystemExit(f"No tool CSV files found in {pred_dir} with glob={args.glob}")

    rows = []
    for f in files:
        pred_map, prc, psc = load_label_map(f)
        m = compute_metrics(gt_map, pred_map, missing_as=args.missing_as)
        row = {"Tool": f.stem, "File": f.name, **m}
        rows.append(row)
        print(f"[OK] {f.stem:<18} N={int(m['N_eval'])} TP={int(m['TP'])} Acc={m['Acc']:.4f} Rec={m['Rec']:.4f} F1={m['F1']:.4f}")

    df = pd.DataFrame(rows)
    # 常用排序：按 F1 降序
    df = df.sort_values(by=["F1", "Rec", "Acc"], ascending=[False, False, False]).reset_index(drop=True)

    if args.out:
        outp = Path(args.out)
        outp.parent.mkdir(parents=True, exist_ok=True)
        df.to_csv(outp, index=False)
        print(f"[SAVE] {outp}")

    # 控制台显示一份简表
    show_cols = ["Tool", "N_eval", "TP", "FP", "FN", "Acc", "Rec", "F1"]
    print("\n=== Summary (top) ===")
    print(df[show_cols].to_string(index=False))


if __name__ == "__main__":
    main()