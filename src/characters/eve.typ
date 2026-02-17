// PixelMan Character: Eve
// Red/pink curly hair, blue/green top

#import "../draw.typ": pixel-grid
#import "../palette.typ": defaults

// Eve pixel data (16x16 grid)
// 0 = transparent
// 1 = skin
// 2 = hair (red/pink)
// 3 = shirt (green/blue)
// 4 = pants (black)
// 5 = eyes (black)

#let eve-data = (
  // Curly hair (rows 0-3)
  (0, 2, 2, 0, 0, 2, 2, 2, 2, 0, 0, 2, 2, 0, 0, 0),
  (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0),
  (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0),
  (0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0),
  // Face (rows 4-7)
  (0, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 0, 0, 0),
  (0, 0, 2, 1, 1, 5, 1, 1, 5, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
  // Neck and upper body (rows 8-11)
  (0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  // Lower body (rows 12-15)
  (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
)

#let eve(
  size: 40pt,
  skin: defaults.skin,
  hair: defaults.hair-red,
  shirt: defaults.shirt-green,
  pants: defaults.pants-black,
) = {
  let palette = (none, skin, hair, shirt, pants, pants)
  pixel-grid(eve-data, palette, size)
}
