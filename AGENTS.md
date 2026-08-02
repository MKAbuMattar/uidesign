# AGENTS.md — uidesign

Instructions for AI agents working in this repo. Human contributors: see `README.md`.

## What this is

A **plugin for AI coding agents** that gives them visual UI style knowledge: one skill
(`ui-design`) plus six commands. The register is **reference** — the value is the prose and the
numbers, not any UI. There is **no build, no stack, no runtime**: plain Markdown plus harness
manifests.

Sibling plugin: **sysdesign** (backend and distributed system design). Keep the boundary. This
repo does not cover information architecture, user flows, backend architecture, or copywriting.

## Layout

- `.claude-plugin/plugin.json` + `marketplace.json` — Claude Code.
- Other harnesses: `.codex-plugin/plugin.json`, `.kimi-plugin/plugin.json` (declares `commands/` too),
  `gemini-extension.json` + `GEMINI.md`, root `plugin.json` (Antigravity), `.agents/plugins/marketplace.json`,
  and `.cursor/skills/ui-design` (a **symlink** to the canonical skill). All point at `./skills/`
  rather than shipping a copy. **Every manifest carries the same version** and `validate.sh` enforces it.
- `skills/ui-design/SKILL.md` — the router: overview, when-to-use, Ask-first, reference map,
  how-to-answer, output contract.
- `skills/ui-design/references/*.md` — ten self-contained style files.
- `commands/*.md` — one file per `/uidesign:<verb>`.
- `scripts/` — `validate.sh` and `lint-prose.py`.

## Working commands

| Command | What it does |
|---|---|
| `bash scripts/validate.sh` | All checks. **Must pass before commit.** |
| `python3 scripts/lint-prose.py` | Per-file editorial report (banned vocab, links, em-dash density, Ask-first note). |

## Conventions

- **Self-contained.** No external links inside `skills/`. A reader never clicks out.
- **Every recommendation carries its cost.** A style named without what it gives up is unfinished.
- **The accessibility floor is not a style opinion.** Contrast ratios, focus indicators, target
  sizes and the `prefers-*` settings are never traded for a look. A style that cannot survive them
  is the finding.
- **Numbers over adjectives.** Give the CSS, the ratio, the px value. "Soft shadow" decides nothing.
- **1 skill, N commands.** New intents are new `commands/*.md`, never a second skill. The bar for
  a new command: it must take a **different input** or produce a **different output**.
- **Ask before recommending.** Audience, accessibility target, and platform are required inputs.

## Hard rules

- All seven manifests parse and share one version before any commit.
- Zero external links in `skills/`.
- Clean conventional commits. **No** `Co-Authored-By`, **no** "Generated with Claude Code", no AI
  mention of any kind.
- Don't commit `.serena/`, `.claude/`, `.DS_Store`.
- Push only when asked.
