# Huanma — Pose Redesign and API Consolidation

**Date:** 2026-05-03
**Branch:** `add-huanma-running-horses`
**Status:** Design — awaiting implementation

## Problem

The branch adds three running-horse character functions — `huanma`, `huanma-canter`, `huanma-prance` — plus a 3-frame GIF (`images/huanma-running.gif`). Visual review surfaces three issues:

1. **Per-frame anatomy is weak.** The head is a 1-pixel stub with no snout, ear, or jaw. The gallop only shows 2 of 4 hooves. The canter's legs read as falling sticks. There is no mane texture (the `hair` color is only used as outline, never as a distinct mane element).
2. **No shared anchor across frames.** The head, body center, and silhouette shift between the three poses, so the GIF cycle reads as the horse teleporting and resizing each tick rather than running through a stride.
3. **API surface is inflated.** Three public character functions for what is conceptually one character in three poses — most family members have a single pose.

## Goals

- Consolidate to **one** public character function: `huanma`.
- Add a `pose` argument to select between three running poses.
- Redesign the pixel art so that all three frames share a fixed head/torso/tail-base anchor, with only legs, tail tip, and particle-trail density varying per pose.
- Each pose has anatomically readable legs (4 hooves visible), a proper head (ear + eye + snout), and a `hair`-colored mane texture.
- The GIF cycle (`images/huanma-running.gif`) reads as a real running stride rather than three unrelated drawings.

## Non-goals

- Adding new horse characters or new poses beyond the three already in the branch.
- Changing the published palette or the `huanma-colors` signature.
- Backwards compatibility with `huanma-canter` / `huanma-prance` — both were added in this same un-released branch, no users to support.

## API design

A single function that dispatches on a `pose` string parameter:

```typst
#let huanma(
  size: 1em,
  baseline: auto,
  pose: "gallop",          // "gallop" | "canter" | "prance"
  skin: rgb("#e8e2f4"),    // body
  hair: rgb("#2f2f7f"),    // outline + mane
  shirt: rgb("#9b83ec"),   // particle trail
  pants: pants-black,      // hooves + eye
) = {
  let data = if pose == "gallop" { huanma-gallop-data }
             else if pose == "canter" { huanma-canter-data }
             else if pose == "prance" { huanma-prance-data }
             else { panic("huanma: unknown pose '" + pose + "'") }
  _char-box(size, baseline, data, huanma-colors(skin, hair, shirt, pants))
}
```

- Default `pose: "gallop"` — the iconic running pose.
- Unknown `pose` strings panic with the offending value (the only validation in this codebase).
- `huanma-canter` and `huanma-prance` are removed from `lib.typ`. Breaking change, but the branch is un-released.

## Pixel design — shared anchor

All three poses keep rows 1–9 (head, neck, torso, mane, tail base, belly outline) byte-identical. Only rows 10–13 (legs + lower tail tip) and the particle-trail pixels (color index 6) vary.

### Color index map (unchanged)

```
0 = transparent
1 = body (skin param,  default lavender #e8e2f4)
2 = outline + mane     (hair param,  default indigo #2f2f7f)
4 = hooves             (pants param, default black)
5 = eye                (pants param, default black)
6 = particle trail     (shirt param, default violet #9b83ec)
```

`huanma-colors` returns: `(none, skin, hair, shirt, pants, pants, shirt)` — same as today.

### Shared anatomy block (rows 1–9)

Indicative ASCII layout — exact pixels iterated during implementation against rendered SVG/PNG output. The structure must produce:

- **Head (rows 1–4, cols 10–15)**: ear pixel at (row 1, col 12); skull cap at row 2 cols 11–14; eye (color 5) at (row 3, col 13); snout extending to col 15 at rows 3–4; jaw outline closing at row 5.
- **Neck + mane (rows 5–6, cols 5–10)**: outline along top of neck doubled with an inner row of color 2 to read as a mane tuft, distinct from the body outline silhouette.
- **Torso (rows 6–8, cols 4–12)**: rounded back, narrower than the original gallop design (frees up vertical room for legs and a real tail).
- **Tail base (rows 6–8, cols 2–4)**: connected outline curve attached at the haunch (row 6, col 4), flowing down-left. Color 2, not color 6 — the violet trail is for motion particles, not for the tail itself.
- **Belly outline (row 9, cols 4–11)**: the floor that legs hang from. Identical in every frame so legs can be diffed cleanly.

### Per-pose deltas (rows 10–13 + trail)

| Pose | Front legs | Back legs | Tail tip | Particle trail |
|---|---|---|---|---|
| **gallop** | extended forward, reaching right (cols 11–13) | extended back, reaching left (cols 4–6) | flat-flowing left, low | dense streak behind back hooves, fading bottom-left |
| **canter** | one tucked under body, one reaching (cols 9–11) | one planted, one bent under (cols 4–7) | mid-arc, slight curl | medium density, more scattered |
| **prance** | both lifted high (rows 9–10) | both planted (rows 11–13) | lifted and curled upward | sparse — the horse just left the ground, less dust |

**Hard requirement:** every frame shows 4 distinct hooves (color 4). The current gallop only shows 2.

**Trail discipline:** color-6 pixels form a recognizable comet-tail shape behind the back hooves rather than scattered all over the left half of the canvas. The trail's anchor (where it emerges from the body) stays roughly constant across frames; only its density and tail length vary.

## Files to change

| File | Change |
|---|---|
| `characters/batch-6-horses.typ` | Rewrite. Three data arrays `huanma-gallop-data`, `huanma-canter-data`, `huanma-prance-data` sharing the new anchor. Single `huanma-colors` function (unchanged signature). |
| `lib.typ` | Replace three character functions with one `huanma(pose: ...)` function dispatching on the pose string. Remove `huanma-canter` and `huanma-prance` exports. |
| `images/render.typ` | Collapse three gallery entries to one: `(huanma, "Huanma")`. Gallery shows the default gallop pose only. |
| `images/huanma-running-frames.typ` | Update to call `huanma.with(pose: ...)` for each frame. |
| `images/huanma-running.gif` | Regenerate after pixel iteration is settled. |
| `manual.typ` | Collapse three character sections to one "Huanma" section that shows all three poses inline (`#huanma() #huanma(pose: "canter") #huanma(pose: "prance")`). Update title-bar, API table, and the "fifty characters" line (becomes "forty-eight": 47 baseline + 1 merged Huanma). |

## Testing

- **`make test`** — installs the local package and compiles `manual.typ`. If it compiles, the API is wired correctly.
- **`make images`** — regenerates `images/gallery.svg`. Visually inspect that the new Huanma reads as a horse at gallery scale.
- **GIF regeneration** — recompile `images/huanma-running-frames.typ` to PNGs, assemble into `images/huanma-running.gif`, visually confirm the cycle looks like a stride rather than a teleport.
- **Manual visual check** — render the manual to PDF and confirm the Huanma section displays all three poses correctly inline.

## Risks and open questions

- **Pixel iteration is inherently visual.** The ASCII anchor in this spec is structural; the implementer will iterate actual pixel placements against rendered output until the silhouette reads. This is normal pixel-art workflow, not a process gap.
- **Stride continuity at small sizes.** At 1em (~12pt) inline, the leg differences between gallop / canter / prance will be subtle. The animation cycle is most legible at the GIF's 192pt size. Acceptable — the inline use is for sentences like "Huanma delivered the message", where any single frame is fine.
- **Mane vs outline collision.** The mane texture uses the same color index as the outline (`hair` / index 2). If a user passes a custom `hair` color, the mane and the outline both change together — this is by design and consistent with how other family characters reuse colors.
