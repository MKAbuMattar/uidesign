# Changelog

All notable changes to this project are documented here. The format is based on
[Keep a Changelog](https://keepachangelog.com/), and this project adheres to
[Semantic Versioning](https://semver.org/).

## [0.1.0] - 2026-08-02

### Added

- **The `ui-design` skill**: a router with a clarify-first contract (audience, accessibility
  target, platform, brand, lifespan), a reference map, and an output contract.
- **Ten reference files**, each self-contained, each with its Ask-first note, the technique in
  real values, the audiences it fits, and what it costs: `skeuomorphism`, `minimalism`,
  `neumorphism`, `glassmorphism`, `claymorphism`, `maximalism`, `brutalism`, `liquid-glass`,
  `spatial-ui`, and `choosing` (the decision table, the accessibility floor, the generated-look
  tells).
- **Six commands**: `explain`, `compare`, `choose`, `audit`, `tokens`, `help`.
- **Seven harness manifests** plus a `.cursor/skills` symlink, all pointing at the canonical
  `./skills/` directory so no install route can drift.
- **`ROADMAP.md`**: nine paced increments (editorial system, DESIGN.md spec support, brand
  assets, community health, eval harness, worked example, README i18n, site, 1.0.0), plus what was
  considered and deferred and what is rejected on purpose.
- **`scripts/validate.sh`**: version parity across every manifest, the symlink resolving, zero
  external links, every reference mapped and carrying its Ask-first note, both halves of the
  in/out contract present, the contrast floor still stated, and the prose lint.
