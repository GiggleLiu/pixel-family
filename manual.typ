// Pixel Family Manual

#import "lib.typ": *

#set page(margin: 2cm)
#set heading(numbering: "1.")
#set text(font: "New Computer Modern")

#align(center)[
  #text(size: 28pt, weight: "bold")[
    #bob(size: 28pt) #alice(size: 28pt) #christina(size: 28pt) #mary(size: 28pt) #eve(size: 28pt)
    #frank(size: 28pt) #grace(size: 28pt) #trent(size: 28pt) #mallory(size: 28pt) #victor(size: 28pt)
    #ina(size: 28pt) #murphy(size: 28pt) #bella(size: 28pt)
  ]
  #v(4pt)
  #text(size: 24pt, weight: "bold")[The Pixel Family]
  #v(4pt)
  #text(size: 12pt, fill: luma(40%))[Inline pixel characters for Typst]
]

#v(1em)

#outline(indent: auto)

= Introduction

The Pixel Family is a cast of thirteen characters drawn as 16x16 pixel art, rendered natively as vector graphics with CeTZ. They are designed to be used *inline* --- drop them into running text just like a letter or emoji.

Their names are no coincidence. In the world of cryptography, Alice and Bob are the classic pair who exchange secret messages, Eve is the infamous eavesdropper, and the rest of the cast has grown from there. Here, they've settled down into a pixelated neighborhood.

#v(0.5em)
#align(center, text(size: 20pt)[
  Hello #bob(size: 20pt) and #alice(size: 20pt), watch out for #eve(size: 20pt)!
  \
  #frank(size: 20pt) forged a pass, but #victor(size: 20pt) caught him.
  \
  #ina(size: 20pt) analyzed the logs, #murphy(size: 20pt) tested the fix, and #bella(size: 20pt) announced it.
])

= Meet the Family

#let card(name, char, size: 4cm, body) = {
  grid(
    columns: (size + 1cm, 1fr),
    column-gutter: 1em,
    align(center + horizon, char(size: size)),
    body,
  )
}

== #bob(size: 12pt) Bob --- The Messenger

#card("Bob", bob)[
  *Signature look:* Green hair, white shirt, black vest.

  Bob is the eternal optimist. He believes every message will arrive safely, every handshake will complete, and every key exchange will go smoothly. His green hair is the result of a "minor lab accident" that he now considers a fashion statement.

  As the classic *sender* in every cryptographic protocol, Bob spends his days composing plaintext and wrapping it in layers of encryption. He and Alice have exchanged so many messages that they finish each other's ciphertexts.

  _Hobbies:_ Collecting vintage modems, rooftop gardening, writing letters nobody asked for.
]

== #alice(size: 12pt) Alice --- The Decoder

#card("Alice", alice)[
  *Signature look:* Brown hair, white shirt, red pocket, distinguished mustache.

  Alice is the brains of the operation. Her mustache is legendary --- some say it helps her think; she says it filters out bad entropy. The red pocket on her shirt always holds a folded piece of paper: her current private key, written in pencil so she can rotate it.

  As the *receiver*, Alice can decrypt anything Bob sends and spot a forged signature at twenty paces. She trusts math more than people, which is why she gets along so well with Bob --- their relationship is purely transactional.

  _Hobbies:_ Sudoku speedruns, lockpicking, cataloguing prime numbers.
]

== #christina(size: 12pt) Christina --- The Architect

#card("Christina", christina)[
  *Signature look:* Purple hair, yellow hair clip, white shirt, green tie.

  Christina designs the protocols that everyone else follows. Her purple hair changes shade depending on her mood (or so she claims --- nobody has proven it). The yellow clip holds back the ideas that would otherwise spill out everywhere.

  She is the *protocol designer*, the one who draws boxes and arrows on whiteboards and turns them into provably secure schemes. When Alice and Bob have a problem, they call Christina. When Christina has a problem, she draws another diagram.

  _Hobbies:_ Origami, competitive Scrabble, inventing card games with too many rules.
]

== #mary(size: 12pt) Mary --- The Auditor

