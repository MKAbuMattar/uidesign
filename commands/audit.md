---
description: Audit a real interface for accessibility floor violations and style incoherence
argument-hint: [path or scope, e.g. src/components]
---

Use the `ui-design` skill. Audit: `$ARGUMENTS`.

The difference from `/uidesign:choose`: **choose picks a style for a product described to you; audit reads the interface that exists.** Work from the real files.

1. **Read the actual sources**: stylesheets, design tokens, component files, Tailwind config, theme definitions. Find the palette, the type scale, the spacing base, the shadow and radius treatments.
2. **Check the floor first**, because these are defects rather than opinions:
   - Text contrast under 4.5:1 (3:1 for large), measured at the worst point over any gradient, image, or translucent surface.
   - Non-text contrast under 3:1 on any control boundary.
   - Missing or removed `:focus-visible` indicators.
   - Touch targets under about 44px.
   - Colour as the only signal for state.
   - Missing handling for `prefers-reduced-motion`, `prefers-reduced-transparency`, `prefers-contrast`.
   - `backdrop-filter` with no `@supports` fallback.
3. **Then check coherence**: how many type sizes, weights, radii, shadow values and near-duplicate colours are actually in use, and whether two depth models are mixed (see `choosing.md`).
4. **Then check for the generated look**, the eight tells in `choosing.md`, and say which apply.
5. **Report ranked findings, worst first.** For each: the **evidence** (`file:line` and the value), what breaks and for whom, the **fix** with the concrete value, and the **tradeoff the fix carries**.

Never invent a finding to fill the report. If the interface is sound, say so and name the measurement that would change the verdict.
