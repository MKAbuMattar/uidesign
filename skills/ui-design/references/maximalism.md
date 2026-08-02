# Maximalism

Density, colour, pattern and ornament used on purpose. More type sizes, more layers, more texture: the surface itself carries meaning rather than getting out of the way.

**Ask first (`AskUserQuestion`)**: whether the brand can carry a loud voice; whether
the audience visits once or every day (maximalism wears badly under repeat use);
and the accessibility target, because this style multiplies the number of colour pairs
that have to be checked.

## What it actually is

Not "no rules". Maximalism keeps hierarchy and breaks uniformity. The discipline moves from *removing* elements to *organising* many, which is harder, not easier.

Its working parts:

- **A dominant type gesture.** Oversized display type, mixed families, or type set as image. Usually the loudest element on the page and the thing holding it together.
- **Layering.** Elements overlap, break the grid, and sit on top of each other rather than in tidy rows. Depth comes from occlusion, not shadow.
- **Full-strength colour.** Several saturated colours at once, often clashing on purpose, instead of one accent on neutrals.
- **Pattern and texture as background**, not as decoration between sections.
- **Motion and detail**: hover states that do something, cursors that change, elements that react.

The rule underneath: **one thing is still clearly first.** Every screen has a dominant element, and everything else is loud in second place. Lose that and it stops being maximalism and becomes noise.

## What it costs

**Accessibility work multiplies.** With a neutral palette and one accent, you check a handful of colour pairs. With six colours over patterned backgrounds, every combination that occurs is a pair to measure, and text over pattern must clear its worst point, not its average. Budget the audit time honestly.

**Cognitive load.** Rich surfaces are more work to parse. That is acceptable on a page someone visits once and fine for a portfolio or a campaign; it is punishing on a tool someone opens forty times a day. Fatigue is the deciding factor between the two.

**Motion sensitivity.** Layered movement and parallax are common here and trigger vestibular symptoms in a real share of users. `prefers-reduced-motion` must strip the movement and still leave a working page, not a broken one.

**Performance.** Large images, patterns, multiple typefaces, and layered effects add weight. On a slow connection the elaborate version arrives late and the fallback is often ugly rather than plain.

**Maintenance.** A style built on deliberate exceptions is hard to tokenise. Every new page is a design problem, not a composition of existing parts, so it scales with designer time rather than with a system.

## When it fits

| Situation | Verdict |
|---|---|
| Portfolios, agencies, studios | Strong. Distinctiveness is the product |
| Campaigns, launches, event sites | Strong. Short-lived and memorable is the goal |
| Fashion, music, media, editorial | Strong. Matches the sector's voice |
| Consumer brands fighting sameness | Works, contained to marketing pages |
| Daily-use tools and dashboards | No. Fatigue compounds |
| Finance, health, government, enterprise | No. The register fights the trust signal |

## The split that usually wins

Most products do not choose one. The durable pattern is **maximalist marketing, minimal product**: the landing page, the launch announcement and the empty states carry the voice, while the signed-in application stays quiet and dense so people can work.

The two are held together by shared tokens — the same typeface, the same accent, the same corner treatment — used at different volumes rather than by two unrelated design languages.

## Doing it without it becoming noise

1. **Fix the hierarchy first.** Decide the one dominant element per screen before adding any colour.
2. **Constrain something.** Loud colour with one typeface, or many typefaces on a restrained palette. Everything loud at once flattens into mush.
3. **Set the contrast floor before the palette**, not after. Pick colours that already pass, rather than auditing and repainting.
4. **Give the eye rest.** Even dense compositions need empty regions; they are what make the dense parts read as dense.
5. **Test at 320px.** Layered, overlapping, grid-breaking layouts are where responsive design actually breaks.

See `minimalism.md` for the other bet and `brutalism.md` for the adjacent style that gets loudness from raw structure rather than from ornament.
