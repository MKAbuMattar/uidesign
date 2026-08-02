# Liquid Glass

Apple's system material: a layer that bends and refracts what is behind it, picks up colour from its surroundings, and reacts to touch and motion, rather than simply blurring a backdrop.

**Ask first (`AskUserQuestion`)**: which platforms are targeted (this is a native
material, and imitating it on the web is a different project with a different budget);
whether the app uses standard system components or custom-drawn controls; and the
minimum OS version supported, because the fallback path is most of the work.

## What separates it from plain glassmorphism

Web glassmorphism is a blur plus a tint plus a border, and it is static. Apple's material is dynamic:

- **Refraction, not just blur.** Edges bend the content behind them the way a lens does, so the layer reads as a physical piece of glass with thickness rather than a frosted pane.
- **It adapts to its surroundings.** The material samples what is behind and beside it and shifts its own tint and brightness, so a control stays legible as the user scrolls different content beneath it.
- **It responds to input and motion.** Highlights track movement; the material has elastic behaviour on interaction.
- **It is a system layer.** Navigation, tab bars, sheets, and controls float on it above the content layer, which is what gives the OS its consistent sense of hierarchy.

The practical consequence: **use the system components.** When you adopt the standard controls you get the material, its variants, and every accessibility behaviour without writing any of it. Hand-drawn approximations get the look and none of the adaptivity.

## Accessibility comes with it

The reason to use the real material rather than imitate it is that the settings are already wired:

- **Reduce Transparency** makes the material frostier and hides more of what is behind it.
- **Increase Contrast** turns elements predominantly black or white and adds a contrasting border.
- **Reduce Motion** lowers the intensity of the effects and disables the elastic behaviour.

These apply automatically when you use the material. A custom imitation has to detect and implement all three, and almost none do.

## What it costs

- **Platform lock.** It is an Apple material. A cross-platform product either uses it on Apple and something else elsewhere, accepting divergence, or does not use it and accepts looking non-native.
- **OS floor.** Older versions do not have it. You maintain two visual paths until you can drop them, and the older path is not simply the new one minus the blur.
- **Design assumptions.** The material presumes a floating control layer over a scrolling content layer. Layouts built on opaque bars and edge-to-edge sections often need restructuring, not just restyling.
- **Custom controls lose.** Every hand-built control is one that will not pick up the material or its accessibility behaviours, so heavily customised apps benefit least.
- **Contrast is still variable.** Adaptivity reduces the problem but does not remove it. Custom content behind a system layer still needs checking, especially imagery.

## When it fits

| Situation | Verdict |
|---|---|
| Native Apple app on current OS, standard controls | Strong. Adopt the system components and stop |
| Apple app that must feel current | Strong, once you can require the OS version |
| Cross-platform app with a shared design language | Careful. Divergence, or nothing |
| Web trying to reproduce the effect | Weak. See below |
| Heavily custom-drawn app UI | Weak. You pay the cost and skip the benefit |

## About reproducing it on the web

You can approximate the look with layered `backdrop-filter`, SVG displacement maps for the edge refraction, and a lot of tuning. Three things to weigh before starting:

1. **Cost.** Displacement filters and stacked backdrop blurs are heavy to composite. This is a measurable frame-rate and battery decision on mid-range phones, not a stylistic one.
2. **Adaptivity is the hard part.** The look is easy; the material staying legible over arbitrary content is where the real engineering is, and the web has no equivalent primitive.
3. **The settings are on you.** `prefers-reduced-transparency`, `prefers-contrast` and `prefers-reduced-motion` all have to be handled by hand, and the fallback must be an opaque surface that still reads correctly.

If you take it on, treat it as one hero element rather than a whole interface, and see `glassmorphism.md` for the underlying technique and its contrast trap.
