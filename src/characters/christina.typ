// PixelMan Character: Christina
// Purple hair with yellow accessory, white shirt with green tie

#import "../draw.typ": pixel-grid
#import "../palette.typ": defaults

// Christina pixel data (16x16 grid)
// 0 = transparent
// 1 = skin
// 2 = hair (purple)
// 3 = shirt (white)
// 4 = pants (black)
// 5 = eyes (black)
// 6 = hair accessory (yellow)
// 7 = tie (green)

#let christina-data = (
  // Hair (rows 0-3)
  (0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0),
  (0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 6, 0, 0, 0, 0),
  (0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0),
  // Face (rows 4-7)
  (0, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 0, 0, 0),
  (0, 0, 2, 1, 1, 5, 1, 1, 5, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
  // Neck and upper body (rows 8-11)
  (0, 0, 0, 0, 1, 1, 3, 3, 7, 1, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 3, 3, 3, 3, 3, 7, 3, 3, 0, 0, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  // Lower body (rows 12-15)
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
)

#let christina(
  size: 40pt,
  skin: defaults.skin,
  hair: rgb("#8b5a9f"),  // Purple
  shirt: defaults.shirt-white,
  pants: defaults.pants-black,
) = {
  let palette = (none, skin, hair, shirt, pants, pants, rgb("#f1c40f"), defaults.shirt-green)
  pixel-grid(christina-data, palette, size)
}
