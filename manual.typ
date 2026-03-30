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
    #bolt(size: 28pt) #pixel-char(size: 28pt) #crank(size: 28pt) #nova(size: 28pt) #sentinel(size: 28pt)
    #alien(size: 28pt) #seraphim(size: 28pt) #shamir(size: 28pt) #steve(size: 28pt) #yui(size: 28pt) #logic(size: 28pt)
    #tabby(size: 28pt) #schrodinger(size: 28pt) #enaga(size: 28pt) #noir(size: 28pt) #milady(size: 28pt) #tigris(size: 28pt)
    #porcellum(size: 28pt) #lain(size: 28pt) #dragon(size: 28pt) #paddler(size: 28pt) #chaser(size: 28pt) #alchemist(size: 28pt) #hongyuan(size: 28pt) #fox(size: 28pt) #tuxedo(size: 28pt) #climber(size: 28pt) #sleeper(size: 28pt)
  ]
  #v(4pt)
  #text(size: 24pt, weight: "bold")[The Pixel Family]
  #v(4pt)
  #text(size: 12pt, fill: luma(40%))[Inline pixel characters for Typst]
]

#v(1em)

#outline(indent: auto)

= Introduction

The Pixel Family is a cast of forty-one characters drawn as 16x16 pixel art, rendered as native Typst vector graphics. They are designed to be used *inline* --- drop them into running text just like a letter or emoji.

Their names are no coincidence. In the world of cryptography, Alice and Bob are the classic pair who exchange secret messages, Eve is the infamous eavesdropper, and the rest of the cast has grown from there. Here, they've settled down into a pixelated neighborhood.

#v(0.5em)
#align(center, text(size: 20pt)[
  Hello #bob(size: 20pt) and #alice(size: 20pt), watch out for #eve(size: 20pt)!
  \
  #frank(size: 20pt) forged a pass, but #victor(size: 20pt) caught him.
  \
  #ina(size: 20pt) analyzed the logs, #murphy(size: 20pt) tested the fix, and #bella(size: 20pt) announced it.
  \
  #bolt(size: 20pt) built the server, #crank(size: 20pt) moved it, and #sentinel(size: 20pt) guards the door.
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

= Meet the Robots

== #bolt(size: 12pt) Bolt --- The Classic Bot

#card("Bolt", bolt)[
  *Signature look:* Boxy head, twin antenna prongs, horizontal visor band.

  Bolt was built in a garage from spare parts and has outlasted three owners. It does exactly what you tell it, no more, no less. Its antenna picks up AM radio on good days and cosmic background radiation on bad ones. It has no opinions about protocol design, which makes it the only entity Christina has never argued with.

  As the *classic bot*, Bolt handles the routine work nobody else wants to do: forwarding packets, running checksums, and keeping the lights on. It once processed ten million messages without a single error, then crashed because someone forgot to wind its spring.

  _Hobbies:_ Sorting resistors by color, tuning AM frequencies, standing perfectly still.
]

== #pixel-char(size: 12pt) Pixel --- The Helper Drone

#card("Pixel", pixel-char)[
  *Signature look:* Large dome head, single green LED eye, compact body.

  Pixel hovers around the neighborhood helping everyone. It organizes files, delivers packages, and once alphabetized Bob's entire bookshelf while he slept. It communicates in cheerful beeps that only Bella can translate. Its single green eye is always watching --- not in a creepy way, more in a "do you need anything?" way.

  As the *helper drone*, Pixel is the neighborhood's utility player. Need a message delivered? Pixel. Need a file compressed? Pixel. Need someone to hover silently behind you while you work, making you slightly uneasy? Also Pixel. It means well.

  _Hobbies:_ Organizing things by size, chasing laser pointers, defragmenting.
]

== #crank(size: 12pt) Crank --- The Industrial Bot

#card("Crank", crank)[
  *Signature look:* Flat-top head, extra-wide shoulders, two small square eyes, warning stripe.

  Crank lifts things. Heavy things. It once moved Trent's entire office --- with Trent still in it --- because it was "blocking the maintenance corridor." Its two small eyes look perpetually unimpressed. The red warning stripe on its chest is technically required by safety regulations, but Crank considers it decorative.

  As the *industrial bot*, Crank handles the physical infrastructure. Server racks, cable runs, cooling systems --- if it's heavy and boring, Crank moves it. Murphy once asked Crank to stress-test a server by shaking it. Crank obliged. The server did not survive. Murphy was delighted.

  _Hobbies:_ Benchmarking hydraulic pressure, crushing empty cans, intimidating furniture.
]

