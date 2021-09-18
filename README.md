# gpandoc
This repository is used to compile `.gdoc` files into other formats (`.pdf`, `.tex`, and `.md`) via pandoc. The major idea is to make full use of the platform in google doc for editing, suggesting and discussing manuscripts in your project. Most templates and scripts come from Balthasar and Taras. Here I just summarize the important steps for installing the necessary softwares and deploying the environment for mac users.

### 1. install latex or mactex (http://www.tug.org/mactex/)

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

On mac, you can directly click the `*.otf` file to install the font.

### 6. add simple latex template (`simple.latex` and `simple_format.latex`) to the directory ~/.pandoc/templates/ (create the directory if doesn't exist yet!)

- `simple.latex` is used for the first submission of your manuscript;
- `simple_format.latex` is used for the final submission of your manuscript;

### 7. add the `glosses.py` and `pandocfilters.py` to /usr/local/bin (but make them executable first!)

```bash
chmod +x *.py
```

### 8. create a [sample.gdoc](https://docs.google.com/document/d/1xOjDwPo2gGC3dM5DeT30H_-r7ZeYV0wBQsoxCKAhAmI/edit?usp=sharing) file in your google drive. This will be the original file you need to share with your collaborators. 

### 9. After all these setups, you still need a bash file (`compile.sh` and `compile_format.sh`) to extract gdoc text and compile it into pdf.

```bash
./compile.sh 
# this file should be put in the main directory of your project.
./compile_format.sh 
# for compile the final version
```

I strongly suggest you to first test the commands in `compile.sh` line by line, and see whether there is any error. **Note:** you need to change the id of your gdoc file in `compile.sh`. If everything works well, you are ready to go. Enjoy it!

