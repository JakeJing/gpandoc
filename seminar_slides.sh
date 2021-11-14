#!/bin/sh


gdrive export --force --mime text/plain 1Y2AoPJGo_C9Z98uKuz0U0kRMiOsHi5Z-ca3N4AT0_lk

gsed -e '0,/BEGINFILE/d' -e '/ENDFILE/,$d' seminaruu.conf | sed -e '/________________/d' > main.txt
# deleting gdoc linebreaks and everyting before or after the main txt

rm seminaruu.conf

pandoc -t beamer --pdf-engine=xelatex main.txt -o main.pdf

rm main.txt

# --template=./templates/default_mod.latex -H ./templates/preamble.tex
# themes:metropolis, moon
# --include-in-header=./templates/mystyle.tex

# pandoc -t beamer -V theme:metropolis -V themeoptions:numbering=fraction -V themeoptions:progressbar=foot --pdf-engine=xelatex main.txt -o main.pdf

open -a skim main.pdf

