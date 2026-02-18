# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Pixel Family — a Typst package (`pixel-family`) that renders 16x16 pixel art characters as inline vector graphics via CeTZ.

Repo: GiggleLiu/pixel-family. Dependency: `@preview/cetz:0.4.2`. Compiler: Typst 0.13.1+.

## Commands

```bash
make              # compile manual + render SVGs
make manual       # compile manual.pdf only
make images       # render character SVGs into images/
make install      # install to local Typst packages (~/.local/share/typst/packages/local/)
make uninstall    # remove local package
make test         # install + compile manual (the test suite)
make clean        # remove generated files
typst watch manual.typ manual.pdf  # live reload during development
```

There is no separate test file — `manual.typ` exercises all characters, sizes, colors, and skin tones. If it compiles, everything works.

## Architecture

**`lib.typ`** — Package entrypoint. In order:
1. Color palette constants and `palette` dictionary
2. `pixel-grid(data, colors)` — core renderer: 2D color-index array → CeTZ `draw.rect()` calls
3. `_char-box(size, baseline, data, colors)` — helper wrapping pixel-grid into inline `box(canvas(...))`
4. Character function definitions (one per character, all share the same signature)

**`characters/batch-*.typ`** — Pure data files (no imports). Each character exports:
- `xxx-data`: 16x16 array of color indices (0=transparent, 1=skin, 2=hair, 3=shirt, 4=pants, 5=eyes, 6+=accents)
- `xxx-colors(skin, hair, shirt, pants)`: returns the color palette array

Three batches: `batch-1-initial.typ` (full-body: Bob, Alice, Christina, Mary, Eve), `batch-2-top.typ` (bust: Frank, Grace, Trent, Mallory, Victor), `batch-3-top.typ` (bust: Ina, Murphy, Bella).

**`images/render.typ`** — Renders each character on its own page for SVG export. Not part of the published package.

**`manual.typ`** — Documentation + test suite. Not part of the published package.

## Adding a Character

1. Add `xxx-data` and `xxx-colors` to the appropriate `characters/batch-*.typ` (or create a new batch file)
2. In `lib.typ`: import the batch file (if new), add a character function using `_char-box`
3. In `images/render.typ`: add a page for the new character
4. In `Makefile`: add the name to `CHARACTERS` and a rename line in the `$(SVGS)` target
5. In `manual.typ`: add bio section, update title page, update API table
6. In `README.md`: add to the gallery table
7. Run `make test` to verify

## Key Design Decisions

- `baseline: auto` centers characters with text via `(size - 1em) / 2`; pass `0pt` for bottom alignment
- `pixel-grid` uses unitless integer coordinates; `canvas(length: size / 16)` handles scaling
- Color index 5 maps to `pants` color (reused for eyes/details — both typically black)
- Accent colors (pin, glasses, flower, etc.) are hardcoded in `xxx-colors()`, not exposed as parameters
- Batch files are pure data with no imports to avoid circular dependencies
- `typst.toml` excludes images/, manual.*, Makefile, CLAUDE.md, .github/* from the published package

## Reference

- CeTZ source: `~/tcode/cetz`
- Pixel art reference: `~/tcode/pixel-people.typ` (Brave Workz LINE Store)
- Style reference: `~/tcode/periodic-table`
