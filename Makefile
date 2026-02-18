CHARACTERS := bob alice christina mary eve frank grace trent mallory victor ina murphy bella
SVGS := $(addprefix images/,$(addsuffix .svg,$(CHARACTERS)))

.PHONY: all manual images clean

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
	mv render-13.svg bella.svg

clean:
	rm -f manual.pdf images/*.svg
