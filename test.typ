// Test file for PixelMan library

#import "lib.typ": *

= Inline Usage

Default size (1em) — characters scale with text:

Hello #bob() and #alice() are here with #christina(), #mary(), and #eve()!

#text(size: 20pt)[Bigger text: #bob() #alice() #eve()]

#text(size: 8pt)[Tiny text: #bob() #alice() #eve()]

= Explicit Sizes

#bob(size: 1cm) #alice(size: 2cm) #christina(size: 3cm) #mary(size: 4cm) #eve(size: 5cm)

= Color Customization

#bob(size: 3cm, hair: blue, shirt: red)
#alice(size: 3cm, hair: black, shirt: green)
#eve(size: 3cm, hair: rgb("#ff69b4"), shirt: rgb("#ffd700"))

= All Characters Gallery

#for char in (bob, alice, christina, mary, eve) {
  char(size: 4cm)
}
