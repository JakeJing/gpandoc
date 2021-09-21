#!/bin/sh

gdrive export --force --mime text/plain 1xOjDwPo2gGC3dM5DeT30H_-r7ZeYV0wBQsoxCKAhAmI

gsed -e '0,/BEGINFILE/d' -e '/ENDFILE/,$d' sample.txt | sed -e '/________________/d' > main.txt

rm sample.txt

pandoc --lua-filter=lua-filters/scholarly-metadata/scholarly-metadata.lua --lua-filter=lua-filters/author-info-blocks/author-info-blocks.lua --template=./templates/simple_format.latex --pdf-engine=xelatex --biblatex -F /usr/local/bin/glosses.py -F pandoc-citeproc -M secPrefix=Section -N main.txt -o mainr.tex 2> pandoc-errors.txt


sed -e 's/\\leavevmode/\\leavevmode\\hangindent=.7cm/g' mainr.tex | gsed -e 's/.*\hypertarget{references}.*/%TC:ignore\n\n&/' -e 's/.*\end{document}.*/%TC:endignore\n&/' > main.tex

xelatex -output-driver="xdvipdfmx -E -q" -synctex=0 main.tex
# run the main.tex and get the main.aux for bibtex (citation)
biber main
xelatex -output-driver="xdvipdfmx -E -q" -synctex=0 main.tex

rm mainr.tex
rm main.out
rm main.log
rm main.aux

open main.pdf