#card("Mary", mary)[
  *Signature look:* Black hair with red ribbons, white shirt, red bow.

  Mary keeps everyone honest. Her red ribbons are not just decorative --- they're a reminder that every system has loose ends that need tying up. She reviews every protocol Christina designs, tests every message Bob sends, and double-checks every key Alice generates.

  As the *auditor*, Mary is meticulous to a fault. She once rejected a 256-bit key because it "looked too symmetric." Her desk is immaculate. Her code has zero warnings. Her commit messages are haiku.

  _Hobbies:_ Bonsai pruning, calligraphy, finding edge cases in board game rulebooks.
]

== #eve(size: 12pt) Eve --- The Eavesdropper

#card("Eve", eve)[
  *Signature look:* Red curly hair, green shirt.

  Eve is always listening. Her wild red curls act as natural antennas (she insists this is scientifically plausible). She doesn't mean any harm --- she's just *curious*. Every conversation is a puzzle, every encrypted channel a challenge.

  As the classic *eavesdropper*, Eve sits between Alice and Bob on every network diagram. She has tried man-in-the-middle attacks, replay attacks, and once just asked Bob for his password (it almost worked). Despite her reputation, she's the life of every party.

  _Hobbies:_ Amateur radio, reading other people's horoscopes, competitive crosswords.
]

== #frank(size: 12pt) Frank --- The Forger

#card("Frank", frank)[
  *Signature look:* Top hat with red band, sideburns, mustache, bowtie.

  Frank is a gentleman of questionable ethics. His top hat is always immaculate, his bowtie always straight, and his digital signatures always... almost right. He has forged more certificates than he can count, and he counts very well.

  As the classic *forger*, Frank specializes in creating messages that appear to come from someone else. He has impersonated Bob so convincingly that even Alice was fooled --- for exactly one round of the protocol. Christina has designed three schemes specifically to stop him. He considers this a compliment.

  _Hobbies:_ Calligraphy, vintage typewriter collecting, magic tricks involving cards that aren't his.
]

== #grace(size: 12pt) Grace --- The Authority

#card("Grace", grace)[
  *Signature look:* Blonde updo, gold necklace, blue blouse.

  Grace is the certificate authority everyone trusts --- or has to. Her elegant bun keeps things tidy on top, just like she keeps the public key infrastructure tidy underneath. The gold necklace is a chain of trust made literal.

  As the *certificate authority*, Grace signs the keys that make the whole system work. When Alice needs to verify Bob's identity, she asks Grace. When Frank tries to forge a certificate, Grace's signature is the wall he can't climb. She takes her role seriously --- she hasn't taken a vacation since RSA was published.

  _Hobbies:_ Notary public (for fun), genealogy, maintaining very long lists.
]

== #trent(size: 12pt) Trent --- The Trusted Third Party

#card("Trent", trent)[
  *Signature look:* Balding head, distinguished beard, jacket over shirt.

  Trent has been in the game longer than anyone. His receding hairline is a map of every protocol he's arbitrated; his beard contains the wisdom of a thousand key exchanges. He wears a jacket because *someone* has to look professional around here.

  As the *trusted third party*, Trent mediates disputes, holds escrow keys, and timestamps everything. Both Alice and Bob trust him, which is remarkable given that they barely trust each other. He has never leaked a secret, though he has forgotten where he put a few.

  _Hobbies:_ Chess (correspondence only), pipe smoking (unlit), reading arbitration law for pleasure.
]

== #mallory(size: 12pt) Mallory --- The Attacker

#card("Mallory", mallory)[
  *Signature look:* Dark hoodie with hood up, hidden face.

  Nobody knows what Mallory looks like --- that's the point. The hood is always up, the hoodie always dark, and the kangaroo pocket always holds something suspicious. Unlike Eve, who merely listens, Mallory *acts*. Modify a message in transit? Inject a packet? Redirect a connection? All in a day's work.

  As the *active attacker*, Mallory is the reason protocols need to be formally verified. She once rewrote an entire TLS handshake mid-flight just to see if she could (she could). Christina designed her most complex protocol specifically because of Mallory. Mallory framed it.

  _Hobbies:_ Lockpicking, social engineering workshops, writing exploit code that rhymes.
]

