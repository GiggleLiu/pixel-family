# PixelMan Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a Typst library that draws 5 pixel art characters using CeTZ with customizable colors

**Architecture:** Grid-based pixel rendering where characters are stored as 2D arrays of color indices and rendered using CeTZ rect() calls

**Tech Stack:** Typst, CeTZ 0.4.0, Tytanic (for testing)

---

## Prerequisites

- Typst installed
- CeTZ package available locally or via @preview
- Access to reference PNG images

---

## Project Structure

### Task 1: Initialize Project

**Step 1:** Create package manifest (typst.toml)
**Step 2:** Create main lib.typ file
**Step 3:** Create directory structure
**Step 4:** Initial commit

---

## Core Components

### Task 2: Pixel Grid Renderer (src/draw.typ)

**Purpose:** Core function that renders 2D pixel arrays as CeTZ rectangles

**Function signature:**
```typst
#let pixel-grid(data, palette, size)
```

**Parameters:**
- data: 2D array of integers (0=transparent, 1=skin, 2=hair, etc.)
- palette: array of colors
- size: output size

**Implementation steps:**
1. Calculate grid dimensions
2. Calculate pixel size
3. Iterate through data, draw rect() for each non-zero pixel
4. Flip Y coordinate so row 0 is at top

**Test:** Render simple 4x4 red diamond

---

### Task 3: Color Palette (src/palette.typ)

Define default colors for all characters:
- Skin tones (light, medium, dark)
- Hair colors (brown, blonde, black, red, green)
- Shirt colors (white, blue, pink, red, green, black)
- Pants colors (black, blue, gray)

Export as `defaults` dictionary for easy access.

---

## Character Implementation

### Task 4-8: Create 5 Characters

Each character follows the same pattern:

1. **Analyze reference PNG** (pixel1/001.png through 005.png)
2. **Create pixel data** as 16x16 array
3. **Define character function** with customizable colors
4. **Export from lib.typ**
5. **Test rendering**

**Characters:**
- Task 4: Bob (green hair, white shirt)
- Task 5: Alice (brown hair, blue shirt)
- Task 6: Christina (blonde hair, pink shirt)
- Task 7: Mary (black hair, red shirt)
- Task 8: Eve (red hair, green shirt)

**Function template:**
```typst
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

---

## Documentation

### Task 9: Create Manual

Create manual.typ with:
- Overview and installation
- Basic usage examples
- Character gallery showing all 5 characters
- Customization examples (different sizes, colors)

---

## Testing

### Task 10: Add Tests

Create tests/ directory with:
- Test each character renders without errors
- Test customization parameters work
- Test edge cases (small sizes, custom colors)

---

## File List

**To create:**
- typst.toml
- lib.typ
- src/draw.typ
- src/palette.typ
- src/characters/bob.typ
- src/characters/alice.typ
- src/characters/christina.typ
- src/characters/mary.typ
- src/characters/eve.typ
- manual.typ

**Reference files:**
- /Users/liujinguo/Documents/private-note/slides/matrix100/images/pixel1/001.png (Bob)
- /Users/liujinguo/Documents/private-note/slides/matrix100/images/pixel1/002.png (Alice)
- /Users/liujinguo/Documents/private-note/slides/matrix100/images/pixel2/003.png (Christina)
- /Users/liujinguo/Documents/private-note/slides/matrix100/images/pixel2/004.png (Mary)
- /Users/liujinguo/Documents/private-note/slides/matrix100/images/pixel2/005.png (Eve)

---

## Success Criteria

- All 5 characters render correctly as CeTZ drawings
- Each character supports size, skin, hair, shirt, pants customization
- API matches existing usage: #bob(), #alice(), etc.
- Characters look similar to original PNG references
- Manual documents basic usage
