
.PHONY: all clean

QUARTO ?= /usr/local/bin/quarto

all: report.html report.pdf

data/raw/SerenaWilliamsCareer.js: scripts/download.sh
	bash scripts/download.sh

data/clean/serena.csv: data/raw/SerenaWilliamsCareer.js scripts/clean.R
	mkdir -p data/clean
	Rscript scripts/clean.R

figures/serena_plot.png: data/clean/serena.csv scripts/plot.R
	mkdir -p figures
	Rscript scripts/plot.R

report.html: report.qmd figures/serena_plot.png
	$(QUARTO) render report.qmd --to html

report.pdf: report.qmd figures/serena_plot.png
	$(QUARTO) render report.qmd --to pdf

clean:
	rm -f data/raw/SerenaWilliamsCareer.js
	rm -f data/clean/serena.csv
	rm -f figures/serena_plot.png
	rm -f report.html report.pdf