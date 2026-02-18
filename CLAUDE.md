# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Pixel Family is a Typst package that renders 16x16 pixel art characters as inline vector graphics using CeTZ. Characters work like text — `#bob()` drops a pixel character into running text, sized at `1em` by default.

Package name: `pixel-family` (repo: GiggleLiu/pixel-family)

## Build & Test

```bash
# Compile the manual (serves as the test suite)
typst compile manual.typ manual.pdf

# Watch for changes during development
typst watch manual.typ manual.pdf
```

There is no separate test file — `manual.typ` exercises all characters, sizes, color customization, and skin tones.

## Architecture

**`lib.typ`** — Package entrypoint. Three concerns in order:
1. Color palette constants (skin tones, hair, shirt, pants) and a `palette` dictionary
2. `pixel-grid(data, colors)` — core renderer that turns a 2D array of color indices into CeTZ `draw.rect()` calls using unitless integer coordinates
3. Character function definitions that wrap `box(canvas(length: size / 16, { pixel-grid(...) }))` to produce inline content

**`characters/batch-1-initial.typ`** — Character pixel data, imported by `lib.typ` via `#import "characters/batch-1-initial.typ": *`. Each character exports:
- `xxx-data`: 16x16 array of color indices (0=transparent, 1=skin, 2=hair, 3=shirt, 4=pants, 5=eyes, 6+=accents)
- `xxx-colors(skin, hair, shirt, pants)`: function returning the color palette array for that character

This file has **no imports** — it is pure data. This avoids circular dependencies since `lib.typ` imports from it.

**Adding new characters:** Create a new batch file in `characters/` (e.g., `characters/batch-2-villains.typ`), add `xxx-data` and `xxx-colors` exports, then add an import and character function in `lib.typ`.

## Key Design Decisions

- Characters return `box(canvas(...))` so they are inline content, not block-level CeTZ draw commands
- Default `size: 1em` makes characters scale with surrounding text automatically
- `pixel-grid` uses unitless integer coordinates; the canvas `length: size / 16` parameter handles all scaling
- Color index 5 maps to `pants` color (reused for eyes/details since both are typically black)
- Accent colors (pocket red, clip yellow, tie green, ribbon red) are hardcoded in `xxx-colors()` functions, not exposed as parameters
- Dependency: `@preview/cetz:0.4.2`, compiler: Typst 0.13.1+
- Reference packages at `~/tcode/cetz` (CeTZ source) and `~/tcode/periodic-table` (style reference)
