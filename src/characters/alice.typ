// PixelMan Character: Alice
// Brown/gray hair, white shirt with red pocket

#import "../draw.typ": pixel-grid
#import "../palette.typ": defaults

// Alice pixel data (16x16 grid)
// 0 = transparent
// 1 = skin
// 2 = hair (brown/gray)
// 3 = shirt (white)
// 4 = pants (black)
// 5 = facial hair/details (dark)
// 6 = pocket (red)

#let alice-data = (
  // Hair (rows 0-3)
  (0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0),
  (0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0),
  (0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0),
  // Face (rows 4-7)
  (0, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 0, 0, 0),
  (0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 2, 1, 1, 5, 1, 1, 5, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 0, 1, 5, 5, 5, 5, 1, 1, 1, 0, 0, 0, 0, 0),
  // Neck and upper body (rows 8-11)
  (0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 0, 0, 0, 0),
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  // Lower body (rows 12-15)
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
)

#let alice(
  size: 40pt,
  skin: defaults.skin,
  hair: defaults.hair-brown,
  shirt: defaults.shirt-white,
  pants: defaults.pants-black,
) = {
  let palette = (none, skin, hair, shirt, pants, pants, shirt-red)
  pixel-grid(alice-data, palette, size)
}
