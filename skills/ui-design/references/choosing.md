# Choosing a Style, and the Floor Underneath

The decision layer. Which style fits which product, what none of them may trade away, and how to tell a considered interface from a generated one.

**Ask first (`AskUserQuestion`)**: sector and audience; accessibility target; platform;
existing brand constraints; and whether this is a page that ships next week or a system
maintained for years. Every row below changes with those answers.

## The decision table

| The constraint | Reach for | What it costs you |
|---|---|---|
| Trust must be signalled fast (finance, health, gov) | Flat and minimal, conventional patterns | Distinctiveness |
| The content is the product (reading, media, docs) | Minimalism | Nowhere to hide weak content |
| Information density is the requirement | Flat, tight spacing, no ornament | Warmth; it will look plain |
| The brand must be remembered from one visit | Maximalism, or neo-brutalism | Fatigue on repeat use; audit cost |
| Audience is developers or an indie market | Neo-brutalism | Reads wrong to enterprise buyers |
| Product is friendly, young, or educational | Claymorphism, contained to accents | Density; a register that fights seriousness |
| A real-world metaphor genuinely helps | Skeuomorphism on the controls only | Asset weight; poor scaling |
| Native Apple app on a current OS | Liquid Glass via system components | Platform lock; an OS floor |
| A floating layer over content you control | Glassmorphism, one layer | GPU cost; variable contrast |
| The task is genuinely spatial | Spatial UI | Comfort limits; short sessions |
| You want depth and a soft feel | Claymorphism, not neumorphism | Space; see the note below |

**Neumorphism is not in that table as a recommendation on purpose.** It fails the non-text contrast floor by construction, and claymorphism gets a similar softness while keeping the element a different colour from its background. If the user asks for it, say what it costs and offer the substitute. See `neumorphism.md`.

## The floor

These hold regardless of style. A style that cannot survive them is the finding, not a constraint to negotiate.

- **Text contrast**: 4.5:1 for body, 3:1 for large text (24px, or 19px bold). Over a gradient, a photo, or a translucent panel, measure the **worst** point, not an average.
- **Non-text contrast**: 3:1 for the boundary of any control and for meaningful graphics. This is the rule neumorphism breaks.
- **Visible focus**: every interactive element needs a `:focus-visible` indicator at 3:1 against what surrounds it. Deleting the focus ring because it clashes with the aesthetic is the single most common accessibility regression in styled interfaces.
- **Target size**: roughly 44px for touch. Style choices that shrink hit areas are style choices that break on phones.
- **Colour is never the only channel.** Error, success, selected, and required all need a second signal: an icon, text, or a shape.
- **Honour the system settings**: `prefers-reduced-motion`, `prefers-reduced-transparency`, `prefers-contrast`, and `prefers-color-scheme`. Each needs a real fallback that still reads correctly, not a degraded version of the effect.
- **Text stays selectable and scalable.** Text baked into images fails at every zoom level and to every screen reader.

## The generated look

A recognisable cluster of defaults now signals "nobody chose this". Treat each as a prompt to make a decision, not as forbidden:

1. **The purple-to-blue gradient hero**, usually diagonal, usually behind white text.
2. **Glass cards over that gradient**, often nested, with a soft outer glow.
3. **Three feature cards in a row**, each with a small outlined icon, a two-word heading, and two lines of body copy.
4. **Hover-lift on every card**, the same 4px translate and shadow bloom everywhere.
5. **One fade-up entrance animation** applied uniformly to every section on scroll.
6. **Sparkle and rocket iconography**, gradient-filled, standing in for "AI" and "fast".
7. **The default system sans at every weight**, with no typographic decision made at all.
8. **Everything centred**, because centring requires no layout judgement.
9. **The bento grid as a default**, a mosaic of unequal tiles laid out before anyone asked whether the content actually has unequal weight.
10. **Depth faked by stacking shadows**, three or four on one element, with no consistent light source and no elevation scale behind them.
11. **The coloured left-border callout**, a 4px accent stripe on every note, tip and warning, doing the job an icon and a label should do.
12. **The framework's stock palette shipped untouched**, `indigo-500` and `slate-900` straight from the config, which is the colour equivalent of tell 7.

The tell is uniformity: the same gesture applied everywhere rather than a few chosen for specific content. Two fixes carry most of the distance: **make one committed choice** (a real typeface, an off-trend accent, an asymmetric grid) and **vary the motion** so entrances fit what is entering.

Removing a tell is not the same as fixing it. Swapping the stock indigo for a stock emerald changes nothing, because neither was chosen. See `/uidesign:deslop` for the working order: reversible removals first, then one commitment held everywhere.

## How to actually decide

1. **Write the audience and the accessibility target down first.** Half the table resolves on those two lines.
2. **Shortlist two, not five.** Any style can be argued for; the shortlist is where the real thinking happens.
3. **Prototype the hardest screen, not the hero.** The densest table, the longest form, the error state. Styles fail there and look fine on a landing page.
4. **Measure the worst-case contrast** on that screen before committing.
5. **Commit and hold it.** A consistently applied second-choice style beats an inconsistently applied first choice every time.

## Mixing

Most real products are not one style. The combinations that work share a rule: **one style leads, the other is contained to a layer.**

- Minimal product plus maximalist marketing, held together by shared tokens.
- Flat structure plus claymorphic illustration in heroes and empty states.
- Conventional layout plus one skeuomorphic control where the metaphor pays.
- Minimal layout plus a single glass element that has a job to do.

The combinations that fail mix the depth models: glass over neumorphism, clay next to brutalist offsets, skeuomorphic texture behind flat cards. Two competing accounts of how light works in the same interface read as a mistake, because they are one.
