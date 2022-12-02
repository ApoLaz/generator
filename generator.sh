#!/bin/bash

format=$1

case $format in 
	"html")
		pandoc README.md -f markdown -t html --metadata -s -o repo.html;;
	"pdf")
		pandoc README.md --to latex > repo.tex
		pandoc -N --quiet --variable "geometry=margin=1.2in" --variable mainfont="OpenSans-Regular.ttf" --variable sansfont="OpenSans-Regular.ttf" --variable monofont="OpenSans-Regular.ttf" --variable fontsize=12pt --variable version=2.0 repo.tex --pdf-engine=xelatex --toc -o repo.pdf;;
	"docx")
		pandoc -s -o repo.docx README.md;;
	"-h")
		echo "generator.sh [option]"
		echo ""
		echo "OPTION		RESULT"
		echo "html		generate repo in html format"
		echo "pdf 		generate repo in pdf  format"
		echo "docx 		generate repo in docx format"
esac
