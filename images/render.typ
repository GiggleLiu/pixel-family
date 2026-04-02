// Render all characters as a single gallery page for SVG export
#import "../lib.typ": *

#let sz = 64pt
#let cols = 8

#let characters = (
  (bob, "Bob"), (alice, "Alice"), (christina, "Christina"), (mary, "Mary"), (eve, "Eve"),
  (frank, "Frank"), (grace, "Grace"), (trent, "Trent"), (mallory, "Mallory"), (victor, "Victor"),
  (ina, "Ina"), (murphy, "Murphy"), (bella, "Bella"),
  (bolt, "Bolt"), (pixel-char, "Pixel"), (crank, "Crank"), (nova, "Nova"), (sentinel, "Sentinel"),
  (alien, "Alien"), (seraphim, "Seraphim"), (shamir, "Shamir"), (steve, "Steve"), (yui, "Yui"),
  (logic, "Logic"), (tabby, "Tabby"), (schrodinger, "Schrödinger"), (enaga, "Enaga"), (noir, "Noir"),
  (milady, "Milady"), (tigris, "Tigris"), (porcellum, "Porcellum"), (lain, "Lain"), (dragon, "Dragon"),
  (paddler, "Paddler"), (chaser, "Chaser"), (alchemist, "Alchemist"), (hongyuan, "Hong Yuan"), (fox, "Fox"),
  (tuxedo, "Tuxedo"), (climber, "Climber"), (sleeper, "Sleeper"), (astronaut, "Astronaut"), (arpes, "ARPES"),
  (echo, "Echo"), (meteor-rex, "Meteor Rex"), (dirac, "Dirac"), (split-phase, "Split-Phase"),
)

#set page(width: auto, height: auto, margin: 10pt, fill: none)
#set text(size: 11pt)

#grid(
  columns: (90pt,) * cols,
  column-gutter: 8pt,
  row-gutter: 12pt,
  ..characters.map(((func, name)) => align(center, stack(
    dir: ttb,
    spacing: 4pt,
    func(size: sz, baseline: 0pt),
    name,
  )))
)
