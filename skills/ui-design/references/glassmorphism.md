# Glassmorphism

Frosted translucency: a panel that blurs and tints whatever sits behind it, so the layer above reads as glass over content.

**Ask first (`AskUserQuestion`)**: what sits behind the panel (a controlled gradient, or
user-supplied photos you cannot predict); the contrast target; whether the platform
gives you the material natively or you are rebuilding it; and whether the audience
includes low-vision users, because this is the style that fails them first.

## The technique

Three properties, and all three have to be present or it reads as a plain tinted box:

- **Backdrop blur**: the background is blurred, not the element. In CSS that is `backdrop-filter: blur(N)`, not `filter`. Getting this wrong is the most common implementation bug.
- **Partial fill**: a translucent background, typically 8–20% white on dark surfaces or 40–70% white on light ones.
- **A border**: a 1px hairline at higher opacity than the fill, usually on the top and left, standing in for a lit edge.

```css
.glass {
  background: rgba(255, 255, 255, 0.10);
  backdrop-filter: blur(16px) saturate(140%);
  -webkit-backdrop-filter: blur(16px) saturate(140%);
  border: 1px solid rgba(255, 255, 255, 0.22);
  border-radius: 16px;
}
```

Blur radius does the heavy lifting. Under about 8px the background stays identifiable and competes with the text; the busier the backdrop, the higher the blur has to go. Add `saturate()` to stop the blur washing the colour out.

## What it costs

**Contrast is not a constant.** This is the whole problem. Text on a translucent panel sits over whatever is behind it, so the ratio changes as the background changes, and a panel that measures 7:1 over the dark part of a photo can measure 2:1 forty pixels to the right. Checking one screenshot proves nothing.

Measure the worst case, not a representative one. If the backdrop is user-supplied, you cannot measure it at all, and the only safe answers are a much higher blur, a solid scrim under the text, or a different style.

**It is expensive to composite.** `backdrop-filter` forces the browser to rasterise what is behind the element and re-blur it on every frame the region changes. A blurred panel over an animating or scrolling background is a reliable way to drop frames on mid-range phones, and it drains battery. One or two panels, fine. A blurred header over a blurred sidebar over a blurred card, and you are paying three times.

**Support is uneven.** Older browsers and some embedded webviews ignore `backdrop-filter` entirely, and the panel degrades to a nearly invisible 10% white box with unreadable text. Always ship a fallback:

```css
@supports not (backdrop-filter: blur(1px)) {
  .glass { background: rgba(20, 24, 31, 0.92); }
}
```

## Honour the accessibility settings

The operating system already lets people turn this off, and ignoring that is the difference between a style and a barrier:

```css
@media (prefers-reduced-transparency: reduce) {
  .glass { background: var(--surface-solid); backdrop-filter: none; }
}
@media (prefers-contrast: more) {
  .glass { background: var(--surface-solid); border-color: var(--text); }
}
```

Both should collapse the panel to an opaque surface. If your layout only reads correctly with the blur present, the layout is the defect.

## When it fits

| Situation | Verdict |
|---|---|
| Panel over a controlled gradient or solid you own | Works; measure once, ship it |
| Overlay on a headset or mixed-reality surface | Strongest case; depth genuinely aids spatial understanding |
| A single floating layer over a photo you control | Works with high blur plus a scrim behind text |
| Panel over user-uploaded images | No. The contrast is unknowable |
| Dense data, tables, long-form reading | No. Every character pays for the effect |
| Nested glass on glass | No. Depth stops reading and cost multiplies |

The platform versions (Apple's materials, Microsoft's Fluent acrylic) are worth using where available: they already handle the accessibility settings, they are tuned per platform, and they composite through paths a web page cannot reach. See `liquid-glass.md` for Apple's current material, which supersedes plain glass on that platform.

## The cliche warning

Glassmorphism over a purple-to-blue gradient, with a rounded card and a soft glow, is the single most recognisable machine-generated interface of the last few years. It is not wrong, it is just unowned: it says nothing about the product because it appeared identically on ten thousand others.

If you use it, earn it. Make the material do something the design needs — separate a floating control from a live map, show that a panel is temporary and the content continues beneath it — rather than applying it because it looks modern. If the panel would work as a solid surface, use the solid surface.
