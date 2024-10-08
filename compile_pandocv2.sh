#!/bin/sh

# Note: the id (1xOjDwPo2gGC3dM5DeT30H_-r7ZeYV0wBQsoxCKAhAmI) should be changed according to your gdoc fiel id.
gdrive files export --overwrite 1xOjDwPo2gGC3dM5DeT30H_-r7ZeYV0wBQsoxCKAhAmI sample_paper.txt

gsed -e '0,/BEGINFILE/d' -e '/ENDFILE/,$d' sample_paper.txt| sed -e '/________________/d' > main.txt

# this name also need to be changed according to the name of the .gdoc file.
rm sample_paper.txt

pandoc --biblatex --template=templates/simple.latex --pdf-engine=xelatex -F glosses.py -M secPrefix=Section -N main.txt -o mainr.tex 2> pandoc-errors.txt
# pandoc --citeproc --template=templates/simple.latex --pdf-engine=xelatex -F glosses.py -M secPrefix=Section -N main.txt -o mainr.tex 2> pandoc-errors.txt

# pandoc --citeproc --lua-filter=lua-filters/scholarly-metadata/scholarly-metadata.lua --lua-filter=lua-filters/author-info-blocks/author-info-blocks.lua --pdf-engine=xelatex -F /usr/local/bin/glosses.py -M secPrefix=Section -N main.txt -o mainr.tex 2> pandoc-errors.txt


sed -e 's/\\leavevmode/\\leavevmode\\hangindent=.7cm/g' mainr.tex | gsed -e 's/.*\hypertarget{references}.*/%TC:ignore\n\n&/' -e 's/.*\end{document}.*/%TC:endignore\n&/' > main.tex

xelatex -output-driver="xdvipdfmx -E -q" -synctex=0 main.tex
biber main
xelatex -output-driver="xdvipdfmx -E -q" -synctex=0 main.tex

rm mainr.tex
rm main.out
rm main.log
rm main.aux

open main.pdf
