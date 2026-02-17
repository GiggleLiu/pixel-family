# PixelMan

Pixel art characters for Typst, drawn using CeTZ (CeTZ, ein Typst Zeichenpaket).

## Features

- **5 pixel characters**: Bob, Alice, Christina, Mary, Eve
- **Vector graphics**: Scales perfectly to any size
- **Customizable colors**: Skin, hair, shirt, and pants
- **Simple API**: Function-based usage (`#bob()`, `#alice()`)
- **Self-contained**: No external image files needed

## Installation

Add to your `typst.toml`:

```toml
[dependencies]
pixelman = "0.1.0"
```

Or use locally:

```typst
#import "@local/pixelman:0.1.0": *
```

## Quick Start

```typst
#import "@local/pixelman:0.1.0": *

// Basic usage
#bob() #alice() #eve()

// Custom size
#bob(size: 60pt)

// Custom colors
#alice(skin: brown, hair: red, shirt: blue)
```

## Characters

- **Bob**: Green hair, white shirt
- **Alice**: Brown hair, white shirt with red pocket
- **Christina**: Purple hair with yellow accessory, white shirt with green tie
- **Mary**: Black hair with red ribbons, white shirt with red bow
- **Eve**: Red curly hair, green shirt

## API

Each character function accepts:

```typst
#let character-name(
  size: 40pt,
  skin: palette.skin,
  hair: palette.hair-color,
  shirt: palette.shirt-color,
  pants: palette.pants-color,
)
```

## License

MIT License
