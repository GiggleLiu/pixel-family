// PixelMan - Core pixel rendering engine
// Renders 2D pixel arrays as CeTZ rectangles

#import "@preview/cetz:0.4.0": draw

// Render a pixel grid using CeTZ
// 
// Parameters:
// - data: 2D array of color indices (0 = transparent, 1+ = colors from palette)
// - palette: array of colors where palette[0] is ignored, palette[1+] are used
// - size: output size (square)
//
// Example:
//   let data = ((0, 1, 0), (1, 1, 1), (0, 1, 0))
//   let palette = (none, red)
//   pixel-grid(data, palette, 3cm)  // Draws a red diamond

#let pixel-grid(data, palette, size) = {
  // Get grid dimensions
  let rows = data.len()
  let cols = if rows > 0 { data.at(0).len() } else { 0 }
  
  // Calculate pixel size to fit within requested size
  let max-dim = calc.max(rows, cols)
  let pixel-size = size / max-dim
  
  // Draw each non-transparent pixel
  for (row-idx, row) in data.enumerate() {
    for (col-idx, color-idx) in row.enumerate() {
      // Check if pixel should be drawn (non-zero and valid palette index)
      if color-idx > 0 and color-idx < palette.len() {
        // Calculate position
        // Flip Y so row 0 is at the top
        let x = col-idx * pixel-size
        let y = (rows - row-idx - 1) * pixel-size
        
        // Draw the pixel as a rectangle
        draw.rect(
          (x, y),
          (x + pixel-size, y + pixel-size),
          fill: palette.at(color-idx),
          stroke: none
        )
      }
    }
  }
}