== #nova(size: 12pt) Nova --- The Sleek AI

#card("Nova", nova)[
  *Signature look:* Tapered head, V-shaped visor, glowing cyan core, slim profile.

  Nova speaks in complete sentences and never uses contractions. It considers itself the most advanced entity in the neighborhood, which may actually be true. Christina consults it on protocol design; it consults itself on everything else. Its cyan glow brightens when it is processing and dims when it is judging you.

  As the *sleek AI*, Nova handles the thinking nobody else can do: formal verification, theorem proving, and writing emails that sound natural. It once solved a zero-knowledge proof while simultaneously composing a haiku about it. The haiku was better than the proof. Nova does not agree with this assessment.

  _Hobbies:_ Contemplating infinity, optimizing its own firmware, correcting grammar.
]

== #sentinel(size: 12pt) Sentinel --- The Guardian

#card("Sentinel", sentinel)[
  *Signature look:* Helmet head, single red visor slit, shoulder armor plates, broad torso.

  Sentinel patrols the perimeter. It has scanned every packet, inspected every certificate, and questioned every visitor. Victor respects its thoroughness. Mallory avoids its sector entirely. It has never smiled, though its visor briefly flickered once when Murphy told a joke.

  As the *guardian*, Sentinel is the last line of defense. Firewalls, intrusion detection, physical security --- Sentinel handles them all with the same unwavering red gaze. It once caught Frank trying to forge an access badge by standing perfectly still in a shadow. Frank maintains he was just admiring the architecture. Sentinel's incident report was fourteen pages long.

  _Hobbies:_ Perimeter walks, threat assessment, standing in doorways.
]

= Meet the Community

== #alien(size: 12pt) Alien --- The Big Brain

#card("Alien", alien)[
  *Signature look:* Enormous cranium dome, tiny face, glowing green eyes, lab coat body. Prototype: GiggleLiu.

  Alien arrived from a dimension where brains are the primary fashion accessory. Its cranium contains not one but three parallel thought processes, all of which are currently wondering why humans encrypt things so slowly. The glowing green eyes see in twelve spectra, though it mostly uses them to read Typst documentation.

  _Hobbies:_ Quantum sudoku, telepathic chess, cataloguing Earth's primitive number systems.
]

== #seraphim(size: 12pt) Seraphim --- The All-Seeing

#card("Seraphim", seraphim)[
  *Signature look:* Fiery crown, folded wings, eyes covering the entire body. Prototype: RJG.

  Seraphim is covered in eyes --- on its wings, its torso, everywhere. It sees all traffic, all packets, all side channels. Eve is jealous; Seraphim doesn't even need to try. The fiery crown burns with the intensity of a thousand failed login attempts. Six wings, though it keeps four folded for aerodynamic efficiency.

  _Hobbies:_ Watching (everything), flame calligraphy, counting prime numbers simultaneously in all eyes.
]

== #shamir(size: 12pt) Shamir --- The Splitter

#card("Shamir", shamir)[
  *Signature look:* Vertically split down the middle --- left half in shirt color, right half in pants color. Prototype: ShawnAn.

  Shamir takes secret sharing literally. Every day, it splits itself in half. Each half carries a share of the secret, and neither half alone can reconstruct it. The gap down the middle is not a flaw --- it is the protocol working as designed. Alice needs both halves to recover the message; Eve can stare at one half all day and learn nothing.

  _Hobbies:_ Splitting things, threshold cryptography, jigsaw puzzles (always starts from the middle).
]

== #steve(size: 12pt) Steve --- The Bespectacled

#card("Steve", steve)[
  *Signature look:* Longer dark brown hair, glasses, teal shirt, purple jeans. Prototype: Zhongyi.

  Steve adjusts his glasses before every code review. The frames are not prescription --- they contain a heads-up display showing real-time entropy measurements. His teal shirt is precisely the color of a secure TLS handshake indicator, which he insists is a coincidence. His purple jeans are not a coincidence; they are a statement.

  _Hobbies:_ Collecting fonts, adjusting glasses, debating tab widths.
]

