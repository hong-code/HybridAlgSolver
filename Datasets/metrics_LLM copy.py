#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import pandas as pd


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

    true_set = {"true", "1", "yes", "y", "t", "has redos", "redos", "vulnerable"}
    false_set = {"false", "0", "no", "n", "f", "none", "nan", "", "no redos", "safe"}

    out = pd.Series([None] * len(s), index=s.index, dtype="object")
    out[s.isin(true_set)] = True
    out[s.isin(false_set)] = False

    # numeric fallback
    mask_none = out.isna()
    if mask_none.any():
        num = pd.to_numeric(s[mask_none], errors="coerce")
        out.loc[mask_none & num.notna()] = (num.loc[num.notna()] != 0)

    return out.fillna(False).astype(bool)


def compute_metrics(y_true: pd.Series, y_pred: pd.Series) -> dict:
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
        description="Compute TP/Acc/Recall/F1 by joining corpus and tool predictions on base64 Regex."
    )
    ap.add_argument(
        "--pred",
        default="/home/HybridAlgSolver/Datasets/DataBase/tool_preds/GREWIA_attack_result_pred.csv",
        help="Prediction CSV path (per-tool). Must contain base64 column 'Regex'.",
    )
    ap.add_argument(
        "--corpus",
        default="/home/HybridAlgSolver/Datasets/DataBase/ResultsFromBaselines/CVE_regex_with_redos.csv",
        help="Ground-truth CSV path (Corpus-style: Regex(base64), ReDoS Status).",
    )

    ap.add_argument("--pred_regex_col", default="Regex", help="Prediction base64 regex column name.")
    ap.add_argument("--pred_label_col", default="ReDoS Status", help="Prediction label column name.")

    ap.add_argument("--corpus_regex_col", default="Regex", help="Corpus base64 regex column name.")
    ap.add_argument("--corpus_label_col", default="ReDoS Status", help="Corpus label column name.")
    ap.add_argument("--positive_label", default="Has ReDoS", help="Positive label in corpus.")

    ap.add_argument(
        "--save_merged",
        default="/home/HybridAlgSolver/Datasets/LLMs/merge.csv",
        help="If non-empty, save merged CSV with y_true/y_pred.",
    )
    args = ap.parse_args()

    pred_df = pd.read_csv(args.pred)
    corpus_df = pd.read_csv(args.corpus)

    # Clean column names (avoid hidden spaces)
    pred_df.columns = pred_df.columns.astype(str).str.strip()
    corpus_df.columns = corpus_df.columns.astype(str).str.strip()

    # y_true from corpus label
    y_true = (corpus_df[args.corpus_label_col].astype(str).str.strip() == args.positive_label)

    # Reduce prediction DF and rename label to avoid collision
    pred_small = pred_df[[args.pred_regex_col, args.pred_label_col]].copy()
    pred_small = pred_small.rename(columns={args.pred_label_col: "pred"})

    # Join on base64 Regex directly
    merged = corpus_df.merge(
        pred_small,
        left_on=args.corpus_regex_col,
        right_on=args.pred_regex_col,
        how="left",
    )

    # Match rate
    matched = merged["pred"].notna().sum()
    total = len(merged)
    print(f"[Info] Matched rows: {matched}/{total} ({matched/total:.2%})")

    # y_pred
    y_pred = to_bool_series(merged["pred"].fillna(False))

    metrics = compute_metrics(y_true=y_true, y_pred=y_pred)

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

    # Save merged
    if args.save_merged:
        merged_out = merged.copy()
        merged_out = merged.copy()

        # y_true：直接从 merged 的 ReDoS Status 算（与 merged 同长度）
        merged_out["y_true"] = (
            merged_out[args.corpus_label_col].astype(str).str.strip() == args.positive_label
        )

        # y_pred：从 merged 的 pred 列算（与 merged 同长度）
        merged_out["y_pred"] = to_bool_series(merged_out["pred"].fillna(False))

        merged_out.to_csv(args.save_merged, index=False)
        print(f"\n[Info] Merged file saved to: {args.save_merged}")


if __name__ == "__main__":
    main()