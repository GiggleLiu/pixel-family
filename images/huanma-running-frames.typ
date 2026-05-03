// Render Huanma running frames for GIF assembly.
// Compile:
// typst compile --root . --format png --ppi 96 images/huanma-running-frames.typ /tmp/huanma-running-frame-{p}.png

#import "../lib.typ": huanma, huanma-canter, huanma-prance

#set page(width: 192pt, height: 192pt, margin: 0pt, fill: white)

#let render-frame(char) = align(center + horizon, char(size: 192pt, baseline: 0pt))

#render-frame(huanma)
#pagebreak()
#render-frame(huanma-canter)
#pagebreak()
#render-frame(huanma-prance)
