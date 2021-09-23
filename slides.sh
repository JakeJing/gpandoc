#!/bin/sh


gdrive export --force --mime text/plain 1jiv7N8dlnIJcZDc-JV80rKkC7VRKTd3pyyn7PByk2Ms

gsed -e '0,/BEGINFILE/d' -e '/ENDFILE/,$d' sample_slides.txt | sed -e '/________________/d' > main.txt
# deleting gdoc linebreaks and everyting before or after the main txt

rm sample_slides.txt

pandoc -t beamer -V theme:metropolis -V themeoptions:numbering=fraction -V themeoptions:progressbar=foot --pdf-engine=xelatex main.txt -o main.pdf

open main.pdf

