// PixelMan Manual
// Usage guide and examples

#import "@preview/cetz:0.4.0": canvas
#import "lib.typ": *

#set page(margin: 2cm)
#set heading(numbering: "1.")

#align(center, text(size: 24pt, weight: "bold")[PixelMan Manual])
#align(center, text(size: 12pt)[Pixel art characters for Typst using CeTZ])

#outline()

= Introduction

PixelMan is a Typst library that draws customizable pixel art characters using CeTZ (CeTZ, ein Typst Zeichenpaket). Instead of using external PNG images, characters are rendered as native vector graphics that scale perfectly.

= Installation

Add to your `typst.toml` dependencies:

```toml
[dependencies]
pixelman = "0.1.0"
```

Or use locally:

```typst
#import "@local/pixelman:0.1.0": *
```

= Quick Start

```typst
#import "@local/pixelman:0.1.0": *

// Basic usage
#bob() #alice() #eve()

// Custom size
#bob(size: 60pt)

// Custom colors
#alice(skin: brown, hair: red, shirt: blue)
```

= Character Gallery

== Bob

Green hair, white shirt, black vest.

#canvas(length: 1cm, {
  bob(size: 4cm)
})

```typst
#bob()                              // Default
#bob(size: 60pt)                   // Larger
#bob(hair: blue, shirt: red)       // Custom colors
```

== Alice

Brown hair, white shirt with red pocket, mustache.

#canvas(length: 1cm, {
  alice(size: 4cm)
})

```typst
#alice()
#alice(size: 50pt, hair: black)
```

== Christina

Purple hair with yellow accessory, white shirt with green tie.

#canvas(length: 1cm, {
  christina(size: 4cm)
})

```typst
#christina()
#christina(size: 55pt)
```

== Mary

Black hair with red ribbons, white shirt with red bow.

#canvas(length: 1cm, {
  mary(size: 4cm)
})

```typst
#mary()
#mary(size: 45pt, hair: brown)
```

== Eve

Red curly hair, green shirt.

#canvas(length: 1cm, {
  eve(size: 4cm)
})

```typst
#eve()
#eve(size: 50pt, hair: pink)
```

= All Characters

#canvas(length: 1cm, {
  bob(size: 2cm)
  alice(size: 2cm)
  christina(size: 2cm)
  mary(size: 2cm)
  eve(size: 2cm)
})

= Customization

All characters accept these parameters:

- `size`: Overall size (default: 40pt)
- `skin`: Skin color
- `hair`: Hair color
- `shirt`: Shirt color
- `pants`: Pants color

= Available Colors

Access the color palette:

```typst
#import "@local/pixelman:0.1.0": palette

#palette.skin        // Default skin tone
#palette.hair-brown  // Brown hair
#palette.shirt-blue  // Blue shirt
// etc.
```

= Advanced Usage

== Inline Characters

Use in text:

```typst
#bob() says hello to #alice()!
```

Result: #bob() says hello to #alice()!

== Different Sizes

```typst
#bob(size: 20pt)   // Small
#bob(size: 40pt)   // Default
#bob(size: 80pt)   // Large
```

#canvas(length: 1cm, {
  bob(size: 1.5cm)
  bob(size: 3cm)
  bob(size: 4.5cm)
})

= API Reference

== Functions

Each character function has the same signature:

```typst
#let character-name(
  size: 40pt,
  skin: palette.skin,
  hair: palette.hair-color,
  shirt: palette.shirt-color,
  pants: palette.pants-color,
) = { ... }
```

Available characters: `bob`, `alice`, `christina`, `mary`, `eve`

= License

MIT License - See repository for details.