== #victor(size: 12pt) Victor --- The Verifier

#card("Victor", victor)[
  *Signature look:* Peaked cap with gold badge, blue uniform.

  Victor checks everything twice. His peaked cap says "I have authority," his badge says "and I will use it." He stands at the gate of every zero-knowledge proof, every digital signature verification, and every access control list.

  As the *verifier*, Victor's job is simple: accept or reject. Is this signature valid? Is this proof sound? Does this credential check out? He doesn't need to know the secret --- he just needs to know it's real. His false-positive rate is zero. His false-negative rate is also zero. He is very proud of this.

  _Hobbies:_ Proofreading, stamp collecting, recounting ballots for fun.
]

== #ina(size: 12pt) Ina --- The Analyst

#card("Ina", ina)[
  *Signature look:* Deep purple asymmetric hair covering one eye, dark outfit, teal pin.

  Ina sees patterns where others see noise. Her signature asymmetric hair isn't just a style choice --- it's a philosophy. She sees the world from one angle at a time, and that focus is what makes her dangerous. The teal pin on her lapel is a gift from Christina, who considers Ina her best critic.

  As the *analyst*, Ina reviews traffic logs, protocol transcripts, and cipher outputs. She found the side-channel leak in Christina's third protocol, the timing attack in Trent's timestamp service, and the padding oracle in Bob's latest message format --- all before lunch. Eve is jealous of her insight; Mallory is wary of her thoroughness.

  _Hobbies:_ Data visualization, true crime podcasts, solving jigsaw puzzles face-down.
]

== #murphy(size: 12pt) Murphy --- The Tester

#card("Murphy", murphy)[
  *Signature look:* Gray curly hair, round glasses, white lab coat.

  Murphy's Law states that anything that can go wrong, will go wrong. Murphy the person ensures that it goes wrong *before* deployment. His round glasses have seen every edge case, every race condition, every off-by-one error. His gray hair was brown when he started this job.

  As the *tester*, Murphy subjects every protocol to chaos. He flips bits, drops packets, reorders messages, and injects garbage at the worst possible moment. If your system survives Murphy, it survives anything. Christina both dreads and depends on his reviews. He once found a critical vulnerability by accidentally spilling coffee on a keyboard.

  _Hobbies:_ Rube Goldberg machines, stress-testing kitchen appliances, pessimistic poetry.
]

== #bella(size: 12pt) Bella --- The Herald

#card("Bella", bella)[
  *Signature look:* Brown side ponytail, pink flower, pendant necklace.

  Bella is the voice of the network. When a certificate is revoked, Bella announces it. When a protocol is updated, Bella publishes the changelog. When someone joins the neighborhood, Bella makes the introductions. Her side ponytail and flower suggest approachability, but her broadcasts are all business.

  As the *herald*, Bella manages the public bulletin board, the certificate revocation lists, and the system-wide announcements. She works closely with Grace (who signs the certificates) and Victor (who enforces the rules). Her pink flower is a broadcast antenna --- at least, that's what she tells Eve.

  _Hobbies:_ Public speaking, newsletter writing, arranging flowers by Fibonacci sequence.
]

= Usage

== Installation

```typst
// From the Typst package registry
#import "@preview/pixel-family:0.1.0": *

// Or locally
#import "@local/pixel-family:0.1.0": *
```

== Inline Characters

Characters work like text. Default size is `1em` --- they scale with the surrounding font:

```typst
Hello #bob() and #alice() are talking while #eve() listens.
```

Hello #bob() and #alice() are talking while #eve() listens.

They scale automatically with text size:

#text(size: 24pt)[Large: #bob(size: 24pt) #alice(size: 24pt) #eve(size: 24pt)]

#text(size: 8pt)[Tiny: #bob(size: 8pt) #alice(size: 8pt) #eve(size: 8pt)]

== Explicit Sizes

Pass any length to `size`:

