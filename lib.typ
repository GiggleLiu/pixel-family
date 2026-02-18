// PixelMan - Pixel art characters for Typst
// Inline pixel characters that can be inserted into text like a UTF-8 character
//
// Usage:
//   #import "@preview/pixelman:0.1.0": bob, alice, eve
//   Hello #bob() and #alice() and #eve()!

#import "@preview/cetz:0.4.2": canvas, draw

// === Color Palette ===

#let skin-default = rgb("#e8b8a0")
#let skin-light = rgb("#f5d5c2")
#let skin-medium = rgb("#c6865c")
#let skin-dark = rgb("#8d5524")

#let hair-brown = rgb("#5c4033")
#let hair-blonde = rgb("#e6c229")
#let hair-black = rgb("#1a1a1a")
#let hair-red = rgb("#c73e1d")
#let hair-green = rgb("#2d5016")

#let shirt-white = white
#let shirt-blue = rgb("#4a90e2")
#let shirt-pink = rgb("#ffb6c1")
#let shirt-red = rgb("#e74c3c")
#let shirt-green = rgb("#27ae60")
#let shirt-black = black

#let pants-black = black
#let pants-blue = rgb("#2c3e50")
#let pants-gray = rgb("#7f8c8d")

#let palette = (
  skin: skin-default,
  skin-light: skin-light,
  skin-medium: skin-medium,
  skin-dark: skin-dark,
  hair-brown: hair-brown,
  hair-blonde: hair-blonde,
  hair-black: hair-black,
  hair-red: hair-red,
  hair-green: hair-green,
  shirt-white: shirt-white,
  shirt-blue: shirt-blue,
  shirt-pink: shirt-pink,
  shirt-red: shirt-red,
  shirt-green: shirt-green,
  shirt-black: shirt-black,
  pants-black: pants-black,
  pants-blue: pants-blue,
  pants-gray: pants-gray,
)

// === Pixel Grid Renderer ===

/// Render a 2D pixel array as CeTZ rectangles (draw commands, for use inside canvas).
/// Coordinates are unitless integers; use canvas `length` to control output size.
///
/// - data (array): 2D array of color indices (0 = transparent)
/// - colors (array): color palette where colors.at(index) gives the fill color
/// -> CeTZ draw commands
#let pixel-grid(data, colors) = {
  let rows = data.len()
  for (row-idx, row) in data.enumerate() {
    for (col-idx, color-idx) in row.enumerate() {
      if color-idx > 0 and color-idx < colors.len() {
        let x = col-idx
        let y = rows - row-idx - 1
        draw.rect(
          (x, y), (x + 1, y + 1),
          fill: colors.at(color-idx),
          stroke: none,
        )
      }
    }
  }
}

// === Character Data (16x16 grids) ===
// 0 = transparent, 1+ = palette index

#let bob-data = (
  (0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0),
  (0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0),
  (0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0),
  (0, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 0, 0, 0),
  (0, 0, 2, 1, 1, 5, 1, 1, 5, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 0, 1, 1, 1, 5, 5, 1, 1, 1, 0, 0, 0, 0, 0),
  (0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 4, 3, 3, 3, 3, 3, 3, 4, 0, 0, 0, 0, 0),
  (0, 0, 4, 4, 3, 3, 3, 3, 3, 3, 4, 4, 0, 0, 0, 0),
  (0, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 0, 0, 0),
  (0, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
)

#let alice-data = (
  (0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0),
  (0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0),
  (0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0),
  (0, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 0, 0, 0),
  (0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 2, 1, 1, 5, 1, 1, 5, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 0, 1, 5, 5, 5, 5, 1, 1, 1, 0, 0, 0, 0, 0),
  (0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 0, 0, 0, 0),
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
)

