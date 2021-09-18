---
title: "My Template for Reformating a Research Article"
author: "Yingqi Jing" # only for one author or manually edit template.tex
institute: "Uppsala University"
email: "yingqi.jing@lingfil.uu.se"
date: "September 18, 2021"
header-includes:
  - \usepackage{mathtools, makecell, tikz}
keywords: "Word order typology, language evolution"
abstract: |
  This is the abstract of the paper. An abstract summarizes, usually in one paragraph of 300 words or less, the major aspects of the entire paper in a prescribed sequence that includes: 1) the overall purpose of the study and the research problem(s) you investigated; 2) the basic design of the study; 3) major findings or trends found as a result of your analysis; and, 4) a brief summary of your interpretations and conclusions.
thanks:  |
  I would like to first thank.  
output: 
   # bookdown::pdf_document2:
  pdf_document:
     # includes:
     #   in_header: "preamble.tex" # redundant now
     template: "template.tex" # the most important
     fig_crop: true
     fig_caption: true
     latex_engine: xelatex
     keep_tex: true
     citation_package: biblatex # keep it to enable link-citations
     toc: false # set table of content as false
     toc_depth: 4
     number_section: true
     # "--variable=lof",  # remove list of figures out of pandoc_args
     # "--variable=lot", # remove list of tables out of pandoc_args
     pandoc_args: ["--bibliography=/Users/jakejing/switchdrive/bib/references.bib", "--csl=/Users/jakejing/switchdrive/bib/unified-style-linguistics.csl"]
---




\clearpage

Introduction
============

You can also load the cached file, @Greenberg1963 check the environment to see whether the variables have already been saved [@Dryer1992].

In self-paced reading, the verb is read faster in such examples when it follows the semantically rich and complex noun phrase in \ref{ex-german}a (“the book that Lisa bought yesterday”) than when it follows the short object noun phrase “the book” in \ref{ex-german}b, where the relative clause is extraposed [@Konieczny2000].

\begin{exe} \ex Expectation-based facilitation in German \label{ex-german}
\begin{xlist}
\ex \gll Er hat das Buch, [das Lisa gestern gekauft hatte], hingelegt.\\
         he has the book that Lisa yesterday bought had laid.down\\
\ex  \gll Er hat das Buch hingelegt, [das Lisa gestern gekauft hatte].\\
        he has the book laid.down that Lisa yesterday bought had\\
       \glt ‘He has laid down the book that Lisa had bought yesterday.’ 
\end{xlist}
\end{exe}

References
==========

