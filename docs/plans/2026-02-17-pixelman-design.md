# PixelMan Library Design

**Date:** 2026-02-17  
**Status:** Approved  
**Approach:** Grid-based pixel rendering with CeTZ

## Overview

A Typst library for drawing pixel art characters using CeTZ (instead of external PNG images). This makes documents self-contained with vector-based characters that scale perfectly.

## Goals

- Recreate pixel art characters as native CeTZ drawings
- Support 5 MVP characters with customizable colors
- Provide simple function-based API (`#bob()`, `#alice()`, etc.)
- Design for future extensibility (more characters, poses, accessories)

## Architecture

```
pixelman/
├── lib.typ              # Main export, re-exports all characters
├── src/
│   ├── draw.typ         # Core pixel rendering engine
│   ├── palette.typ      # Default color definitions
│   └── characters/
│       ├── bob.typ      # Character definitions
│       ├── alice.typ
│       ├── christina.typ
│       ├── mary.typ
│       └── eve.typ
├── manual.typ           # Usage documentation and examples
└── typst.toml          # Package manifest
```

## Design Decisions

### Rendering Approach: Grid-Based Pixels

**Chosen:** Store characters as 2D arrays of color indices, render each non-zero pixel as a small rectangle using `rect()`.

**Pros:**
- True to pixel art aesthetic
- Easy to edit/create characters
- Simple mental model
- Pixel-perfect output

**Trade-offs:**
- Many draw calls (one per pixel)
- Acceptable for small character sets, may need optimization for 40+ characters

### Character Format

Each character stored as a 2D array where:
- `0` = transparent (no pixel)
- `1` = skin
- `2` = hair
- `3` = shirt
- `4` = pants

Example (8x8 grid):
```typ
#let bob-data = (
  (0, 0, 2, 2, 2, 2, 0, 0),
  (0, 2, 2, 2, 2, 2, 2, 0),
  (0, 2, 1, 1, 1, 1, 2, 0),
  ...
)
```

### API Design

**Function-based:** Direct calls like `#bob()`, `#alice()`

**Parameters (per character):**
- `size` (length): Overall size, default 40pt
- `skin` (color): Skin tone, default per-character
- `hair` (color): Hair color, default per-character
- `shirt` (color): Shirt color, default per-character
- `pants` (color): Pants color, default per-character

**Usage:**
```typ
#import "@local/pixelman:0.1.0": *

#bob()
#alice(size: 30pt)
#eve(skin: brown, hair: red, shirt: green)
```

## Component Specifications

### 1. Core Renderer (`src/draw.typ`)

```typ
#let pixel-grid(data, palette, size) = {
  // Input: 2D array of color indices, palette array, output size
  // Output: CeTZ canvas with scaled pixel grid
  
  // Algorithm:
  // 1. Calculate pixel size: size / grid-dimension
  // 2. Iterate through data rows (y) and columns (x)
  // 3. For each non-zero index: draw rect((x, y), (x+1, y+1))
  // 4. Apply fill color from palette[index]
  // 5. Wrap in canvas with appropriate length scaling
}
```

**Error handling:**
- Validate palette has colors for all indices used in data
- Handle empty/zero data gracefully

### 2. Default Palette (`src/palette.typ`)

```typ
#let defaults = (
  skin: rgb("#d4a373"),
  hair-brown: rgb("#5c4033"),
  hair-blonde: rgb("#e6c229"),
  hair-black: rgb("#1a1a1a"),
  hair-red: rgb("#c73e1d"),
  hair-green: rgb("#2d5016"),
  shirt-white: white,
  shirt-blue: rgb("#4a90e2"),
  shirt-pink: rgb("#ffb6c1"),
  shirt-red: rgb("#e74c3c"),
  shirt-green: rgb("#27ae60"),
  pants-black: black,
  pants-blue: rgb("#2c3e50"),
)
```

### 3. Character Definitions

Each character file exports one function:

```typ
// src/characters/bob.typ
#import "../draw.typ": pixel-grid
#import "../palette.typ": defaults

#let bob-data = (
  // 2D array defining Bob's pixel pattern
)

#let bob(
  size: 40pt,
  skin: defaults.skin,
  hair: defaults.hair-green,
  shirt: defaults.shirt-white,
  pants: defaults.pants-black,
) = {
  let palette = (none, skin, hair, shirt, pants)
  pixel-grid(bob-data, palette, size)
}
```

### 4. Main Library (`lib.typ`)

```typ
#import "src/characters/bob.typ": bob
#import "src/characters/alice.typ": alice
#import "src/characters/christina.typ": christina
#import "src/characters/mary.typ": mary
#import "src/characters/eve.typ": eve

// Re-export all characters
#let bob = bob
#let alice = alice
#let christina = christina
#let mary = mary
#let eve = eve
```

## MVP Characters

Five characters from the original set:

1. **Bob** - green hair, white shirt
2. **Alice** - brown hair, blue shirt
3. **Christina** - blonde hair, pink shirt
4. **Mary** - black hair, red shirt
5. **Eve** - red hair, green shirt

Each character will be reverse-engineered from the original PNG images to create the pixel data arrays.

## Data Flow

```
User calls: #bob(size: 40pt, skin: brown)
           ↓
Character function:
- Merge defaults with user params
- Build palette: [transparent, brown, green, white, black]
           ↓
Call pixel-grid(data, palette, 40pt)
           ↓
Renderer:
- Calculate pixel-size = 40pt / 8 = 5pt (for 8x8 grid)
- For each non-zero cell at (x,y): draw rect((x*5pt, y*5pt), ((x+1)*5pt, (y+1)*5pt))
- Wrap in canvas
           ↓
Output: Vector-based pixel art character
```

## Testing Strategy

1. **Visual regression:** Generate all 5 characters at default size and colors
2. **Customization:** Test each color parameter individually
3. **Edge cases:** 
   - Very small sizes (10pt)
   - Large sizes (100pt)
   - Custom colors
4. **Comparison:** Side-by-side with original PNG images to verify accuracy

## Future Extensibility

The architecture supports:
- **More characters:** Add new `.typ` files in `src/characters/`
- **Customization:** Already built-in via color parameters
- **Poses:** Could extend data format to include multiple pose arrays
- **Accessories:** Add more color indices (5=glasses, 6=hat, etc.)
- **Optimization:** Can later implement rectangle merging for fewer draw calls

## Package Metadata

```toml
# typst.toml
[package]
name = "pixelman"
version = "0.1.0"
entrypoint = "lib.typ"
authors = ["@pixel-man-creator"]
license = "MIT"
description = "Pixel art characters drawn with CeTZ"
repository = "https://github.com/.../pixelman"
keywords = ["cetz", "pixel", "character", "avatar"]
categories = ["components"]
compiler = "0.13.0"
```

## Open Questions

None - design approved for implementation.

## References

- Original implementation: `/Users/liujinguo/Documents/private-note/slides/matrix100/characters.typ`
- CeTZ library: `~/tcode/cetz`
- Typst drawing reference: `/Users/liujinguo/Documents/private-note/notes/typst-learn/typst-drawing.typ`
