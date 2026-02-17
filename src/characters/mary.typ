// PixelMan Character: Mary
// Black hair with red ribbons, white shirt with red bow

#import "../draw.typ": pixel-grid
#import "../palette.typ": defaults

// Mary pixel data (16x16 grid)
// 0 = transparent
// 1 = skin
// 2 = hair (black)
// 3 = shirt (white)
// 4 = pants (black)
// 5 = eyes (black)
// 6 = ribbons/bow (red)

#let mary-data = (
  // Hair (rows 0-3) with red ribbons
  (0, 6, 0, 0, 2, 2, 2, 2, 2, 2, 0, 0, 6, 0, 0, 0),
  (0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0),
  (0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0),
  (0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0),
  // Face (rows 4-7)
  (0, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 0, 0, 0),
  (0, 0, 2, 1, 1, 5, 1, 1, 5, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
  // Neck and upper body (rows 8-11) with red bow
  (0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 3, 3, 3, 3, 6, 3, 3, 3, 0, 0, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 6, 6, 6, 3, 3, 3, 0, 0, 0, 0),
  (0, 3, 3, 3, 3, 3, 3, 6, 3, 3, 3, 3, 3, 0, 0, 0),
  // Lower body (rows 12-15)
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
)

#let mary(
  size: 40pt,
  skin: defaults.skin,
  hair: defaults.hair-black,
  shirt: defaults.shirt-white,
  pants: defaults.pants-black,
) = {
  let palette = (none, skin, hair, shirt, pants, pants, shirt-red)
  pixel-grid(mary-data, palette, size)
}
