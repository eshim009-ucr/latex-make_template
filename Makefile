### DEFINITIONS ###
# LaTeX source files #
# This should be changed for multi-file documents to avoid building included
# files
SRC=$(wildcard *.tex)

# Output PDF files #
PDF=$(subst .tex,.pdf,$(SRC))

# pdflatex build logs #
LOG=$(subst .tex,.log,$(SRC))

# pdflatex temp files #
AUX=$(subst .tex,.aux,$(SRC))
OUT=$(subst .tex,.out,$(SRC))

# Spellcheck backup files #
BAK=$(subst .tex,.tex.bak,$(SRC))


### TARGETS ###
all: $(PDF)

# Build PDF #
%.pdf: %.tex
	pdflatex $< $@

# Spellcheck source files #
check:
	find . -type f -name '*.tex' -exec aspell check -t {} \;

# Clean build files #
clean:
	rm -f $(PDF) $(BAK) $(AUX) $(LOG) $(OUT)
