---
description: Strip the generated look out of a real interface and commit to a decision instead
argument-hint: [path or scope, e.g. src/components or app/page.tsx]
---

Use the `ui-design` skill. Deslop: `$ARGUMENTS`.

The difference from `/uidesign:audit`: **audit reads and reports; deslop reads and changes the files.** Audit hands back ranked findings and stops. This one edits, and every edit has to be a decision somebody could defend, so the interface ends up looking chosen rather than merely different.

**Ask first (`AskUserQuestion`)**, because a rewrite without these produces a second default: what the product is and who uses it; whether a brand constraint exists already (a typeface licence, a mandated accent, a parent design system); what may **not** change; and the accessibility target. If the answers do not arrive, do the reversible removals only and stop before the commitments.

1. **Read the real sources** before touching anything: stylesheets, tokens, theme and Tailwind config, component files. Name the palette, the type scale, the spacing base, the radius and shadow treatments.
2. **Find which tells apply**, from the twelve in `choosing.md`. Quote the evidence: `file:line` and the actual value. A tell you cannot point at is not a finding.
3. **Separate the removals from the commitments.** Deleting a uniform hover-lift is reversible and needs no permission. Choosing a typeface is a commitment, and it needs the answers above.
4. **Make the removals.** Uniform entrance animation, hover-lift on every card, stacked shadows standing in for depth, decorative sparkle and rocket icons, the accent stripe on every callout. Removing a gesture applied everywhere costs nothing, because uniformity was the tell.
5. **Make one committed choice, and hold it everywhere.** A real typeface, an off-trend accent, an asymmetric grid, a deliberate radius. One is enough. Applying it consistently is what separates a designed interface from a restyled one.
6. **Hold the floor while you edit.** Every replaced colour gets its ratio measured at the worst point, every removed hover state leaves `:focus-visible` intact, and no motion removal breaks `prefers-reduced-motion` handling that was already there. A deslop that lowers contrast has failed.
7. **Report what changed**: the tell, the `file:line`, the old value, the new one, and the reason the new one is a decision rather than another default.

**Do not trade one default for another.** Indigo for emerald is not a decision. A purple gradient swapped for a teal gradient is the same interface. A bento grid rebuilt as three equal cards is the same interface. If the replacement could have been produced without knowing what the product is, it is still slop, and the honest move is to go back to the Ask-first answers.

Leave the interface consistent. A half-deslopped page, with the new accent on two components and the stock palette on the rest, reads worse than the generated version it replaced. If the scope is too large to finish, do fewer components completely rather than all of them partially, and say which ones are still untouched.
