# Design a new pixel-family character

Interactive workflow: gather requirements, design pixel art, name it, and integrate into the repo.

Usage: /design-character

## Step 1: Gather information

Ask the user two questions (in a single message):

1. **Your name** — used as the data prefix in the batch file (e.g. `zhongyi-a-data`)
2. **Character description** — what the character looks like, any signature features, vibe, species (human / animal / robot / fantasy)

**Wait for the user to answer before proceeding.**

## Step 2: Design 3 variants

Create 3 distinct pixel art interpretations of the character description. Each variant should differ meaningfully — not just palette swaps. Vary pose, accessories, silhouette, or stylistic emphasis.

### 2a. Write the data file

Create `candidates/<username>-candidates.typ` containing:
- 3 variant data arrays: `<username>-a-data`, `<username>-b-data`, `<username>-c-data`
- 3 variant color functions: `<username>-a-colors(skin, hair, shirt, pants)`, etc.
- Each function returns a color tuple starting with `none` (index 0 = transparent)
- Follow the 16x16 grid format. Use index conventions from existing batches:
  - Humans: 0=transparent, 1=skin, 2=hair, 3=shirt, 4=pants, 5=eyes, 6+=accents
  - Animals: 0=transparent, 1=fur/body, 2=head/ears, 3=belly/chest, 4=markings, 5=eyes, 6+=accents
  - Robots: 0=transparent, 1=chassis, 2=head, 3=panel, 4=trim, 5=visor, 6+=accents
- Add a descriptive comment header for each variant (e.g. `// Variant A — "Sitting Tabby"`)

### 2b. Write the render file

Create `candidates/<username>-render.typ`:

```typst
// Render character candidates for <username>
// Compile: typst compile candidates/<username>-render.typ candidates/<username>-render.pdf
#import "../lib.typ": pixel-grid

#import "<username>-candidates.typ": *

#let sz = 128pt
#set page(width: 3 * sz + 80pt, height: auto, margin: 20pt)
#set text(size: 10pt, font: "DejaVu Sans")

#let render(data, colors) = box(
  width: sz, height: sz,
  pixel-grid(data, colors, sz / 16),
)

#align(center, text(size: 16pt, weight: "bold")[<Character Name> — Candidates])

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 12pt,
  align(center, stack(dir: ttb, spacing: 6pt,
    render(<username>-a-data, <username>-a-colors(...)),
    text(weight: "bold", "A: <variant-a-name>"),
  )),
  align(center, stack(dir: ttb, spacing: 6pt,
    render(<username>-b-data, <username>-b-colors(...)),
    text(weight: "bold", "B: <variant-b-name>"),
  )),
  align(center, stack(dir: ttb, spacing: 6pt,
    render(<username>-c-data, <username>-c-colors(...)),
    text(weight: "bold", "C: <variant-c-name>"),
  )),
)
```

Fill in appropriate default colors for each variant's `colors(...)` call.

### 2c. Compile and open

```bash
typst compile --root . candidates/<username>-render.typ candidates/<username>-render.pdf
open candidates/<username>-render.pdf    # macOS
# or: xdg-open candidates/<username>-render.pdf  # Linux
```

### 2d. Ask user to pick

Show the user a message like:

> I've opened the PDF with 3 designs. Which variant do you prefer — **A**, **B**, or **C**?

Briefly describe each variant's key visual difference so the user can reference them by name if the PDF hasn't opened.

**Wait for the user to pick before proceeding.**

## Step 3: Name the character function

Based on the character description, suggest **3 candidate function names** for the Typst API. Present them in a table:

| # | Name | Recommended? | Reason |
|---|------|-------------|--------|
| 1 | `<name>` | Yes/No | ... |
| 2 | `<name>` | Yes/No | ... |
| 3 | `<name>` | Yes/No | ... |

Guidelines for name suggestions:
- Names should be short, lowercase, hyphenated if multi-word
- At least one name based on the character concept (e.g. `tabby`, `sun-chaser`)
- At least one name based on the user's name (e.g. `patrick`, `guanhua`)
- Mark exactly one as **Recommended** with a brief reason
- Avoid conflicts with existing character names and Typst built-ins

**Wait for the user to pick before proceeding.**

## Step 4: Integrate into the repo

Using the chosen variant and function name, follow the checklist from CLAUDE.md "Adding a Character" section:

1. **Batch file**: Copy the chosen variant's data + colors into the appropriate `characters/batch-*.typ` file (or create a new batch). Rename from `<username>-X-data` to `<chosen-name>-data` and `<username>-X-colors` to `<chosen-name>-colors`.

2. **lib.typ**: Import the batch (if new), add the character function with appropriate default colors and doc comment.

3. **images/render.typ**: Add a `#pagebreak()` + `#align(center + horizon, <name>(size: sz))` entry.

4. **Makefile**:
   - Add name to `CHARACTERS` list
   - Add `mv render-NN.svg <name>.svg` line in the `$(SVGS)` target (increment the page number)

5. **manual.typ**:
   - Add a bio section with heading, card, signature look, bio paragraph, and hobbies
   - Add a row to the API reference table

6. **README.md**: Add a cell to the gallery table (use `v0.2.0` tag or current version for image URL)

7. **Verify**: Run `make test` to confirm everything compiles

8. **Generate images**: Run `make images` to produce SVGs

9. **Clean up**: Remove the candidate files from `candidates/` that were created in step 2

10. **Commit**: Stage all changes and commit with message: `feat: add <name> character (<description>)`. Do NOT push.

### Report

After committing, show the user:
- The commit hash
- Which files were changed
- Remind them to push when ready and to update the GitHub discussion
