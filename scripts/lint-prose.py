#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.9"
# dependencies = []
# ///
"""Editorial linter for the reference prose — enforces DESIGN.md's bans, and reports stats.

`validate.sh` checks structure (manifests, mapping, frontmatter). This checks the *writing*:
the AI-tell vocabulary and filler adverbs DESIGN.md bans, em-dash discipline, and the
Ask-first note. Prints a per-file report and exits non-zero on any hard violation, so CI
keeps the editorial system honest instead of relying on a manual humanizer pass.

Usage: python3 scripts/lint-prose.py   (or: uv run scripts/lint-prose.py)
"""
from __future__ import annotations

import argparse
import logging
import re
import sys
from pathlib import Path

logging.basicConfig(level=logging.INFO, format="%(message)s")
log = logging.getLogger(__name__)

REF_DIR = Path(__file__).resolve().parent.parent / "skills" / "ui-design" / "references"

# Hard bans from DESIGN.md §Bans (word-boundary, case-insensitive). Kept tight to avoid
# false positives on legitimate technical prose (e.g. "key", "deep dive" as a domain term).
BANNED = [
    "leverage", "utilize", "delve", "foster", "seamless", "robust", "vibrant",
    "fundamentally", "essentially", "ultimately", "crucially", "in today's",
]
BAN_RE = re.compile(r"(?<![\w-])(" + "|".join(re.escape(w) for w in BANNED) + r")(?![\w-])", re.I)
HEADING_RE = re.compile(r"^#{1,6}\s", re.M)
EMDASH_PER_300 = 3.0  # forensic threshold


def lint(path: Path) -> tuple[list[str], dict]:
    text = path.read_text(encoding="utf-8")
    words = max(1, len(text.split()))
    issues: list[str] = []

    for m in BAN_RE.finditer(text):
        line = text.count("\n", 0, m.start()) + 1
        issues.append(f"L{line}: banned term '{m.group(1)}'")

    for m in re.finditer(r"https?://", text):
        line = text.count("\n", 0, m.start()) + 1
        issues.append(f"L{line}: external link (skill must be self-contained)")

    emdash = text.count("—") + text.count("–")
    density = emdash / words * 300
    if density > EMDASH_PER_300:
        issues.append(f"em-dash density {density:.1f}/300w (>{EMDASH_PER_300}); prefer colons")

    stats = {
        "words": words,
        "subtopics": len(HEADING_RE.findall(text)) - 1,  # minus the H1
        "emdash": emdash,
        "ask_first": "AskUserQuestion" in text,
    }
    if not stats["ask_first"]:
        issues.append("no AskUserQuestion / Ask-first note")
    return issues, stats


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("dir", nargs="?", type=Path, default=REF_DIR, help="references dir")
    args = p.parse_args()

    files = sorted(args.dir.glob("*.md"))
    if not files:
        log.error("no reference files in %s", args.dir)
        return 2

    hard = 0
    log.info("%-26s %6s %5s %5s  %s", "file", "words", "subs", "em—", "issues")
    for f in files:
        issues, s = lint(f)
        # every issue is hard: banned terms, links, missing Ask-first note, and em-dash density
        hard += len(issues)
        flag = "  ".join(issues) if issues else "ok"
        log.info("%-26s %6d %5d %5d  %s", f.name, s["words"], s["subtopics"], s["emdash"], flag)

    log.info("")
    if hard:
        log.error("prose-lint: FAIL (%d hard issue(s))", hard)
        return 1
    log.info("prose-lint: PASS (%d files)", len(files))
    return 0


if __name__ == "__main__":
    sys.exit(main())