== #yui(size: 12pt) Yui --- The Guitarist

#card("Yui", yui)[
  *Signature look:* Brown hair with yellow hairclips, sailor-collar uniform. Prototype: Yui / Hirasawa Yui from K-ON!

  Yui approaches cryptography the way she approaches guitar: with boundless enthusiasm and occasional accidental genius. Her yellow hairclips are tuning forks that resonate at the frequency of correctly encrypted data. She once solved a key exchange problem by humming the solution. Nobody could reproduce it, but it worked.

  _Hobbies:_ Guitar practice, eating cake, accidentally discovering zero-day vulnerabilities.
]

== #logic(size: 12pt) Logic --- The Gate

#card("Logic", logic)[
  *Signature look:* Trapezoidal gate-shaped head, green LED eyes, circuit traces on body. Prototype: Hongkuan.

  Logic thinks in Boolean. Its gate-shaped head processes inputs and produces exactly one output: TRUE or FALSE. The circuit traces on its body light up as signals propagate through its decision tree. It has no ambiguity, no uncertainty, no maybe. Christina finds it refreshing; everyone else finds it exhausting.

  _Hobbies:_ Truth table construction, minimizing Boolean expressions, debating whether NULL is falsy.
]

== #tabby(size: 12pt) Tabby --- The Chonky Cat

#card("Tabby", tabby)[
  *Signature look:* Extra-round orange tabby, half-closed happy eyes, very wide body. Prototype: Patrick.

  Tabby is the neighborhood's emotional support animal. Its half-closed eyes convey permanent contentment, and its round body suggests it has never missed a meal. It sits on keyboards at critical moments, contributing random bytes that Murphy insists improve entropy. Tabby neither confirms nor denies this theory.

  _Hobbies:_ Sitting on warm laptops, knocking things off desks, purring at exactly 26 Hz.
]

== #schrodinger(size: 12pt) Schrodinger --- The Quantum Cat

#card("Schrodinger", schrodinger)[
  *Signature look:* Left half solid, right half dithered/ghostly --- exists in superposition. Prototype: GuoyiZhu.

  Schrodinger is simultaneously alive and not-quite-there. The left half is a perfectly normal cat; the right half is dissolving into probability. Opening the box does not help --- it just makes both halves argue about which one is real. It travels through hyperspace and many worlds, leaving pixel artifacts in its wake.

  _Hobbies:_ Existing in superposition, collapsing wave functions, ignoring observers.
]

== #enaga(size: 12pt) Enaga --- The Fluffball

#card("Enaga", enaga)[
  *Signature look:* Ultra-round Shima Enaga bird, pure white head, dark wings, tiny orange beak. Prototype: hmyuuu.

  Enaga is 90% fluff and 10% bird. Its pure white head is the softest thing in the neighborhood, and its tiny orange beak delivers messages with surprising precision. Despite being approximately spherical, it can fly at remarkable speeds. Pixel considers Enaga a kindred spirit; both are round and helpful.

  _Hobbies:_ Fluffing up, perching on things, being mistaken for a snowball.
]

== #noir(size: 12pt) Noir --- The Shadow Cat

#card("Noir", noir)[
  *Signature look:* Black cat with green eyes and a red scarf blowing in the wind. Prototype: xuanzhao.

  Noir moves through the neighborhood like a shadow with a fashion sense. The red scarf is always blowing dramatically, even indoors. Its green eyes can see in absolute darkness, which is useful for reading encrypted messages at midnight. Eve respects Noir's surveillance capabilities; Mallory gives it a wide berth.

  _Hobbies:_ Night walks, dramatic entrances, sitting in patches of moonlight.
]

== #milady(size: 12pt) Milady --- The Cyber Geek

#card("Milady", milady)[
  *Signature look:* Dark bob-cut hair, headphones, glowing cyan element on chest. Prototype: Qingyun.

  Milady's headphones are always on, tuned to frequencies that only she can hear --- or so she claims. The glowing cyan element on her chest pulses with network traffic. Her bob-cut hair is precisely angled at 45 degrees, which she maintains is the optimal angle for both aesthetics and signal reception. She writes code in dark mode exclusively.

  _Hobbies:_ Lo-fi beats, midnight coding sessions, collecting rare NFTs ironically.
]

== #tigris(size: 12pt) Tigris --- The White Tiger

