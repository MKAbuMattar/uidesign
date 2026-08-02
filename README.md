<div align="center">

# uidesign

**Visual UI style knowledge, wired into your AI agent.**

<p>
  <img src="https://img.shields.io/badge/license-MIT-3bb89a" alt="MIT">
  <img src="https://img.shields.io/badge/skill-1-97a1b2" alt="1 skill">
  <img src="https://img.shields.io/badge/commands-6-e0a458" alt="6 commands">
  <img src="https://img.shields.io/badge/reference_files-10-5b8def" alt="10 reference files">
  <img src="https://img.shields.io/badge/external_links-0-3bb89a" alt="no external links">
</p>

</div>

---

A plugin for AI coding agents that knows what each visual style **costs**, not just what it looks like.

Ask an agent for "a modern UI" and you get the same purple gradient, the same glass card, the same three feature boxes. This skill makes it choose instead: name the audience and the accessibility floor, pick one style, and say what that choice gives up.

```
/uidesign:choose a clinic booking app for patients over 70

  audience    older adults, low-vision common, once-a-month use
  floor       WCAG AA, 4.5:1 body, 3:1 controls, 44px targets
  shortlist   flat + minimal · skeuomorphic controls
› recommend flat and minimal, with one skeuomorphic cue on the
  date picker. cost: it will look plain. that is the correct
  trade for an audience that must not guess what is clickable.
```

## What it knows

Ten self-contained reference files, one per style, each with the technique in real values, the
audience it fits, and the bill it comes with:

`skeuomorphism` · `minimalism` · `neumorphism` · `glassmorphism` · `claymorphism` ·
`maximalism` · `brutalism` · `liquid-glass` · `spatial-ui` · `choosing`

It is opinionated where the evidence is one-sided. **Neumorphism** is not recommended anywhere:
an element the same colour as its background cannot clear the 3:1 non-text contrast a control
needs, so the skill names the cost and offers claymorphism instead. That is the register
throughout.

## The floor

Style is negotiable. These are not, and a style that cannot survive them is the finding:

- **4.5:1** body text, **3:1** large text and every control boundary, measured at the **worst**
  point over a gradient, photo, or translucent panel, not an average.
- A visible `:focus-visible` indicator at 3:1. Deleting the focus ring because it clashes is the
  most common regression in styled interfaces.
- Roughly **44px** touch targets. Colour is never the only signal for state.
- `prefers-reduced-motion`, `prefers-reduced-transparency`, `prefers-contrast` and
  `prefers-color-scheme` each get a real fallback that still reads correctly.

## Install

In **Claude Code**:

```
/plugin marketplace add mkabumattar/uidesign
```

```
/plugin install uidesign@uidesign
```

Then `/reload-plugins`. Try it:

```
/uidesign:help
/uidesign:explain glassmorphism
/uidesign:compare neumorphism vs claymorphism
/uidesign:audit src/components
/uidesign:tokens neo-brutalism for a dev tool, accent #FF5C00
```

Using a different agent? See **[INSTALL.md](INSTALL.md)**. Every route loads the same
`skills/ui-design/` directory, so no two agents can drift apart.

Or just talk. The skill activates on questions about the look of an interface, without a command.

## Commands

| Command | What it does |
|---|---|
| `/uidesign:explain <style>` | What it is, the technique in real values, when to use it, the cost |
| `/uidesign:compare <a> vs <b>` | Decision-first comparison under a constraint, with one recommendation |
| `/uidesign:choose <product>` | Picks a style for a real product after a multi-round interview, with tokens |
| `/uidesign:audit <path>` | Reads the real interface: contrast floor, coherence, generated-look tells |
| `/uidesign:tokens <style>` | A token set with every contrast ratio already measured |
| `/uidesign:help` | The command card |

## Develop

No compiler. Validation is one script, the same one CI runs:

```bash
bash scripts/validate.sh
```

It checks that all seven manifests parse and share a version, the `.cursor/skills` symlink
resolves, `skills/` has zero external links, every reference is mapped in `SKILL.md` and carries
its Ask-first note, `SKILL.md` declares both halves of the in/out contract, the contrast floor is
still stated, and the prose lint passes.

## What's next

The paced queue lives in [ROADMAP.md](ROADMAP.md): the editorial system, **DESIGN.md spec
support** (read a project's own `DESIGN.md` and honour it, then emit one), brand assets, an eval
harness scored on floor and cost, a worked audit example, Arabic and Spanish READMEs, and a site.

## Maintainer

Built by **[Mohammad Abu Mattar](https://mkabumattar.com)**.
Sibling plugin: **[sysdesign](https://github.com/mkabumattar/sysdesign)** for backend and
distributed system design.

MIT.
