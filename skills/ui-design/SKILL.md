---
name: ui-design
version: 0.1.0
description: |
  Choose, explain, compare, or audit a visual UI style. Use when working on the look
  of an interface: skeuomorphism, flat design, neumorphism, glassmorphism, claymorphism,
  minimalism, maximalism, brutalism and neo-brutalism, Apple's Liquid Glass, or spatial
  and immersive UI. Covers what each style costs in contrast, legibility, accessibility,
  performance, and build effort, which audiences and products each fits, and which
  styles are cliches an agent should stop reaching for by default. Asks about audience,
  platform, brand, and accessibility target before recommending a style.
license: MIT
compatibility: claude-code opencode
allowed-tools:
  - Read
  - Write
  - Edit
  - Grep
  - Glob
  - AskUserQuestion
---

# UI Design Styles

## Overview

A reference for picking a visual style on purpose. Each style is a set of choices about depth, contrast, colour and ornament, and each buys a feeling at a price: legibility, accessibility, implementation effort, or the risk of looking like every other page generated this year.

**Core principle:** a style is a constraint you accept, not a decoration you apply. Name the audience and the accessibility floor first, then pick the style that survives them.

## When to use

- "What is X" for a visual style (glassmorphism, neumorphism, brutalism, Liquid Glass, spatial UI)
- "X vs Y" style comparisons, or choosing one for a product and audience
- Auditing an existing interface: does the style hold up on contrast, focus states, and reduced-transparency settings
- Deciding whether a style is right for this brand, or is just the current trend
- Recognising the AI-generated look and moving away from it

Not for: information architecture and user flows, backend or system architecture (use a system-design skill), copywriting, or brand strategy beyond the visual surface.

## Ask first

Never recommend a style before these are settled. Ask with `AskUserQuestion`, offer concrete options, and let the user answer **"Other"**:

- **Audience and sector.** A bank, a hospital, and a design studio do not get the same answer. Trust-signalling sectors punish novelty; creative ones punish sameness.
- **Accessibility target.** WCAG AA is the floor unless told otherwise. AAA, or a known audience with low vision, rules out several styles outright.
- **Platform.** Web, iOS, Android, desktop, or headset. Some styles are native on one platform and a costly imitation everywhere else.
- **Brand constraints.** Existing palette, typography, logo, and whether the style must sit beside an older product.
- **Effort and lifespan.** A landing page that ships next week and a design system maintained for five years justify different answers.

If the user says "you decide", present the realistic options with their consequences rather than silently picking. When two answers conflict (a maximalist brand with a WCAG AAA target, a glass aesthetic over user-supplied photos), name the conflict and ask how to resolve it.

## Reference map

Load the file that matches the question. Each is standalone.

| Style | File | Character |
|---|---|---|
| Skeuomorphism | `references/skeuomorphism.md` | real-world imitation; affordance through familiarity |
| Flat & minimalism | `references/minimalism.md` | ornament removed; hierarchy from space and type |
| Neumorphism | `references/neumorphism.md` | extruded from the background; soft, low contrast |
| Glassmorphism | `references/glassmorphism.md` | frosted translucency and depth layering |
| Claymorphism | `references/claymorphism.md` | inflated 3D shapes; friendly, playful |
| Maximalism | `references/maximalism.md` | density, colour, and ornament as the point |
| Brutalism & neo-brutalism | `references/brutalism.md` | raw structure, hard borders, clashing colour |
| Liquid Glass | `references/liquid-glass.md` | Apple's material; refraction and adaptivity |
| Spatial & immersive UI | `references/spatial-ui.md` | depth, gaze and pinch, comfort in 3D space |
| Choosing & the floor | `references/choosing.md` | the decision table, the accessibility floor, the AI-look tells |

## How to answer

1. **Ask first** (above). A style recommendation without an audience and an accessibility target is a guess.
2. **Name the constraint** you are designing against, from their answers.
3. **Pick one style and commit.** Shortlist two or three, recommend one, and say why the others lost.
4. **State the cost.** Every style gives something up: contrast, legibility at small sizes, GPU cost, build time, or distinctiveness. A recommendation without its cost is unfinished.
5. **Hold the floor.** Contrast ratios, visible focus states, honouring `prefers-reduced-transparency`, `prefers-reduced-motion` and `prefers-contrast`, and a target size that a thumb can hit are never traded away for a look. If the style cannot survive them, that is the finding.
6. **Give the implementation**, concretely: the CSS or platform material, the tokens, and the fallback when the effect is unsupported or switched off.

## Output contract

- **Open with the answer**: the style, the ratio, the file path. No preamble.
- **Number multi-step work**, one bounded action per step.
- **Cap a list at five**, ranked, split into must and nice-to-have past that.
- **Close with one concrete next action.**
- **Report failures flat**: the element, the measured ratio, the fix. No apology.
- **Show the swatch or the snippet, not a description of it.** When a value decides the look, give the value.
