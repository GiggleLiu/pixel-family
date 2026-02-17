// PixelMan Character: Bob
// Green hair, white shirt, black vest

#import "../draw.typ": pixel-grid
#import "../palette.typ": defaults

// Bob pixel data (16x16 grid)
// 0 = transparent
// 1 = skin
// 2 = hair (green)
// 3 = shirt (white)
// 4 = vest (black)
// 5 = eyes/mouth (black)

#let bob-data = (
  // Hair (rows 0-3)
  (0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0),
  (0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0),
  (0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0),
  // Face (rows 4-7)
  (0, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 0, 0, 0),
  (0, 0, 2, 1, 1, 5, 1, 1, 5, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0),
  (0, 0, 0, 1, 1, 1, 5, 5, 1, 1, 1, 0, 0, 0, 0, 0),
  // Neck and upper body (rows 8-11)
  (0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0, 0, 0, 0, 0, 0),
  (0, 0, 0, 4, 3, 3, 3, 3, 3, 3, 4, 0, 0, 0, 0, 0),
  (0, 0, 4, 4, 3, 3, 3, 3, 3, 3, 4, 4, 0, 0, 0, 0),
  (0, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 0, 0, 0),
  // Lower body (rows 12-15)
  (0, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 0, 0, 0),
  (0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
  (0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0),
)

// Bob character function
// Parameters:
// - size: Overall size of the character (default: 40pt)
// - skin: Skin color
// - hair: Hair color  
// - shirt: Shirt color
// - pants: Pants/vest color

#let bob(
  size: 40pt,
  skin: defaults.skin,
  hair: defaults.hair-green,
  shirt: defaults.shirt-white,
  pants: defaults.pants-black,
) = {
  // Build palette: index 0 is unused (transparent), 1=skin, 2=hair, 3=shirt, 4=pants
  let palette = (none, skin, hair, shirt, pants, pants)
  pixel-grid(bob-data, palette, size)
}
