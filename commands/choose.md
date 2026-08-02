---
description: Pick a visual style for a real product under real constraints
argument-hint: [product, e.g. a clinic booking app for older patients]
---

Use the `ui-design` skill, loading `references/choosing.md`. Choose a style for: `$ARGUMENTS`.

**Ask before recommending.** Run at least two rounds of `AskUserQuestion`, adapting the second to the first:

1. **Audience and sector**, **accessibility target**, **platform**.
2. Then, shaped by those: brand constraints, information density, session length (once, or daily), team size and lifespan, and whether the product must look trustworthy or distinctive first.

Never assume a missing input. If the user says "you decide", present the realistic options with their consequences and make a labelled recommendation they can veto.

Then:

1. **Shortlist two**, from the decision table.
2. **Recommend one**, with the constraint that decided it.
3. **State what it costs** and what you would watch for.
4. **Give the starting tokens**: the palette with measured contrast pairs, the type scale, the spacing base, the corner and shadow treatment.
5. **Name the hardest screen** in this product and say how the style behaves there. Styles fail on the dense table and the long form, not on the hero.
6. **Then validate with one more `AskUserQuestion` round**: surface the conflicts (a maximalist brand against a AAA target, a glass aesthetic over user photos) and let the user resolve them rather than resolving them silently.
