// Render Huanma running frames for GIF assembly.
// Compile:
// typst compile --root . --format png --ppi 96 images/huanma-running-frames.typ /tmp/huanma-running-frame-{p}.png

#import "../lib.typ": huanma

#set page(width: 192pt, height: 192pt, margin: 0pt, fill: white)

#let render-frame(pose) = align(center + horizon, huanma(size: 192pt, baseline: 0pt, pose: pose))

#render-frame("gallop")
#pagebreak()
#render-frame("canter")
#pagebreak()
#render-frame("prance")
