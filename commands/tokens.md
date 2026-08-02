---
description: Generate a design token set for a chosen style, with contrast already measured
argument-hint: [style + brand, e.g. neo-brutalism for a dev tool, accent #FF5C00]
---

Use the `ui-design` skill. Produce tokens for: `$ARGUMENTS`.

If the style, the base colour, or the platform is unstated, ask with `AskUserQuestion` first. Guessing a brand colour wastes the whole output.

Emit a token set, not prose:

1. **Colour**: a neutral ramp plus the accent, each with the **measured ratio** against the surfaces it will actually sit on. Every pair intended for text must clear 4.5:1, and every control boundary 3:1. Show the numbers; a palette without ratios is untested.
2. **Type**: family, the scale with its ratio, weights, line heights, and the minimum size in use.
3. **Space**: the base unit and the scale derived from it.
4. **Shape**: radii and border widths as tokens, not literals.
5. **Depth**: the shadow set, written the way the chosen style writes it (offset solid for brutalism, layered soft for clay, backdrop-filter for glass).
6. **The settings**: the `prefers-*` overrides, each with a working fallback value.

Output as CSS custom properties by default. Ask if another format is wanted (Tailwind theme, design-token JSON, Swift, Compose) rather than assuming.

Close with the two or three decisions worth arguing about, not a description of the tokens.