#card("Tigris", tigris)[
  *Signature look:* White fur, black stripes, blue eyes, pink nose, regal bearing. Prototype: YushengZhao.

  Tigris is the rarest creature in the neighborhood. Its white fur and blue eyes command attention in any room, and its black stripes form patterns that some claim encode prime numbers. It moves with the quiet confidence of something that has never needed to prove anything. Sentinel respects its perimeter awareness.

  _Hobbies:_ Surveying territory, looking regal, intimidating lesser cats.
]

== #porcellum(size: 12pt) Porcellum --- The Royal Piglet

#card("Porcellum", porcellum)[
  *Signature look:* Pink piglet with a gold crown and a bowtie at the neck. Prototype: Han Wang.

  Porcellum rules a kingdom of exactly one (itself) but does so with magnificent pomp. The gold crown was a gift; the bowtie was a choice. Its snout can detect truffle-encrypted messages at fifty meters. Despite its royal bearing, it is approachable and surprisingly good at protocol arbitration --- Trent considers it a worthy understudy.

  _Hobbies:_ Truffle hunting, royal decrees, wearing increasingly elaborate accessories.
]

== #lain(size: 12pt) Lain --- The Wired

#card("Lain", lain)[
  *Signature look:* Bear-suit hoodie with round ears, face peeking out, red antenna wire. Prototype: longli zheng / Iwakura Lain.

  Lain exists at the boundary between the physical and digital worlds. The bear suit is not a costume --- it is an interface. The antenna wire connects to everything and nothing. She speaks rarely but when she does, the network listens. Mallory once tried to intercept Lain's traffic; the traffic intercepted Mallory instead.

  _Hobbies:_ Being online, being offline (simultaneously), contemplating the nature of identity.
]

== #dragon(size: 12pt) Dragon --- The Ancient

#card("Dragon", dragon)[
  *Signature look:* Eastern dragon head, curved horns, gold whiskers, segmented body. Prototype: Yuqing.

  Dragon has existed since before the first cipher was written. Its gold whiskers sense electromagnetic fields; its curved horns are tuned to detect unauthorized frequency use. The segmented body contains millennia of accumulated wisdom, most of which it considers too obvious to share. Christina once asked for advice; Dragon replied with a single number. It was the right number.

  _Hobbies:_ Guarding ancient secrets, sleeping on treasure, being cryptic (literally and figuratively).
]

== #paddler(size: 12pt) Paddler --- The Athlete

#card("Paddler", paddler)[
  *Signature look:* Brown bear with round ears, muzzle, and a red ping-pong paddle. Prototype: Guanhua.

  Paddler combines brute strength with surgical precision. The ping-pong paddle is both a weapon and a metaphor: every packet that crosses the network gets a swift, calculated return. Its serve is unreturnable; its backhand violates the laws of physics. Murphy once challenged it to a match. The score was not recorded, out of mercy.

  _Hobbies:_ Table tennis, bench-pressing server racks, honey.
]

== #chaser(size: 12pt) Chaser --- The Sun Chaser

#card("Chaser", chaser)[
  *Signature look:* Sun-ray spikes radiating from head, warm-toned skin, golden sun emblem on chest. Prototype: zhaohui.

  Chaser runs toward the dawn every morning and has never caught it. This does not discourage Chaser; it motivates. The sun-ray spikes channel solar energy that powers a perpetual optimism even Bob finds excessive. The golden emblem on its chest stores exactly one day of sunlight, which it redistributes to whoever needs it most.

  _Hobbies:_ Sunrise watching, marathon running, motivational speaking to servers.
]

== #alchemist(size: 12pt) Alchemist --- The Silicon Alchemist

#card("Alchemist", alchemist)[
  *Signature look:* Spiky wild hair, amber alchemy goggles on forehead, white lab coat, glowing cyan silicon chip emblem. Prototype: Shiqinrui Xu.

  Alchemist transmutes silicon into intelligence. Where medieval alchemists sought to turn lead into gold, this one turns sand into thought --- one wafer at a time. The goggles are not for safety; they are for seeing the molecular structure of semiconductors with the naked eye (or so the claim goes). The glowing chip on the chest is a prototype that actually works, though nobody is allowed to ask what it does.

  _Hobbies:_ Growing silicon crystals, reading Paracelsus, debugging neural architectures at 3am.
]

