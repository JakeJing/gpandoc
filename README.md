# gpandoc
This repository is used to compile `.gdoc` files into other formats (`.pdf`, `.tex`, and `.md`) via pandoc. The major idea is to make full use of the platform in google doc for editing, suggesting and discussing manuscripts in your project. Most templates and scripts come from Balthasar and Taras. Here I just summarize the important steps for installing the necessary softwares and deploying the environment for mac users.

### 1. install latex or mactex (http://www.tug.org/mactex/)

You may need to add the path of latex or xelatex in your path, like .bashrc or config.fish.

```bash
which latex
which xelatex
```

### 2. install pandoc (best via installer package, e.g. https://pandoc.org/installing.html)

### 3. install homebrew (best as described in https://brew.sh)

### 4. install gnu-sed and gdrive via brew

```bash
brew install gnu-sed
brew install gdrive
gdrive about 
# test the gdrive, and it may require verification. Just follow the instructions from the screen.
```

### 5. install fonts of Libertinus Serif

```bash
git clone https://github.com/alif-type/libertinus.git
```

On mac, you can directly click the `*.otf` file to install the font (font/Libertinus).

### 6. add simple latex template (`simple.latex` and `simple_format.latex`) to the directory ~/.pandoc/templates/ (create the directory if doesn't exist yet!)

- `simple.latex` is used for the first submission of your manuscript;
- `simple_format.latex` is used for the final submission of your manuscript;

### 7. add the `glosses.py` and `pandocfilters.py` to /usr/local/bin (but make them executable first!)

```bash
chmod +x *.py
```

### 8. create a [sample_paper.gdoc](https://docs.google.com/document/d/1xOjDwPo2gGC3dM5DeT30H_-r7ZeYV0wBQsoxCKAhAmI/edit?usp=sharing) and [sample_slides.doc](https://docs.google.com/document/d/1jiv7N8dlnIJcZDc-JV80rKkC7VRKTd3pyyn7PByk2Ms/edit) in your google drive. These are the original files you need to share with your collaborators. 

### 9. After all these setups, you still need a bash file (`compile.sh`, `compile_format.sh` and `slides.sh`) to extract gdoc text and compile it into pdf.

You need to put the `compile.sh` or `compile_format.sh` into the same directory of your gdoc file. **Note:** if you want to edit the authors' information, you can edit the template files (**templates/simple.latex** or **templates/simple_format.latex**).

The major difference between `simple.latex` and `simple_reformat.latex` is that the reformated version is much easier to customize the references, since it is produced via `printbibliography`.

For `slides.sh`, the default theme is **metroplis**, and you can specify other [themes and colorthemes](https://hartwork.org/beamer-theme-matrix/), and beamer [font themes](https://deic-web.uab.cat/~iblanes/beamer_gallery/index_by_font.html).

```bash
./compile_pandocv1.sh # first submission (annonymous) for pandoc v1

./compile_format_pandocv1.sh # final submission (with title page) for pandoc v1

./slides.sh # compile it into a pdf slide
```

I strongly suggest you to first test the commands in `compile.sh` line by line, and see whether there is any error. **Note:** you need to change the id of your gdoc file in `compile.sh`. If everything works well, you are ready to go. Enjoy it!



**Some common errors in Rmarkdown:**

Rmarkdown cannot highlight the R syntax in Pandoc, you need to downgrade pandoc into pandoc v1.19.2.1 and R studio into v1.3.1093. In doing so, the R syntax can be recognized correctly.

