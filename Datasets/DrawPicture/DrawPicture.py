#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import warnings
from pathlib import Path
from typing import Dict, List, Optional, Set

import pandas as pd
import matplotlib.pyplot as plt
from upsetplot import UpSet, from_contents

warnings.filterwarnings("ignore", category=FutureWarning, module="upsetplot")

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
    if "has redos" in s:
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


def load_tool_set(csv_path: Path) -> Set[str]:
    df = pd.read_csv(csv_path)
    regex_col = pick_col(df, REGEX_COL_CANDIDATES)
    status_col = pick_col(df, STATUS_COL_CANDIDATES)
    if regex_col is None or status_col is None:
        raise ValueError(f"[{csv_path}] missing columns. found={list(df.columns)}")

    df2 = df[[regex_col, status_col]].dropna(subset=[regex_col])
    df_pos = df2[df2[status_col].apply(is_positive)]
    return set(df_pos[regex_col].map(normalize_b64).astype(str).tolist())


def remove_grid(ax):
    ax.grid(False)
    ax.xaxis.grid(False, which="both")
    ax.yaxis.grid(False, which="both")


def find_intersection_axis(axes_dict):
    ax = axes_dict.get("intersections") or axes_dict.get("intersection")
    if ax is not None:
        return ax
    for _, a in axes_dict.items():
        ylab = (a.get_ylabel() or "").lower()
        if "intersection" in ylab:
            return a
    return None


def find_totals_axis(axes_dict):
    return axes_dict.get("totals") or axes_dict.get("total")


def find_matrix_axis(axes_dict):
    return axes_dict.get("matrix")


def find_matrix_like_axes(axes_dict):
    out = []
    for k, ax in axes_dict.items():
        lk = str(k).lower()
        if ("matrix" in lk) or ("shad" in lk):
            if ax is not None:
                out.append(ax)
    return out


def shrink_axis_height(ax, scale: float, anchor: str = "bottom"):
    if ax is None or scale <= 0 or abs(scale - 1.0) < 1e-9:
        return
    b = ax.get_position()
    new_h = b.height * scale
    new_y0 = (b.y1 - new_h) if anchor == "top" else b.y0
    ax.set_position([b.x0, new_y0, b.width, new_h])


def shift_axis_vert(ax, dy: float):
    if ax is None or abs(dy) < 1e-12:
        return
    b = ax.get_position()
    ax.set_position([b.x0, b.y0 + dy, b.width, b.height])


def shrink_top_intersection_axis_height(ax, scale: float = 0.75, anchor: str = "bottom"):
    shrink_axis_height(ax, scale=scale, anchor=anchor)


def shrink_matrix_totals_and_pull_intersections_down(axes, tool_vscale: float, anchor="bottom"):
    ax_inter = find_intersection_axis(axes)
    ax_totals = find_totals_axis(axes)
    ax_matrix_main = find_matrix_axis(axes)
    matrix_axes = find_matrix_like_axes(axes)

    if ax_inter is None or ax_matrix_main is None:
        for ax in matrix_axes:
            shrink_axis_height(ax, tool_vscale, anchor=anchor)
        if ax_totals is not None:
            shrink_axis_height(ax_totals, tool_vscale, anchor=anchor)
        return

    b_inter_before = ax_inter.get_position()
    b_matrix_before = ax_matrix_main.get_position()
    gap = b_inter_before.y0 - b_matrix_before.y1

    for ax in matrix_axes:
        shrink_axis_height(ax, tool_vscale, anchor=anchor)
    if ax_totals is not None:
        shrink_axis_height(ax_totals, tool_vscale, anchor=anchor)

    b_matrix_after = ax_matrix_main.get_position()
    desired_inter_y0 = b_matrix_after.y1 + gap

    b_inter_after = ax_inter.get_position()
    dy = desired_inter_y0 - b_inter_after.y0
    shift_axis_vert(ax_inter, dy)