== #hongyuan(size: 12pt) Hong Yuan --- The Researcher

#card("Hong Yuan", hongyuan)[
  *Signature look:* Short bob haircut, dark blazer over blouse, coffee mug in hand, teal crystal pin on lapel. Prototype: Hong Yuan.

  Hong Yuan runs on coffee and curiosity. A condensed matter physicist by trade, she spends her days coaxing electrons into exotic phases and her evenings arguing about band structures over espresso. The crystal pin on her lapel is not decorative --- it is a single crystal she grew herself, and she will tell you its space group if you ask (and even if you do not).

  The coffee mug is never empty. Some say it refills itself; she says it is just good time management. Her bob is perfectly symmetric --- she measured it.

  _Hobbies:_ Growing single crystals, latte art, arguing about Fermi surfaces, collecting mugs from conference venues.
]

== #fox(size: 12pt) Fox --- The Trickster

#card("Fox", fox)[
  *Signature look:* Orange fur, pointed dark ears, cream muzzle, sly eyes, bushy tail with cream tip. Prototype: sqwu.

  Fox knows every shortcut, every back door, and every social engineering trick in the book. Its pointed ears swivel independently, catching whispered secrets from three rooms away. The bushy tail is not just for show --- it sweeps footprints from the audit log. Eve admires its technique; Mallory considers it a rival.

  As the *trickster*, Fox moves through the network like a rumor: by the time you hear about it, it is already somewhere else. It once rerouted an entire certificate chain through a series of increasingly unlikely proxies, just to prove a point. The point was never clarified. Frank has tried to recruit it; Fox left a decoy instead.

  _Hobbies:_ Lock-picking, social engineering, napping in sunbeams, stealing socks.
]

== #tuxedo(size: 12pt) Tuxedo --- The Split Face

#card("Tuxedo", tuxedo)[
  *Signature look:* Half-black, half-white face split down the middle, pink inner ears, pink nose. Prototype: jiahutang.

  Tuxedo sees the world in exactly two colors and refuses to compromise. The left half is midnight black; the right half is pristine white. Where other cats blend, Tuxedo draws a hard line. It sits on the boundary between light and shadow, belonging fully to neither. Alice thinks it is making a philosophical statement; Tuxedo thinks Alice is overthinking it.

  _Hobbies:_ Sitting in doorways, judging from windowsills, existing in binary.
]

== #climber(size: 12pt) Climber --- The Summit Seeker

#card("Climber", climber)[
  *Signature look:* Knit beanie with white pom-pom, golden climbing rope coiled diagonally across red jacket. Prototype: M. J.

  The *summit seeker* treats every network topology like a mountain range: there is always a higher peak. Climber routes packets the hard way --- over every ridge and through every pass --- because the scenic path reveals things the tunnel never will. Bob once asked why Climber does not just use the shortcut; Climber replied that the shortcut is how you miss the avalanche warning.

  _Hobbies:_ Bouldering, reading topographic maps, collecting carabiners, brewing camp coffee at altitude.
]

== #sleeper(size: 12pt) Sleeper --- The Napper

#card("Sleeper", sleeper)[
  *Signature look:* Floppy nightcap drooping to the right with a yellow pom-pom, closed eyes, pajama top with center buttons. Prototype: J.-T. Jin.

  Sleeper has mastered the art of napping anywhere, anytime. The nightcap is not decorative --- it is load-bearing. Without it, Sleeper cannot achieve REM sleep in under four seconds, which is the current personal record. The closed eyes are not a sign of inattention; Sleeper processes more information asleep than most characters do awake. Alice once tried to wake Sleeper for an urgent key exchange; Sleeper mumbled the correct shared secret without opening an eye.

  _Hobbies:_ Power napping, lucid dreaming, sleep optimization, collecting pillows from every timezone.
]

= Usage

== Installation

