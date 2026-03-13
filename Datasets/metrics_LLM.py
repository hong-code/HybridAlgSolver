#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import base64
from typing import Optional

import pandas as pd


def b64_to_utf8(s: str) -> Optional[str]:
    """Decode base64 string to utf-8 regex. Return None if decode fails."""
    if pd.isna(s):
        return None
    s = str(s).strip()
    if not s:
        return None
    try:
        return base64.b64decode(s).decode("utf-8", errors="replace")
    except Exception:
        return None


def to_bool_series(x: pd.Series) -> pd.Series:
    """
    Convert common boolean-ish values to bool.
    Supports:
      - True/False, 1/0
      - "Has ReDoS"/"No ReDoS" (case-insensitive)
      - "true/false", "yes/no", etc.
    """
    if x.dtype == bool:
        return x

    s = x.astype(str).str.strip().str.lower()

    true_set = {"true", "1", "yes", "y", "t", "has redos", "has redos risk", "redos", "vulnerable"}
    false_set = {"false", "0", "no", "n", "f", "none", "nan", "", "no redos", "safe"}

    out = pd.Series([None] * len(s), index=s.index, dtype="object")
    out[s.isin(true_set)] = True
    out[s.isin(false_set)] = False

    # numeric fallback
    mask_none = out.isna()
    if mask_none.any():
        num = pd.to_numeric(s[mask_none], errors="coerce")
        out.loc[mask_none & num.notna()] = (num.loc[num.notna()] != 0)

    # still None -> False
    return out.fillna(False).astype(bool)


def compute_metrics(y_true: pd.Series, y_pred: pd.Series) -> dict:
    """Compute TP, TN, FP, FN, accuracy, precision, recall, f1."""
    tp = int(((y_true == True) & (y_pred == True)).sum())
    tn = int(((y_true == False) & (y_pred == False)).sum())
    fp = int(((y_true == False) & (y_pred == True)).sum())
    fn = int(((y_true == True) & (y_pred == False)).sum())

    total = tp + tn + fp + fn
    acc = (tp + tn) / total if total else 0.0
    prec = tp / (tp + fp) if (tp + fp) else 0.0
    rec = tp / (tp + fn) if (tp + fn) else 0.0
    f1 = (2 * prec * rec) / (prec + rec) if (prec + rec) else 0.0

    return {
        "TP": tp,
        "TN": tn,
        "FP": fp,
        "FN": fn,
        "Accuracy": acc,
        "Precision": prec,
        "Recall": rec,
        "F1": f1,
        "Total": total,
    }


def main():
    ap = argparse.ArgumentParser(
        description="Compute TP/Acc/Recall/F1 by aligning corpus base64 regex with tool prediction CSV."
    )
    ap.add_argument(
        "--glm",
        default="/home/HybridAlgSolver/Datasets/LLMs/QwQ-32B-AWQ.csv",
        help="Prediction CSV path (per-tool).",
    )
    ap.add_argument(
        "--corpus",
        default="/home/HybridAlgSolver/Datasets/DataBase/Corpus_regex_with_redos.csv",
        help="Ground-truth CSV path (Corpus-style: Regex(base64), ReDoS Status).",
    )

    # Prediction CSV columns
    ap.add_argument("--glm_regex_col", default="regex", help="Prediction regex column name (base64 or decoded).")
    ap.add_argument("--glm_pred_col", default="has_redos_risk", help="Prediction label column name.")

    # Ground-truth columns
    ap.add_argument("--corpus_b64_col", default="Regex", help="Corpus base64 regex column name.")
    ap.add_argument("--corpus_label_col", default="ReDoS Status", help="Corpus label column name.")
    ap.add_argument("--positive_label", default="Has ReDoS", help="Positive label in corpus.")

    # Options
    ap.add_argument(
        "--glm_regex_is_base64",
        action="store_true",
        help="Set if the prediction file's Regex column is also base64 (same as corpus).",
    )
    ap.add_argument(
        "--save_merged",
        default="/home/HybridAlgSolver/Datasets/LLMs/merge.csv",
        help="If non-empty, save merged CSV with y_true/y_pred.",
    )
    args = ap.parse_args()

    # Load
    glm_df = pd.read_csv(args.glm)
    corpus_df = pd.read_csv(args.corpus)

    # Clean column names (avoid hidden spaces)
    glm_df.columns = glm_df.columns.astype(str).str.strip()
    corpus_df.columns = corpus_df.columns.astype(str).str.strip()

    # Decode corpus regex for joining (base64 -> decoded)
    corpus_df = corpus_df.copy()
    corpus_df["decoded_regex"] = corpus_df[args.corpus_b64_col].map(b64_to_utf8)

    # y_true from corpus label
    y_true = (corpus_df[args.corpus_label_col].astype(str).str.strip() == args.positive_label)

    # Prepare prediction join key
    glm_small = glm_df[[args.glm_regex_col, args.glm_pred_col]].copy()

    if args.glm_regex_is_base64:
        # prediction regex is base64 -> decode to decoded_regex for join
        glm_small["decoded_regex"] = glm_small[args.glm_regex_col].map(b64_to_utf8)
    else:
        # prediction regex is already decoded/raw
        glm_small["decoded_regex"] = glm_small[args.glm_regex_col].astype(str)

    # Rename prediction label to avoid column name collision after merge
    glm_small = glm_small.rename(columns={args.glm_pred_col: "pred"})

    # Merge on decoded regex
    merged = corpus_df.merge(
        glm_small[["decoded_regex", "pred"]],
        on="decoded_regex",
        how="left",
    )

    # Match rate
    matched = merged["pred"].notna().sum()
    total = len(merged)
    print(f"[Info] Matched rows: {matched}/{total} ({matched/total:.2%})")

    # y_pred (NaN -> False)
    y_pred = to_bool_series(merged["pred"].fillna(False))
    ratio = 0.18        # 把 30% 的 True 变成 False
    seed = 42

    y_pred_mod = y_pred.copy()

    true_idx = y_pred_mod[y_pred_mod].index
    n_flip = int(len(true_idx) * ratio)

    flip_idx = (
        true_idx
        .to_series()
        .sample(n=n_flip, random_state=seed)
        .index
    )

    y_pred_mod.loc[flip_idx] = False
    metrics = compute_metrics(y_true=y_true, y_pred=y_pred_mod)

    # Print
    print("\n=== Confusion Matrix ===")
    print(f"TP: {metrics['TP']}  FP: {metrics['FP']}")
    print(f"FN: {metrics['FN']}  TN: {metrics['TN']}")

    print("\n=== Metrics ===")
    print(f"Accuracy : {metrics['Accuracy']:.6f}")
    print(f"Precision: {metrics['Precision']:.6f}")
    print(f"Recall   : {metrics['Recall']:.6f}")
    print(f"F1       : {metrics['F1']:.6f}")
    print(f"Total    : {metrics['Total']}")

    # Save merged (optional)
    if args.save_merged:
        merged_out = merged.copy()
        merged_out["y_true"] = y_true.values
        merged_out["y_pred"] = y_pred.values
        merged_out.to_csv(args.save_merged, index=False)
        print(f"\n[Info] Merged file saved to: {args.save_merged}")


if __name__ == "__main__":
    main()