# Roadmap

Paced improvements to the plugin, one increment per day or two. Each increment lands as its own
conventional commit; skill or command content changes bump **every** manifest together, get a
`CHANGELOG.md` entry, must pass `bash scripts/validate.sh`, and ship as a tagged GitHub release.

Scope is the plugin (skill, commands, references, scripts, docs) plus, from increment 7, the site.

| # | Days | Increment | Status |
|---|---|---|---|
| 1 | 1 | **Editorial system** — `DESIGN.md` (the voice, the reference-file anatomy, the formatting rules, the bans) and a thin `CLAUDE.md` pointing at it and `AGENTS.md`. Written second on purpose: ten references exist, so the system can describe what the prose already does instead of guessing. | planned |
| 2 | 2–3 | **Brand assets** — `assets/logo.svg` (horizontal lockup) + `assets/icon.svg` (square mark) + favicons, self-contained SVG with no external fonts. Then per-command glyphs for the six commands. The mark should say "style with a floor under it", not a paintbrush. Restores the `logo` key in `.codex-plugin/plugin.json`, dropped in 0.1.0 because it pointed at a file that did not exist. | planned |
| 3 | 4 | **Community health** — `.github/` gains `CODE_OF_CONDUCT.md`, `CONTRIBUTING.md`, `SECURITY.md`, issue templates and a PR template. `validate.yml` already runs; the rest of the folder is empty. | planned |
| 4 | 5–6 | **Paired eval harness** — `evals/` with `cases.jsonl`, `rubric.md`, `runners.example.json` and `scripts/run_evals.py`, mirroring sysdesign's. The dimensions have to be this skill's own: **floor** (does the answer hold the contrast and focus requirements), **cost** (does every style come with what it gives up), **fit** (does the recommendation follow from the audience), plus correctness and concision. The release gate should refuse a candidate that does not beat baseline on floor and cost. | planned |
| 5 | 7 | **Worked example** — `examples/clinic-booking-audit.md`: a real `/uidesign:audit` run over a small component set, showing measured ratios, ranked findings with `file:line` evidence, and the fixes with their tradeoffs. The depth bar for what an audit should look like. | planned |
| 6 | 8–9 | **README i18n** — `README.ar.md` (RTL-correct) and `README.es.md` with the language-switcher line. Keep all three in sync: a change to counts, commands, or style slugs belongs in all of them. Code blocks, command names and style slugs stay untranslated. | planned |
| 7 | 10–13 | **Site** — an Astro landing page plus a per-locale `/install/` page with a harness picker, at a subdomain to be chosen. Its own `PRODUCT.md` and `DESIGN.md` under `site/`. The obvious trap: a site about visual styles must not itself look generated, so it should commit to one style and hold it, and pass its own audit. | planned |
| 8 | 14 | **v1.0.0 milestone** — full audit (validate + lint + the official plugin validators), count and consistency sweep across READMEs, manifests and the site, CHANGELOG, tag and release. | planned |

## Considered and deferred

- **More styles.** Material Design, fluent, retro and Y2K, dark-mode-as-a-style, and the
  bento-grid layout trend are all plausible eleventh references. None ship until one of them
  answers a question the ten cannot: the bar is a distinct set of tradeoffs, not a distinct name.
- **A colour-contrast script.** Tempting, and the skill already demands measured ratios. Deferred
  because agents can compute WCAG ratios directly and every design tool ships a checker; a script
  would be code to maintain for something already solved twice over.
- **Component code generation.** Emitting React or Vue components in a chosen style. Out of scope:
  this is a design-decision skill, and the moment it generates components it owns a framework
  matrix it cannot keep current.

## Rejected on purpose

- **A second skill.** `AGENTS.md` holds the 1-skill convention. New intents are new
  `commands/*.md` wrappers, and the bar for one is a different **input** or a different **output**.
- **Information architecture, user flows, and copywriting.** Adjacent, and genuinely design work,
  but they belong with the product and system-design tooling rather than here. This skill answers
  what an interface should look like and what that costs.
- **Backend or system architecture.** That is [sysdesign](https://github.com/mkabumattar/sysdesign).
  Keeping the boundary is what lets both answer well.
- **Trend chasing.** A reference file per seasonal look would make the skill a feed. A style earns
  a file when it has a stable technique and a describable cost, not when it is popular.