#bob(size: 1cm) #alice(size: 2cm) #christina(size: 3cm) #mary(size: 4cm) #eve(size: 5cm)

== Color Customization

Every character accepts `skin`, `hair`, `shirt`, and `pants`:

```typst
#bob(size: 3cm, hair: blue, shirt: red)
#alice(size: 3cm, hair: black, shirt: green)
#eve(size: 3cm, hair: rgb("#ff69b4"), shirt: rgb("#ffd700"))
```

#bob(size: 3cm, hair: blue, shirt: red)
#alice(size: 3cm, hair: black, shirt: green)
#eve(size: 3cm, hair: rgb("#ff69b4"), shirt: rgb("#ffd700"))

== Skin Tones

Built-in skin tone presets:

#{
  let tones = (
    ("Default", skin-default),
    ("Light", skin-light),
    ("Medium", skin-medium),
    ("Dark", skin-dark),
  )
  for (label, tone) in tones {
    [#bob(size: 2cm, skin: tone) ]
  }
}

= API Reference

== Character Functions

All thirteen characters share the same signature:

```typst
#let name(
  size: 1em,       // character height — scales with text by default
  baseline: auto,  // auto = center-aligned, or pass a length (0pt = bottom)
  skin: color,     // skin tone
  hair: color,     // hair color
  shirt: color,    // shirt/top color
  pants: color,    // pants/bottom color
) -> content       // inline content, like a box
```

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  table.header[*Character*][*Hair*][*Shirt*][*Pants*][*Extras*],
  [#bob(size: 16pt) `bob`], [green], [white], [black vest], [---],
  [#alice(size: 16pt) `alice`], [brown], [white], [black], [red pocket, mustache],
  [#christina(size: 16pt) `christina`], [purple], [white], [black], [yellow clip, green tie],
  [#mary(size: 16pt) `mary`], [black], [white], [black], [red ribbons, red bow],
  [#eve(size: 16pt) `eve`], [red], [green], [black], [curly hair],
  table.hline(stroke: 0.5pt),
  [#frank(size: 16pt) `frank`], [black], [white], [black (hat)], [top hat, bowtie, mustache],
  [#grace(size: 16pt) `grace`], [blonde], [blue], [black], [updo, gold necklace],
  [#trent(size: 16pt) `trent`], [brown], [white], [black (jacket)], [balding, beard],
  [#mallory(size: 16pt) `mallory`], [black], [black (hoodie)], [black], [hood up, pocket],
  [#victor(size: 16pt) `victor`], [black], [blue (uniform)], [blue (cap)], [peaked cap, badge],
  table.hline(stroke: 0.5pt),
  [#ina(size: 16pt) `ina`], [purple], [black], [black], [asymmetric hair, teal pin],
  [#murphy(size: 16pt) `murphy`], [gray], [white (coat)], [black], [glasses],
  [#bella(size: 16pt) `bella`], [brown], [pink], [black], [side ponytail, flower, pendant],
)

== Color Palette

The library exports individual color constants:

#table(
  columns: (1fr, 1fr, 1fr),
  table.header[*Skin*][*Hair*][*Clothing*],
  [`skin-default`], [`hair-brown`], [`shirt-white`],
  [`skin-light`], [`hair-blonde`], [`shirt-blue`],
  [`skin-medium`], [`hair-black`], [`shirt-red`],
  [`skin-dark`], [`hair-red`], [`shirt-green`],
  [], [`hair-green`], [`shirt-pink`],
  [], [], [`pants-black`],
  [], [], [`pants-blue`],
  [], [], [`pants-gray`],
)

== Custom Characters with `pixel-grid`

For advanced use, the `pixel-grid` function is exported. Define a 2D array and a color palette to draw your own pixel art:

```typst
#import "lib.typ": pixel-grid
#import "@preview/cetz:0.4.2": canvas, draw

#box(canvas(length: 0.3cm, {
  pixel-grid(
    (
      (0, 1, 0),
      (1, 1, 1),
      (0, 1, 0),
    ),
    (none, red),  // index 0 = transparent, index 1 = red
  )
}))
```

= License

MIT License --- See repository for details.
