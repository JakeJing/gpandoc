#!/bin/sh

gdrive export --force --mime text/plain 1xOjDwPo2gGC3dM5DeT30H_-r7ZeYV0wBQsoxCKAhAmI

gsed -e '0,/BEGINFILE/d' -e '/ENDFILE/,$d' sample_paper.conf | sed -e '/________________/d' > main.txt

rm sample_paper.conf

pandoc --template=./templates/simple_format.latex --latex-engine=xelatex --biblatex -F pandoc-citeproc -F /usr/local/bin/glosses.py -M secPrefix=Section -N main.txt -o mainr.tex 2> pandoc-errors.txt


sed -e 's/\\leavevmode/\\leavevmode\\hangindent=.7cm/g' mainr.tex | gsed -e 's/.*\hypertarget{references}.*/%TC:ignore\n\n&/' -e 's/.*\end{document}.*/%TC:endignore\n&/' > main.tex

arara main.tex

# xelatex -output-driver="xdvipdfmx -E -q" -synctex=0 main.tex
# # run the main.tex and get the main.aux for bibtex (citation)
# biber main
# xelatex -output-driver="xdvipdfmx -E -q" -synctex=0 main.tex

rm mainr.tex
rm main.out
rm main.log
rm main.aux

open main.pdf
