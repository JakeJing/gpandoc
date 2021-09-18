## Manuscript for reformating the gdoc output into latex

In this folder, we include a `manuscript.Rmd` file that is used to convert the gdoc output (`main.txt`) into a well-formated latex file. With this, you can submit the final version of your accepted paper to the editor.

### 1. Required files

- main.txt
- manuscript.Rmd
- template.tex
- references.bib

### 2. Procedures

(1) Manually copy and paste the content from `main.txt` into the `manuscript.Rmd`;

(2) Render the `manuscript.Rmd` file and get the latex file (`manuscript.tex`) and corresponding PDF (`manuscript.pdf`);

The `template.tex` is specified in the Rmd script so as to format the title page and references. 

**Note:** `template.tex` is only needed when you want to render the Rmd script. After rendering it, you do not need the `manuscript.Rmd` and `template.tex`.

(3) Edit the `manuscript.tex` file according to the stylesheet of the journal, and render the pdf. 

