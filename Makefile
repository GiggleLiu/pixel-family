CUR_VERSION := $(shell grep '^version' typst.toml | head -1 | sed 's/.*"\(.*\)"/\1/')
LOCAL_PKG := $(HOME)/.local/share/typst/packages/local/pixel-family/$(CUR_VERSION)
PKG_FILES := lib.typ typst.toml LICENSE README.md

.PHONY: all manual images install uninstall test clean bump-version release-pkg

all: manual images

manual: manual.pdf

manual.pdf: manual.typ lib.typ characters/*.typ
	typst compile manual.typ manual.pdf

images: images/gallery.svg

images/gallery.svg: images/render.typ lib.typ characters/*.typ
	typst compile --root . --format svg images/render.typ images/gallery.svg

install:
	@mkdir -p $(LOCAL_PKG)/characters
	@cp $(PKG_FILES) $(LOCAL_PKG)/
	@cp characters/*.typ $(LOCAL_PKG)/characters/
	@echo "Installed to $(LOCAL_PKG)"

uninstall:
	@rm -rf $(LOCAL_PKG)
	@echo "Removed $(LOCAL_PKG)"

test: install manual
	@echo "All tests passed (manual compiled successfully)"

bump-version:
ifndef V
	$(error V is not set. Usage: make bump-version V=X.Y.Z)
endif
	@echo "Bumping version $(CUR_VERSION) -> $(V)"
	sed -i 's/pixel-family:$(CUR_VERSION)/pixel-family:$(V)/g' lib.typ manual.typ README.md
	sed -i 's/^version = "$(CUR_VERSION)"/version = "$(V)"/' typst.toml
	@echo "Done. Run 'make test' to verify."

release-pkg:
ifndef V
	$(error V is not set. Usage: make release-pkg V=X.Y.Z)
endif
	@mkdir -p dist/pixel-family/$(V)/characters
	@cp $(PKG_FILES) dist/pixel-family/$(V)/
	@cp characters/*.typ dist/pixel-family/$(V)/characters/
	@echo "Package staged in dist/pixel-family/$(V)/"

clean:
	rm -f manual.pdf images/*.svg
	rm -rf dist/
