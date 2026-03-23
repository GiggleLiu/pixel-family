# Release Skill Design

## Goal

Automate the pixel-family release process with a `/release` skill backed by Makefile targets for mechanical operations.

## Components

### 1. Makefile Targets

**`make bump-version V=X.Y.Z`**

Replaces the version string across all files that contain it:
- `typst.toml`: `version = "X.Y.Z"`
- `Makefile`: `LOCAL_PKG` path suffix
- `lib.typ`: usage comment import version
- `manual.typ`: installation example imports
- `README.md`: quick-start import example

Uses `sed -i` with the current version (read from `typst.toml`) as the old value and `V` as the new value. Fails if `V` is not set.

**`make release-pkg V=X.Y.Z`**

Copies publishable files into `dist/pixel-family/X.Y.Z/`:
- `lib.typ`, `typst.toml`, `LICENSE`, `README.md`
- `characters/*.typ`

The `dist/` directory is added to `.gitignore` and to the `exclude` list in `typst.toml`.

### 2. README.md Fix

Convert all `<img src="images/...">` tags in `README.md` to use absolute GitHub raw URLs (`https://raw.githubusercontent.com/GiggleLiu/pixel-family/main/images/...`) with `alt` attributes. This is a one-time fix so the same README works in both the main repo and the typst/packages submission.

### 3. Skill: `/release`

**Trigger:** User runs `/release X.Y.Z`

**Steps:**

1. **Pre-flight checks**
   - Working tree is clean (`git status`)
   - On `main` branch
   - `make test` passes

2. **Bump version**
   - Run `make bump-version V=X.Y.Z`
   - Run `make test` to verify

3. **Build artifacts**
   - `make images` (regenerate SVGs)
   - `make manual` (rebuild PDF)

4. **User review gate**
   - Show `git diff` to user
   - Ask for confirmation before proceeding

5. **Commit and push**
   - `git add` changed files (not images if unchanged)
   - Commit: `release vX.Y.Z`
   - `git push origin main`

6. **GitHub release**
   - `gh release create vX.Y.Z manual.pdf --title "vX.Y.Z"`
   - Generate release notes from diff since last tag

7. **Typst Universe PR**
   - Locate fork: check `~/tcode/packages`, fall back to sparse-clone to `/tmp/packages`
   - Sync fork's main with `upstream/main` (`git fetch upstream main && git reset --hard upstream/main`)
   - Create branch `pixel-family-X.Y.Z`
   - Run `make release-pkg V=X.Y.Z`
   - Copy `dist/pixel-family/X.Y.Z/` into `packages/preview/pixel-family/X.Y.Z/`
   - Commit and push to fork
   - `gh pr create --repo typst/packages --head GiggleLiu:pixel-family-X.Y.Z`

8. **Report**
   - Print GitHub release URL and typst/packages PR URL

## Files Changed

| File | Change |
|---|---|
| `Makefile` | Add `bump-version` and `release-pkg` targets |
| `.gitignore` | Add `dist/` |
| `typst.toml` | Add `dist/*` to `exclude` |
| `README.md` | One-time fix: absolute image URLs + alt text |
| `.claude/commands/release.md` | New skill file |
| `CLAUDE.md` | Update Releasing section, add Commands section entry |
