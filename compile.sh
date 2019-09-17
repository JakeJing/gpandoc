#!/bin/sh

# Note: the id (1X3SyhXiKM0fMDTAVEW_gst-35O42TtV-L7OQGhHmrMs) should be changed according to your gdoc fiel id.
gdrive export --force --mime text/plain 1X3SyhXiKM0fMDTAVEW_gst-35O42TtV-L7OQGhHmrMs

gsed -e '0,/BEGINFILE/d' -e '/ENDFILE/,$d' length-harmony-locality.txt | sed -e '/________________/d' > main.txt

# this name also need to be changed according to the name of the .gdoc file.
rm file.txt

pandoc --template=simple.latex --pdf-engine=xelatex -F /usr/local/bin/glosses.py -F pandoc-citeproc -M secPrefix=Section -N main.txt -o mainr.tex 2> pandoc-errors.txt



sed -e 's/\\leavevmode/\\leavevmode\\hangindent=.7cm/g' mainr.tex | gsed -e 's/.*\hypertarget{references}.*/%TC:ignore\n\n&/' -e 's/.*\end{document}.*/%TC:endignore\n&/' > main.tex

xelatex -output-driver="xdvipdfmx -E -q" -synctex=0 main.tex
xelatex -output-driver="xdvipdfmx -E -q" -synctex=0 main.tex

rm mainr.tex
rm main.out
rm main.log
rm main.aux

open main.pdf
