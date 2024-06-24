tex:
	latexmk -pdf -silent --output-directory=build -synctex=1 "reportTemplate"
html:
	pandoc --css=styling.css -V lang=en -V highlighting-css= --mathjax --standalone --to=html5 --csl=ieee-format.csl --bibliography=reportTemplate.bib --citeproc reportTemplate.tex -o reportTemplate.html
	python3 insertHeader.py reportTemplate.html
clean:
	rm -rf build/
	rm reportTemplate.html

