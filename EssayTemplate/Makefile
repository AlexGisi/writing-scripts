tex:
	latexmk -pdf -silent --output-directory=build -synctex=1 "essayTemplate"
html:
	pandoc --css=styling.css -V lang=en -V highlighting-css= --mathjax --standalone --to=html5 essayTemplate.tex -o essayTemplate.html
	python3 insertHeader.py essayTemplate.html
clean:
	rm -rf build/
	rm essayTemplate.html

