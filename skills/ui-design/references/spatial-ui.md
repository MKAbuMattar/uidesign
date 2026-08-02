# Spatial & Immersive UI

Interfaces placed in three-dimensional space rather than on a screen: headset, mixed reality, and augmented reality. Depth becomes a real axis, the body becomes the input, and comfort becomes a design constraint.

**Ask first (`AskUserQuestion`)**: the device and its input model (gaze and pinch, hand
tracking, controllers, phone AR); whether content is anchored to the world, to a
surface, or to the user; and session length, because everything about comfort changes
between two minutes and two hours.

## What actually changes from 2D

- **Depth is a real axis, and it is expensive.** On a screen, "depth" is a shadow. Here it is distance, and distance costs eye focus. Every layer at a different depth is a refocus. Use depth for genuine hierarchy — a dialog in front of its parent — not for decoration.
- **The user moves.** They lean, turn, and walk. A layout that reads at one angle skews at another, so panels should face the viewer rather than sit at a fixed world rotation, unless being world-fixed is the point.
- **There is no pixel.** Size is angular: how much of the field of view a thing occupies. An element specified in pixels means nothing until you also fix its distance. Text and targets must be sized for the angle they subtend, so pushing a panel further away means scaling it up, not just moving it.
- **The background is unknown.** In passthrough or AR, your interface sits over the user's real room, which may be a white wall or a bookshelf in sunlight. This is the glassmorphism contrast problem with no way to measure the backdrop, so any text needs its own opaque or heavily-frosted backing.
- **Comfort is a hard constraint.** Content placed too close strains convergence. Content requiring sustained upward gaze causes neck fatigue quickly; slightly below eye level is the restful zone. Anything demanding constant head rotation is a design failure, not an immersive feature.

## Placement

Think in a seated arc rather than a canvas:

- **Primary content sits near the centre of the field of view**, at roughly arm's length to a couple of metres, slightly below eye height.
- **Secondary content goes to the sides**, reachable with a small head turn, never requiring a full body turn to see a required control.
- **Do not fill the peripheral field.** Peripheral vision is motion-sensitive; movement out there reads as something approaching and is a common source of discomfort.
- **Anchor deliberately.** World-anchored content stays where you put it and is right for objects; head-anchored content follows the user and is right for system controls but becomes oppressive if overused; surface-anchored content is right for anything meant to belong to a table or a wall.

## Input

Gaze plus pinch is the dominant model on modern headsets, and it changes the target rules:

- **Targets must be larger than on a touchscreen**, because gaze is less precise than a fingertip and drifts.
- **Hover has to be visible.** With gaze, the user needs to know what is currently targeted before they commit, so a clear highlight on the gazed element is not optional.
- **Spacing matters more than size.** Adjacent targets cause mis-selection even when each is individually large enough.
- **Direct touch works only within actual reach.** Anything beyond arm's length must be operable indirectly.
- **Hands and controllers both need a resting state.** Sustained arm elevation is exhausting within minutes; design for arms down.

## Type and contrast

- **Bigger and heavier than you expect.** Thin weights disintegrate under headset rendering and chromatic fringing; prefer regular and medium over light.
- **Avoid long-form reading in space** unless the product is a reader. Text at distance in a moving field is tiring.
- **Give text its own background.** Text directly over passthrough is unreadable the moment the room changes.
- **Motion sensitivity is a safety matter, not a preference.** Honour reduced-motion settings, avoid moving the whole field of view under anything but user control, and never take the camera away from the user.

## When it fits

| Situation | Verdict |
|---|---|
| Spatial tasks: 3D modelling, layout, training, medical | Strong. The extra axis carries real information |
| Product visualisation in the user's own space | Strong |
| Multi-window productivity on a headset | Works. Follow the platform's window model |
| A 2D app "brought into 3D" for novelty | No. It is worse than the flat version |
| Long reading or dense data entry | No. Comfort runs out first |

## The recurring mistake

Treating the room as a canvas and floating panels everywhere. Immersion is not quantity of interface; it is the interface being where the task is. Most successful spatial designs use very few surfaces, place them within a comfortable arc, and let the real world be most of the view. If the design would work as well on a flat display, that is a signal the extra axis is not earning its cost.