def set_tool_label_font(ax_matrix, fontsize: int = 12, pad: int = 2):
    if ax_matrix is None:
        return
    ax_matrix.tick_params(axis="y", labelsize=fontsize, pad=pad)
    labs = ax_matrix.get_yticklabels()
    if labs:
        ax_matrix.set_yticklabels([t.get_text() for t in labs], fontsize=fontsize)


def widen_left_area_by_shrinking_right(axes, totals_width: float = 0.30, gap: float = 0.02):
    """
    给左侧 totals(含工具名) 留更大空间 + 可控 totals/matrix 间隙。
    gap 越大，横条与工具名分隔越开。
    """
    ax_totals = find_totals_axis(axes)
    ax_matrix = find_matrix_axis(axes)
    ax_inter = find_intersection_axis(axes)

    if ax_totals is None or ax_matrix is None:
        return

    b_matrix = ax_matrix.get_position()
    right_edge = b_matrix.x1

    new_split = min(max(totals_width, 0.05), 0.60)
    new_x0 = new_split + gap

    b_tot = ax_totals.get_position()
    ax_totals.set_position([b_tot.x0, b_tot.y0, max(0.05, new_split - b_tot.x0), b_tot.height])

    for k, ax in axes.items():
        if ax is None:
            continue
        lk = str(k).lower()
        if ("matrix" in lk) or ("shad" in lk) or ("intersections" in lk) or ("intersection" in lk):
            b = ax.get_position()
            new_w = max(0.05, right_edge - new_x0)
            ax.set_position([new_x0, b.y0, new_w, b.height])

    if ax_inter is not None:
        b = ax_inter.get_position()
        new_w = max(0.05, right_edge - new_x0)
        ax_inter.set_position([new_x0, b.y0, new_w, b.height])


def label_totals_bars(ax, fontsize: int = 9, pad: float = 1.5,
                     x_margin: float = 1.05, mode: str = "inside"):
    """
    totals 横条标注：
    - mode="inside": 数字画在条形内部靠右，避免压到工具名
    - mode="edge":   数字画在条形末端外侧（可能会挤到工具名，慎用）
    """
    if ax is None:
        return
    if not getattr(ax, "containers", None):
        return

    # 计算最大宽度
    max_w = 0.0
    for c in ax.containers:
        for p in getattr(c, "patches", []):
            try:
                max_w = max(max_w, float(p.get_width()))
            except Exception:
                pass

    if max_w > 0:
        ax.set_xlim(0, max_w * x_margin)

    for c in ax.containers:
        try:
            if mode == "inside":
                ax.bar_label(
                    c,
                    fmt="%.0f",
                    label_type="center",
                    padding=0,
                    fontsize=fontsize
                )
                for txt, patch in zip(ax.texts[-len(c):], c.patches):
                    x = patch.get_x() + patch.get_width()
                    y = patch.get_y() + patch.get_height() / 2.0
                    txt.set_position((x - max_w * 0.01, y))
                    txt.set_ha("right")
                    txt.set_va("center")
            else:
                ax.bar_label(c, fmt="%.0f", label_type="edge", padding=pad, fontsize=fontsize)
        except Exception:
            pass