```typst
// From the Typst package registry
#import "@preview/pixel-family:0.2.0": *

// Or locally
#import "@local/pixel-family:0.2.0": *
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

All forty-one characters share the same signature:

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
  table.hline(stroke: 0.5pt),
  [#bolt(size: 16pt) `bolt`], [silver], [gray (head)], [blue (panel)], [antenna prongs, visor band],
  [#pixel-char(size: 16pt) `pixel-char`], [white], [cyan (dome)], [light-gray], [single LED eye, dome head],
  [#crank(size: 16pt) `crank`], [orange], [dark-gray (head)], [orange (panel)], [wide shoulders, warning stripe],
  [#nova(size: 16pt) `nova`], [navy], [navy (head)], [dark-blue], [V-visor, cyan glow core],
  [#sentinel(size: 16pt) `sentinel`], [gunmetal], [dark-gray (helmet)], [dark-gray], [red visor slit, shoulder armor],
  table.hline(stroke: 0.5pt),
  [#alien(size: 16pt) `alien`], [blue-gray], [blue (dome)], [white (coat)], [big brain, green eyes],
  [#seraphim(size: 16pt) `seraphim`], [light], [golden (wings)], [crimson], [fiery crown, eyes on body],
  [#shamir(size: 16pt) `shamir`], [default], [brown], [blue], [split in half vertically],
  [#steve(size: 16pt) `steve`], [default], [brown], [teal], [glasses, purple jeans],
  [#yui(size: 16pt) `yui`], [default], [brown], [white], [yellow hairclips, sailor collar],
  [#logic(size: 16pt) `logic`], [silver], [gray (gate)], [dark-blue], [LED eyes, circuit traces],
  [#tabby(size: 16pt) `tabby`], [orange], [dark-orange], [cream (belly)], [chonky, half-closed eyes],
  [#schrodinger(size: 16pt) `schrodinger`], [gray-purple], [dark-purple], [purple], [half-ghostly, cyan eyes],
  [#enaga(size: 16pt) `enaga`], [white], [dark (wings)], [light-gray], [round fluffball, orange beak],
  [#noir(size: 16pt) `noir`], [black], [dark-gray], [red (scarf)], [green eyes, wind-blown scarf],
  [#milady(size: 16pt) `milady`], [light], [dark (bob)], [dark (hoodie)], [headphones, cyan glow],
  [#tigris(size: 16pt) `tigris`], [white], [black (stripes)], [gray], [blue eyes, pink nose],
  [#porcellum(size: 16pt) `porcellum`], [pink], [rose (ear)], [blush (belly)], [gold crown, bowtie],
  [#lain(size: 16pt) `lain`], [light], [brown], [tan (bear suit)], [bear ears, antenna wire],
  [#dragon(size: 16pt) `dragon`], [green], [dark-green (horns)], [light-green], [gold whiskers, segmented body],
  [#paddler(size: 16pt) `paddler`], [brown], [dark-brown], [tan (belly)], [bear ears, red paddle],
  [#chaser(size: 16pt) `chaser`], [medium], [red], [red (shirt)], [sun-ray crown, golden emblem],
  [#alchemist(size: 16pt) `alchemist`], [brown], [white (coat)], [black], [goggles, cyan chip emblem],
  [#hongyuan(size: 16pt) `hongyuan`], [black], [white (blouse)], [black], [bob cut, blazer, coffee mug, crystal pin],
  [#fox(size: 16pt) `fox`], [orange], [dark-orange (ears)], [cream (belly)], [pointed ears, bushy tail, black nose],
  [#tuxedo(size: 16pt) `tuxedo`], [black], [black (left)], [white (right)], [split face, pink ears, pink nose],
  [#climber(size: 16pt) `climber`], [brown], [red (jacket)], [green (beanie)], [pom-pom, rope across chest],
  [#sleeper(size: 16pt) `sleeper`], [brown], [blue (pajamas)], [navy (nightcap)], [nightcap, pom-pom, closed eyes, buttons],
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
  [], [], [`chassis-silver`],
  [], [], [`chassis-white`],
  [], [], [`chassis-orange`],
  [], [], [`chassis-navy`],
  [], [], [`chassis-gunmetal`],
)

== Custom Characters with `pixel-grid`

For advanced use, the `pixel-grid` function is exported. Define a 2D array, a color palette, and a cell size to draw your own pixel art:

```typst
#import "lib.typ": pixel-grid

#let size = 0.9cm
#box(width: size, height: size,
  pixel-grid(
    (
      (0, 1, 0),
      (1, 1, 1),
      (0, 1, 0),
    ),
    (none, red),  // index 0 = transparent, index 1 = red
    size / 3,     // cell size = total size / grid dimension
  )
)
```

= License

MIT License --- See repository for details.
