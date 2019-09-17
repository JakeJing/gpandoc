# gpandoc
This repository is used to set up the gpandoc for proofreading or collaborations (the major settings and some template files come from Balthasar and Taras). Here I just write down the concrete procedures for install all the softwares and build the whole environment based on macbook v10.14.6.

## 1. install latex or mactex (http://www.tug.org/mactex/)

## 2. install "pandoc" >= 2.1 (best via installer package, e.g. https://pandoc.org/installing.html)

## 3. install "homebrew" (best as described in https://brew.sh)

## 4. install gnu-sed and gdrive via brew

> brew install gnu-sed

> brew install gdrive

> gdrive about  (text the gdrive, you may need to verify the gdrive. Just follow the commands from the instructions from the screen.)

## 5. install fonts of Libertinus Serif

> git clone https://github.com/alif-type/libertinus.git

On mac, you can directly click the *.otf file to install the font.

## 6. add simple latex template (simple.latex) to the directory ~/.pandoc/templates/ (create the directory if doesn't exist yet!). 

## 7. add the glosses.py and pandocfilters.py in /usr/local/bin (but make them executable first!)

Note: all these additional files can be found in the my google drive (gpandoc-test/utilities/), need to be put in the right directory.

## 8. add the template file.gdoc. This will be the original file you need to share with ur collaborators. 

## 9. After all these setups, you still need a bash file (compile.sh, make it executable) to download from the gdoc to raw text and compile it into the latex and pdf.
> ./compile.sh   (this file should be put in the main directory of ur project.)

I strongly suggest you to run the commands from compile.sh line by line, and test whether there is any error or not. If everything works well, you may be able to enjoy using the google doc, and easily convert it into many other formats.

