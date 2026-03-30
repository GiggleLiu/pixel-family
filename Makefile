CHARACTERS := bob alice christina mary eve frank grace trent mallory victor ina murphy bella bolt pixel-char crank nova sentinel alien seraphim shamir steve yui logic tabby schrodinger enaga noir milady tigris porcellum lain dragon paddler chaser alchemist hongyuan fox tuxedo
SVGS := $(addprefix images/,$(addsuffix .svg,$(CHARACTERS)))
CUR_VERSION := $(shell grep '^version' typst.toml | head -1 | sed 's/.*"\(.*\)"/\1/')
LOCAL_PKG := $(HOME)/.local/share/typst/packages/local/pixel-family/$(CUR_VERSION)
PKG_FILES := lib.typ typst.toml LICENSE README.md

.PHONY: all manual images install uninstall test clean bump-version release-pkg

all: manual images

manual: manual.pdf

manual.pdf: manual.typ lib.typ characters/*.typ
	typst compile manual.typ manual.pdf

images: $(SVGS)

$(SVGS): images/render.typ lib.typ characters/*.typ
	typst compile --root . --format svg images/render.typ 'images/render-{0p}.svg'
	@cd images && \
	mv render-01.svg bob.svg && \
	mv render-02.svg alice.svg && \
	mv render-03.svg christina.svg && \
	mv render-04.svg mary.svg && \
	mv render-05.svg eve.svg && \
	mv render-06.svg frank.svg && \
	mv render-07.svg grace.svg && \
	mv render-08.svg trent.svg && \
	mv render-09.svg mallory.svg && \
	mv render-10.svg victor.svg && \
	mv render-11.svg ina.svg && \
	mv render-12.svg murphy.svg && \
	mv render-13.svg bella.svg && \
	mv render-14.svg bolt.svg && \
	mv render-15.svg pixel-char.svg && \
	mv render-16.svg crank.svg && \
	mv render-17.svg nova.svg && \
	mv render-18.svg sentinel.svg && \
	mv render-19.svg alien.svg && \
	mv render-20.svg seraphim.svg && \
	mv render-21.svg shamir.svg && \
	mv render-22.svg steve.svg && \
	mv render-23.svg yui.svg && \
	mv render-24.svg logic.svg && \
	mv render-25.svg tabby.svg && \
	mv render-26.svg schrodinger.svg && \
	mv render-27.svg enaga.svg && \
	mv render-28.svg noir.svg && \
	mv render-29.svg milady.svg && \
	mv render-30.svg tigris.svg && \
	mv render-31.svg porcellum.svg && \
	mv render-32.svg lain.svg && \
	mv render-33.svg dragon.svg && \
	mv render-34.svg paddler.svg && \
	mv render-35.svg chaser.svg && \
	mv render-36.svg alchemist.svg && \
	mv render-37.svg hongyuan.svg && \
	mv render-38.svg fox.svg && \
	mv render-39.svg tuxedo.svg

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
