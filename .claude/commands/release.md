# Release pixel-family

Release a new version of pixel-family to GitHub and Typst Universe.

Usage: /release X.Y.Z

## Steps

Follow these steps in order. Stop and report if any step fails.

### 1. Pre-flight checks

- Verify working tree is clean: `git status --porcelain` must be empty
- Verify on `main` branch
- Run `make test` and confirm it passes

### 2. Bump version

- Run `make bump-version V=$ARGUMENTS`
- Run `make test` to verify the bump didn't break anything

### 3. Build artifacts

- Run `make images` to regenerate SVGs
- Run `make manual` to rebuild the PDF

### 4. User review gate

- Show `git diff` to the user
- Ask: "Version bumped to $ARGUMENTS. Review the diff above — shall I commit and release?"
- **Wait for user confirmation before proceeding**

### 5. Commit and push

- Stage all changed files (version-bumped sources + regenerated SVGs)
- Commit with message: `release v$ARGUMENTS`
- Push to origin

### 6. GitHub release

- Create a release: `gh release create v$ARGUMENTS manual.pdf --title "v$ARGUMENTS" --generate-notes`
- Report the release URL

### 7. Typst Universe PR

Locate the typst/packages fork:
- If `~/tcode/packages` exists and is a git repo with remote `origin` pointing to `GiggleLiu/packages`, use it
- Otherwise, sparse-clone to `/tmp/packages`:
  ```
  git clone --depth=1 --filter=blob:none --sparse https://github.com/GiggleLiu/packages.git /tmp/packages
  cd /tmp/packages && git sparse-checkout set packages/preview/pixel-family
  ```

Then:
- Add upstream if missing: `git remote add upstream https://github.com/typst/packages.git`
- Sync with upstream: `git fetch upstream main --depth=1 && git reset --hard upstream/main`
- Create branch: `git checkout -b pixel-family-$ARGUMENTS`
- Build package: `make release-pkg V=$ARGUMENTS` (from the pixel-family repo)
- Copy: `cp -r dist/pixel-family/$ARGUMENTS/ <packages-repo>/packages/preview/pixel-family/$ARGUMENTS/`
- Commit: `git add . && git commit -m "pixel-family:$ARGUMENTS"`
- Push: `git push origin pixel-family-$ARGUMENTS --force`
- Create PR: `gh pr create --repo typst/packages --head GiggleLiu:pixel-family-$ARGUMENTS --title "pixel-family:$ARGUMENTS" --body "New version. See https://github.com/GiggleLiu/pixel-family/releases/tag/v$ARGUMENTS"`

### 8. Report

Print both URLs:
- GitHub release: `https://github.com/GiggleLiu/pixel-family/releases/tag/v$ARGUMENTS`
- Typst Universe PR: (the URL returned by `gh pr create`)
