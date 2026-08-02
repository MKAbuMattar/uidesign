# Brutalism & Neo-Brutalism

Raw structure left visible. Hard black borders, offset solid shadows, clashing saturated colour, unapologetic type. The interface refuses to look smooth, and that refusal is the message.

**Ask first (`AskUserQuestion`)**: the sector, because trust-signalling industries
punish this hard; whether the audience is being asked to transact or to be impressed;
and whether the intensity of the palette is checked against users who find high-chroma
combinations uncomfortable.

## Two different things under one word

- **Brutalism** proper: the deliberately unstyled web. Default fonts, blue underlined links, visible HTML structure, no smoothing. A reaction against templated polish, usually personal or institutional.
- **Neo-brutalism**: the designed version, which is what most products mean today. Flat blocks, thick black outlines, hard offset shadows, bright clashing fills, and heavy grotesque type. Structured and quite systematic.

The second is far more useful in product work and is the rest of this file.

## The technique

Neo-brutalism is unusually easy to specify, which is part of why it scales well:

- **A hard border on everything.** Typically 2–3px, pure black, no radius or a small one. The border is the design.
- **A solid offset shadow, not a blur.** `box-shadow: 6px 6px 0 #000`. Blur is the thing this style rejects.
- **Flat saturated fills.** Full-strength primaries and secondaries. Pure black and pure white, both usually avoided elsewhere, are used freely.
- **Heavy grotesque type**, often oversized, tight, and set in blocks.
- **Visible geometry.** Rectangles stay rectangles, the grid is exposed, nothing is softened.

```css
.brut {
  background: #ffd93d;
  border: 3px solid #000;
  border-radius: 4px;
  box-shadow: 6px 6px 0 #000;
  font-weight: 700;
}
.brut:active { transform: translate(3px, 3px); box-shadow: 3px 3px 0 #000; }
```

That active state is the style's best feature: the button visibly moves into its own shadow, so press feedback is unmistakable without a single soft edge.

## What it gets right

**Contrast is usually excellent.** Black borders on saturated fills clear WCAG comfortably, and boundaries between controls are unambiguous. It is one of the few fashionable styles that helps accessibility rather than fighting it.

**Affordance is unmistakable.** Every control is outlined, filled, and shadowed. Nobody has to guess what is clickable, which is exactly where flat and neumorphic designs fail.

**It is cheap and it tokenises.** Border width, shadow offset, and a palette of flat colours. No gradients, no image assets, no blur compositing. It renders fast, it themes cleanly, and a component library built on it stays consistent.

## What it costs

**Register.** It reads as confident, young, and slightly aggressive. Wrong for a bank, a hospital, an insurer, or a government service, where users read visual convention as a proxy for reliability.

**Intensity.** High-chroma clashing colour is uncomfortable for some users, and can be genuinely aversive for people with sensory sensitivity or migraine. High contrast is not the same as comfortable. Give the eye neutral regions and avoid vibrating pairs, particularly saturated red on saturated blue or green.

**Density.** Thick borders and hard offsets need spacing. A dense table where every cell is outlined and shadowed becomes unreadable.

**It is now a template.** Yellow background, black border, offset shadow, one bold grotesque: this became recognisable extremely fast. The style resists differentiation because its rules are so few.

## When it fits

| Situation | Verdict |
|---|---|
| Developer tools, indie SaaS, side projects | Strong. The audience reads it as confident |
| Portfolios, studios, creative agencies | Strong |
| Marketing pages needing to stand out | Strong |
| Community and open-source projects | Works. Cheap to build and hard to make ugly |
| Banking, insurance, healthcare, government | No. Convention is a trust signal there |
| Dense data tools | No. Borders eat the space |

## Keeping it from looking like everyone else

Move off the defaults. Its cliche is narrow and specific: yellow or lime fill, pure black 3px border, 6px offset shadow, a single heavy grotesque. Change one structural thing and it becomes yours — a border colour that is very dark green rather than black, a shadow offset on one axis only, a serif for the display type, or a radius of zero when everyone else rounds to four.

Keep the good parts regardless: the hard boundary, the honest press state, the high contrast. Those are why the style works.
