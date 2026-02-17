// PixelMan - Pixel art characters for Typst
// A CeTZ-based library for drawing customizable pixel characters

#import "@local/cetz:0.4.2": canvas, draw

// Import core modules
#import "src/draw.typ": pixel-grid
#import "src/palette.typ": defaults

// Import characters
#import "src/characters/bob.typ": bob
#import "src/characters/alice.typ": alice
#import "src/characters/christina.typ": christina
#import "src/characters/mary.typ": mary
#import "src/characters/eve.typ": eve

// Re-export all public functions
#let pixel-grid = pixel-grid
#let palette = defaults

#let bob = bob
#let alice = alice
#let christina = christina
#let mary = mary
#let eve = eve
