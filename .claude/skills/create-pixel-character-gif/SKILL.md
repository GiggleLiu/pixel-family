---
name: create-pixel-character-gif
description: Use when Codex needs to animate Typst pixel-art character functions into a looping GIF, especially in pixel-family-style packages with 16x16 inline vector sprites, generated frame sheets, or ImageMagick/Typst GIF assembly.
---

# Create Pixel Character GIF

## Overview

Create looping GIFs from Typst pixel-character functions by rendering one Typst page per animation frame, then assembling the PNG frames with ImageMagick.

Use the bundled script for repeatability. It handles Typst's root constraint by generating a temporary Typst frame source inside the repo before compiling frames.

## Workflow

1. Identify the Typst entrypoint exporting the character functions, usually `lib.typ`.
2. Choose the frame functions in animation order, for example `huanma huanma-canter huanma-prance`.
3. Run `scripts/render_pixel_character_gif.py` from this skill.
4. Visually verify the result. For non-animated previews, coalesce to a strip:
   ```bash
   magick images/character-running.gif -coalesce +append /tmp/character-running-strip.png
   ```
5. If the GIF is project-bound, commit the GIF and optionally commit a small render source or command note so it can be regenerated.

## Script

```bash
python /path/to/create-pixel-character-gif/scripts/render_pixel_character_gif.py \
  --repo /path/to/repo \
  --typst-file lib.typ \
  --output images/huanma-running.gif \
  --functions huanma huanma-canter huanma-prance \
  --save-source images/huanma-running-frames.typ
```

Defaults:
- frame size: `192pt`
- raster output: 256x256 at `96` PPI
- cadence: ping-pong (`1, 2, 3, 2`) for three frames
- delay: `10` centiseconds
- loop: forever
- page background: `white`

Use `--no-ping-pong` when frames already include the full loop.

## Requirements

Install and verify:

```bash
typst --version
magick -version
```

If `typst compile --root` fails with "source file must be contained in project root", do not compile a Typst source from `/tmp`; create the frame source inside the repo or use the bundled script.