#let christina-data = (
  (0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0),
  (0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 6, 0, 0, 0, 0),
  (0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0),
  (0, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 0, 0, 0),
  (0, 0, 2, 1, 1, 5, 1, 1, 5, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
  (0, 0, 0, 0, 1, 1, 3, 3, 7, 1, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 3, 3, 3, 3, 3, 7, 3, 3, 0, 0, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
)

#let mary-data = (
  (0, 6, 0, 0, 2, 2, 2, 2, 2, 2, 0, 0, 6, 0, 0, 0),
  (0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0),
  (0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0),
  (0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0),
  (0, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 0, 0, 0),
  (0, 0, 2, 1, 1, 5, 1, 1, 5, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
  (0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 3, 3, 3, 3, 6, 3, 3, 3, 0, 0, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 6, 6, 6, 3, 3, 3, 0, 0, 0, 0),
  (0, 3, 3, 3, 3, 3, 3, 6, 3, 3, 3, 3, 3, 0, 0, 0),
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
)

#let eve-data = (
  (0, 2, 2, 0, 0, 2, 2, 2, 2, 0, 0, 2, 2, 0, 0, 0),
  (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0),
  (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0),
  (0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0),
  (0, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 0, 0, 0),
  (0, 0, 2, 1, 1, 5, 1, 1, 5, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
  (0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
)

// === Character Functions ===
// Each returns inline content — use like #bob() in running text.

/// Bob: green hair, white shirt, black vest
///
/// - size (length): character height (default: 1em, scales with text)
/// - skin (color): skin tone
/// - hair (color): hair color
/// - shirt (color): shirt color
/// - pants (color): vest/pants color
/// -> content
#let bob(
  size: 1em,
  skin: skin-default,
  hair: hair-green,
  shirt: shirt-white,
  pants: pants-black,
) = box(canvas(length: size / 16, {
  let colors = (none, skin, hair, shirt, pants, pants)
  pixel-grid(bob-data, colors)
}))

/// Alice: brown hair, white shirt, red pocket, mustache
///
/// - size (length): character height (default: 1em, scales with text)
/// - skin (color): skin tone
/// - hair (color): hair color
/// - shirt (color): shirt color
/// - pants (color): pants color
/// -> content
#let alice(
  size: 1em,
  skin: skin-default,
  hair: hair-brown,
  shirt: shirt-white,
  pants: pants-black,
) = box(canvas(length: size / 16, {
  let colors = (none, skin, hair, shirt, pants, pants, shirt-red)
  pixel-grid(alice-data, colors)
}))

/// Christina: purple hair with yellow accessory, green tie
///
/// - size (length): character height (default: 1em, scales with text)
/// - skin (color): skin tone
/// - hair (color): hair color
/// - shirt (color): shirt color
/// - pants (color): pants color
/// -> content
#let christina(
  size: 1em,
  skin: skin-default,
  hair: rgb("#8b5a9f"),
  shirt: shirt-white,
  pants: pants-black,
) = box(canvas(length: size / 16, {
  let colors = (none, skin, hair, shirt, pants, pants, rgb("#f1c40f"), shirt-green)
  pixel-grid(christina-data, colors)
}))

/// Mary: black hair with red ribbons, red bow
///
/// - size (length): character height (default: 1em, scales with text)
/// - skin (color): skin tone
/// - hair (color): hair color
/// - shirt (color): shirt color
/// - pants (color): pants color
/// -> content
#let mary(
  size: 1em,
  skin: skin-default,
  hair: hair-black,
  shirt: shirt-white,
  pants: pants-black,
) = box(canvas(length: size / 16, {
  let colors = (none, skin, hair, shirt, pants, pants, shirt-red)
  pixel-grid(mary-data, colors)
}))

/// Eve: red curly hair, green shirt
///
/// - size (length): character height (default: 1em, scales with text)
/// - skin (color): skin tone
/// - hair (color): hair color
/// - shirt (color): shirt color
/// - pants (color): pants color
/// -> content
#let eve(
  size: 1em,
  skin: skin-default,
  hair: hair-red,
  shirt: shirt-green,
  pants: pants-black,
) = box(canvas(length: size / 16, {
  let colors = (none, skin, hair, shirt, pants, pants)
  pixel-grid(eve-data, colors)
}))