def set_intersection_yaxis_font(ax, tick_font: int = 10, ylabel_font: Optional[int] = None):
    """Adjust intersection y-axis tick label font size (+ optional y-label font size)."""
    if ax is None:
        return
    ax.tick_params(axis="y", labelsize=int(tick_font))
    if ylabel_font is not None:
        yl = ax.get_ylabel()
        ax.set_ylabel(yl, fontsize=int(ylabel_font))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--outdir", required=True, help="Directory containing per-tool groundtruth CSVs (*.csv)")
    ap.add_argument("--out", required=True, help="Output prefix, e.g. /path/upset_vuln")
    ap.add_argument("--show", type=int, default=60, help="Show top-N intersections (default: 60)")
    ap.add_argument("--sort-by", choices=["cardinality", "degree"], default="cardinality")
    ap.add_argument("--tool-order", nargs="*", default=None, help="Optional tool order (CSV filename stems)")
    ap.add_argument("--figw", type=float, default=13.0)
    ap.add_argument("--figh", type=float, default=4.0)

    ap.add_argument("--top-vscale", type=float, default=0.75)
    ap.add_argument("--top-anchor", choices=["bottom", "top"], default="bottom")

    ap.add_argument("--tool-font", type=int, default=14)
    ap.add_argument("--tool-pad", type=int, default=2)
    ap.add_argument("--tool-vscale", type=float, default=0.85)

    ap.add_argument("--totals-font", type=int, default=9)
    ap.add_argument("--totals-pad", type=float, default=1.5)

    ap.add_argument("--totals-width", type=float, default=0.34,
                    help="Fraction of figure width reserved for left totals/tool names. Larger => more left space.")
    ap.add_argument("--totals-gap", type=float, default=0.02,
                    help="Gap between totals bars and tool names/matrix area. Larger => more separation.")
    ap.add_argument("--totals-label", choices=["inside", "edge"], default="inside",
                    help="Where to draw totals numbers. 'inside' avoids overlapping tool names.")

    # NEW: intersection y-axis font controls
    ap.add_argument("--inter-yfont", type=int, default=10,
                    help="Font size of intersection y-axis tick labels")
    ap.add_argument("--inter-ylabel-font", type=int, default=None,
                    help="Font size of intersection y-axis label (if any)")

    args = ap.parse_args()

    gt_dir = Path(args.outdir)
    csvs = sorted(gt_dir.glob("*.csv"))
    if not csvs:
        raise SystemExit(f"No CSV found in {gt_dir}")

    tool2set: Dict[str, Set[str]] = {}
    for p in csvs:
        tool = p.stem
        s = load_tool_set(p)
        tool2set[tool] = s
        print(f"[LOAD] {tool:<18} HasReDoS={len(s)}  from {p.name}")

    if args.tool_order:
        tool2set = {t: tool2set[t] for t in args.tool_order if t in tool2set}

    data = from_contents(tool2set)

    fig = plt.figure(figsize=(args.figw, args.figh))
    upset = UpSet(
        data,
        subset_size="count",
        show_counts=False,
        sort_by=args.sort_by,
        sort_categories_by="cardinality",
        intersection_plot_elements=args.show,
    )
    axes = upset.plot(fig=fig)

    for ax in axes.values():
        if ax is not None:
            remove_grid(ax)

    # 上面交集柱变矮
    ax_inter = find_intersection_axis(axes)
    shrink_top_intersection_axis_height(ax_inter, scale=args.top_vscale, anchor=args.top_anchor)

    # NEW: intersection y-axis tick/ylabel font sizes
    set_intersection_yaxis_font(ax_inter, tick_font=args.inter_yfont, ylabel_font=args.inter_ylabel_font)

    # matrix/totals 行更紧，并把上面柱往下贴近
    shrink_matrix_totals_and_pull_intersections_down(axes, tool_vscale=args.tool_vscale, anchor="bottom")

    # 工具名字体
    ax_matrix = find_matrix_axis(axes)
    set_tool_label_font(ax_matrix, fontsize=args.tool_font, pad=args.tool_pad)

    # 给左侧留更多空间 + 增加 totals 和工具名间隙
    widen_left_area_by_shrinking_right(axes, totals_width=args.totals_width, gap=args.totals_gap)

    # totals 数值（默认 inside，不会压到工具名）
    ax_totals = find_totals_axis(axes)
    label_totals_bars(ax_totals, fontsize=args.totals_font, pad=args.totals_pad, mode=args.totals_label)

    out_prefix = Path(args.out)
    out_prefix.parent.mkdir(parents=True, exist_ok=True)
    plt.savefig(str(out_prefix) + ".png", dpi=300, bbox_inches="tight")
    plt.savefig(str(out_prefix) + ".pdf", bbox_inches="tight")
    print(f"[OK] Saved: {out_prefix}.png and {out_prefix}.pdf")


if __name__ == "__main__":
    main()