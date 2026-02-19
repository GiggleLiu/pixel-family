CHARACTERS := bob alice christina mary eve frank grace trent mallory victor ina murphy bella bolt pixel-char crank nova sentinel
SVGS := $(addprefix images/,$(addsuffix .svg,$(CHARACTERS)))
LOCAL_PKG := $(HOME)/.local/share/typst/packages/local/pixel-family/0.1.0
PKG_FILES := lib.typ typst.toml LICENSE README.md

.PHONY: all manual images install uninstall test clean

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
	mv render-18.svg sentinel.svg

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

clean:
	rm -f manual.pdf images/*.svg
