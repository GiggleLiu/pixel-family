// Test file for PixelMan library
// Tests basic rendering of all characters

#import "lib.typ": *
#import "@preview/cetz:0.4.0": canvas

= Basic Rendering Test

== All Characters at Default Size

#canvas(length: 1cm, {
  bob(size: 3cm)
  alice(size: 3cm)
  christina(size: 3cm)
  mary(size: 3cm)
  eve(size: 3cm)
})

== Size Variations

#canvas(length: 1cm, {
  bob(size: 1.5cm)
  bob(size: 3cm)
  bob(size: 4.5cm)
})

== Color Customization

#canvas(length: 1cm, {
  bob(size: 3cm, hair: blue, shirt: red)
  alice(size: 3cm, hair: black, shirt: green)
  eve(size: 3cm, hair: rgb("#ff69b4"), shirt: rgb("#ffd700"))
})

== Individual Characters

Bob:
#canvas(length: 1cm, { bob(size: 4cm) })

Alice:  
#canvas(length: 1cm, { alice(size: 4cm) })

Christina:
#canvas(length: 1cm, { christina(size: 4cm) })

Mary:
#canvas(length: 1cm, { mary(size: 4cm) })

Eve:
#canvas(length: 1cm, { eve(size: 4cm) })
