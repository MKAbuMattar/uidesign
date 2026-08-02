# Neumorphism

Elements extruded from the background rather than floating above it: same colour as the surface, shaped by a light shadow on one side and a dark one on the other, as if the surface were pressed out or pushed in.

**Ask first (`AskUserQuestion`)**: whether the interface has interactive controls at all
(this style is worst exactly there); the contrast target; and whether the product can
afford a look that many users cannot operate. For most products the honest answer is a
different style, so ask before building toward it.

## The technique

The rule that defines it: **the element and the background are the same colour.** Depth comes only from two shadows sharing one light source.

```css
:root { --surface: #e0e5ec; }

.raised {
  background: var(--surface);
  border-radius: 20px;
  box-shadow:  9px  9px 18px rgba(163, 177, 198, 0.60),
              -9px -9px 18px rgba(255, 255, 255, 0.90);
}
.pressed {
  background: var(--surface);
  border-radius: 20px;
  box-shadow: inset  6px  6px 12px rgba(163, 177, 198, 0.60),
              inset -6px -6px 12px rgba(255, 255, 255, 0.90);
}
```

Constraints that are not optional:

- **The background cannot be pure white or pure black.** A light shadow needs room above the base colour and a dark one needs room below. Mid-tone greys around `#e0e5ec`, or a desaturated tint, are the working range.
- **One light source, usually top-left.** Every shadow on the screen points the same way, or the surface stops reading as a surface.
- **Generous corner radius.** Sharp corners break the extrusion illusion; the softness is the whole effect.

Inner shadows read as recessed, so they are the natural treatment for inputs. Outer shadows read as raised, so they suit cards and buttons.

## What it costs

**Contrast, and it is fatal.** A control the same colour as its background has, by definition, no colour contrast against it. The only boundary is a soft shadow, which is not a contrast ratio and does not satisfy WCAG's requirement that a control's boundary be distinguishable. Non-text contrast (1.4.11) asks for 3:1 on the element boundary. A neumorphic button typically measures well under 1.5:1.

**Interactive state is nearly impossible.** The style has two states — raised and pressed — and they are the same colour. Disabled, hovered, focused, selected, invalid, and loading all have to be expressed within a narrow band of shadow, and users cannot tell them apart. A button that is disabled looks like a button that is enabled.

**Discoverability collapses.** Nothing announces itself as clickable. Users have to guess which soft rectangles are controls, and on a dense screen many of them guess wrong.

**Focus rings fight it.** The one thing that would fix discoverability, a visible focus outline, is a hard-edged high-contrast ring, which is aesthetically the opposite of the style. Designers routinely delete it. Do not.

## The verdict

| Situation | Verdict |
|---|---|
| A showcase, a concept piece, a personal site | Works. The look is the product |
| One or two controls in a mostly conventional layout | Workable with a real focus ring and a text label |
| A music player, thermostat, or hardware-mimicking control | Its strongest genuine case |
| Forms, dashboards, anything transactional | No |
| Any product with an accessibility obligation | No |

The honest summary: neumorphism is a beautiful surface treatment and a poor control system. Use it for the surfaces and use something else for the controls — a solid fill or a border on interactive elements — and you keep most of the look without the failure.

If you ship it anyway, three non-negotiables: a real `:focus-visible` ring at 3:1 against the surface, a text label on every control rather than icon-only, and a hover or active state that changes something other than shadow depth.

## Against its neighbours

- **Versus skeuomorphism**: skeuomorphism imitates a specific real object with texture and material; neumorphism imitates only the physics of a soft surface, with no texture at all.
- **Versus claymorphism**: same soft-plastic family, opposite geometry. Claymorphism inflates shapes off the background with strong outer shadows and keeps them a different colour, which restores the contrast neumorphism gives up. See `claymorphism.md`.
- **Versus flat**: flat abandoned depth to gain clarity; this reintroduces depth and hands the clarity back.
