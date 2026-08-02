# Skeuomorphism

An interface that imitates a real object: stitched leather, brushed metal, a paper page, a physical switch that looks like it would click. Affordance borrowed from something the user already knows how to operate.

**Ask first (`AskUserQuestion`)**: whether the audience already knows the physical
object being imitated; whether the metaphor extends to every state or only the resting
one; and the asset budget, because texture is expensive to produce and to ship.

## What it is actually for

The argument was never decoration. It was **affordance**: a control shaped like a switch tells a first-time user it can be flipped, without a label or a tutorial. That was worth a great deal when touchscreens were new and nobody had learned the vocabulary.

Most of that debt is now paid. A flat rectangle with a label is understood as a button by anyone who has used a phone, so imitation buys less than it did. What survives is narrower and still real:

- **Domain metaphors that carry information.** A drum machine laid out as a drum machine, a mixing desk with faders, a calculator with a physical key grid. The metaphor is not nostalgia; it maps to a mental model the user already has and speeds them up.
- **Onboarding for people outside software culture.** Medical, industrial, agricultural, and older-adult contexts where the physical tool is the shared reference.
- **Signalling craft.** Texture and material read as effort, which is why premium and hobbyist products keep it.

## The technique

- **Material, not decoration.** A gradient stands in for a curved surface catching light; a shadow stands in for elevation. Both should be consistent with a single light source, or the object stops reading as an object.
- **Texture at a legible scale.** Noise, grain, or weave should be visible without dominating. Texture behind text is where this style most often turns unreadable.
- **Depth on the control, not the layout.** Bevel the switch, not the page.
- **Every state stays in the metaphor.** A pressed key looks depressed; a disabled key looks inert, not merely faded. A metaphor that only holds at rest is worse than none, because it sets an expectation and then breaks it.

## What it costs

- **Asset weight.** Textures and multi-layer shadows mean bitmaps, and bitmaps mean resolution variants, file size, and a redraw for every theme. Flat and minimal styles render from tokens; this one often cannot.
- **Scaling.** A texture tuned at one size looks muddy at another. Responsive layouts and arbitrary zoom fight it.
- **Contrast.** Text on brushed metal or paper grain is text on a noisy background. Measure the ratio against the darkest and lightest points of the texture, not its average.
- **Maintenance.** Adding a control later means matching the material, which is much harder than matching a token.
- **Dating.** The style is legible about its era. Done carelessly it reads as an old product rather than a crafted one.

## When it fits

| Situation | Verdict |
|---|---|
| Music, audio, or instrument software | Strong. The metaphor is the interface |
| Reading, notes, journaling with a paper metaphor | Works if the texture stays behind the text, not under it |
| Industrial, medical, or field tools mirroring hardware | Strong. Users arrive with the model already |
| Games and playful consumer apps | Works; the material sets the tone |
| Productivity, dashboards, dense data | No. Weight and noise buy nothing |
| A design system spanning many products | No. It does not tokenise or scale |

## The middle ground

Most products that want warmth do not want full skeuomorphism. The workable compromise is a flat structure with **one material cue**: a real shadow to establish elevation, a subtle paper or noise texture at low opacity on the page background, or a single tactile control where the metaphor genuinely helps. That buys the humanity without the asset pipeline.

The current revivals mostly work this way. Liquid Glass (`liquid-glass.md`) is a material simulation with no object being imitated; claymorphism (`claymorphism.md`) simulates a substance rather than a thing. Both take skeuomorphism's physics and drop its literalism.
