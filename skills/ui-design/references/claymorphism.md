# Claymorphism

Inflated, soft-plastic shapes: heavily rounded forms that look pressed out of modelling clay, lifted off the background by a large coloured shadow and rounded further by inner highlights.

**Ask first (`AskUserQuestion`)**: whether a friendly, playful register suits the
product (it is loud, and wrong for serious sectors); the palette, because this style
needs mid-tone colour and dies on pure black or white; and whether it applies to the
whole interface or only the illustration layer.

## The technique

Two shadows outward and two inward, and the geometry is exaggerated:

- **A large outer shadow**, tinted with the element's own hue rather than grey, offset mainly on Y. Bigger and softer than a conventional elevation shadow, because the object is meant to hover.
- **Two inner shadows**: a lighter one top-left, a darker one bottom-right, which round the face and stop the shape reading flat.
- **Corner radius past the point of comfort.** Well beyond the usual 8–16px; often close to half the shorter side, so the form reads as inflated rather than merely rounded.
- **Mid-tone colour, never pure black or white.** The inner shadows need headroom on both sides to be visible at all, which is also why the style struggles in true dark mode.

```css
.clay {
  background: #6c5ce7;
  border-radius: 42px;
  box-shadow:
    0 22px 44px rgba(108, 92, 231, 0.35),
    inset  6px  6px 12px rgba(255, 255, 255, 0.28),
    inset -6px -6px 12px rgba(0, 0, 0, 0.18);
}
```

The shapes themselves are often pushed past a rectangle: corner points dragged outward into a squircle or a blob. That is vector work, not CSS, so complex forms ship as SVG.

## Why it survives where neumorphism does not

The two look related and behave oppositely on the thing that matters. Neumorphism makes the element **the same colour as the background** and reads depth only from soft shadows, which destroys contrast. Claymorphism makes the element **a different colour**, lifts it clear of the background, and uses the shadows for roundness rather than for the boundary.

That single difference restores the 3:1 non-text contrast a control needs. Claymorphism can pass an accessibility audit; neumorphism generally cannot. See `neumorphism.md`.

## What it costs

- **Register.** It reads as friendly, young, and unserious. That is an asset for education, kids' products, wellness, and community apps, and a liability for anything asking to be trusted with money, health, or law.
- **Density.** Huge radii and huge shadows need space around them. It does not survive a dense table or a compact toolbar, and it forces a lower information density than the same layout would otherwise carry.
- **Dark mode.** Inner highlights need a surface bright enough to lift and darken. On near-black surfaces the effect disappears and you are left with flat blobs.
- **Text on the shape.** Saturated mid-tone fills often land between the ratios that work with white text and with black text. Pick the fill from the text colour, not the other way round.
- **Sameness.** Purple-to-pink gradient blobs with oversized radii are a recognisable template. Choosing the palette off-trend does more for distinctiveness than any amount of shadow tuning.

## When it fits

| Situation | Verdict |
|---|---|
| Education, kids, learning products | Strong |
| Wellness, habit tracking, community | Strong |
| Marketing pages and illustration layers | Works; contain it to the hero |
| Consumer onboarding and empty states | Works as an accent |
| Finance, health records, legal, enterprise | No. The register fights the trust signal |
| Dense dashboards and data tables | No. It needs space it cannot get |

## Practical advice

Contain it. The most durable use is claymorphic **illustration and accent shapes** on an otherwise conventional layout: the personality lands in the hero and the empty states, while the forms, tables and navigation stay legible and dense. Applying the treatment to every control is where products get slow to read and hard to scale.

Keep the accent colours strong and the typography plain. Clay shapes plus a rounded display face plus pastel everything reads as a template; clay shapes plus a disciplined grotesque and one confident accent reads as a brand.
