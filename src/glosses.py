#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import  io, sys, re
from warnings import warn
from pandocfilters import RawBlock, RawInline, applyJSONFilters

gloss_labels = set()


def make_gloss(key, value, format, meta):
  if key == "CodeBlock" and "gloss" in value[0][1]:
    # create a linguex style gloss
    # a) prepare the label
    label = value[0][0]
    if label != "": 
      gloss_labels.add(label)
      label = "\\label{{glossed-example:{}}}".format(label)
    # b) prepare the text
    lines = value[1].splitlines()
    if len(lines) != 3:
      print("Glossed examples should have exactly three lines!", file=sys.stderr)
      return RawBlock("latex", "BAD GLOSS") 
    
    translation = lines[2]
    lines[1] = re.sub("([A-Z]+)", lambda match: u"{{\scshape {}}}".format(match.group(0).lower()), lines[1])
    #lines = u"\\\\\n".join(lines[0:2])
    glosslines = u"{}\\\\\n      {}\\\\".format(lines[0], lines[1])
    
    # replace all ALL CAPITAL sequences by smallcaps
    
    
    # c) put it all together
    #gll = %u"\\gll {}".format("\n".join(%u"{}\\".format(line) for line in lines[0:1])
    
    # ex  = u"\\ex {}".format(label)
    # gll = u"\\gll {}\n".format(label)
    # trans = u"\\trans `{}'".format(translation)
    
    gb4egloss = u"\\begin{{exe}} \\ex {}\n \gll {}\n \\trans `{}'\n\end{{exe}}".format(label, glosslines, translation)
    
    return RawBlock("latex", gb4egloss)
    
    
    
    
    # \begin{exe}
    # \ex
    # \gll Кот ест сметану\\
    # cat.NOM eat.3.SG.PRS sour-cream.ACC\\
    # \trans `The cat eats sour cream'
    # \end{exe}
    
def parse_references(key, value, format, meta):
  if key == "Cite":
    # check if citatiosn reference glosses
    refs = [info['citationId'] for info in value[0]]
    if any(ref in gloss_labels for ref in refs):
      #print(refs, file=sys.stderr)
      if len(refs)>1:
        print("Mixing multiple gloss references not supported yet!", file=sys.stderr)
        return RawInline("latex", "Invalid gloss reference")
      
      return RawInline("latex", "example~\\ref{{glossed-example:{}}}".format(refs[0]))
    
    # print(value, file=sys.stderr)
    # sys.exit(1)
      
    
    #  and value in latex_labels:
    # #print("HellO!")
    # label = value[1:]
    #
    # return RawInline("latex", "example~\\ref{{{}}}".format(label))
    
    # # create a linguex style gloss
    # # a) prepare the label
    # label = value[0][0]
    # if label != "": label = "\\label{{{}}}".format(label)
    # # b) prepare the text
    # lines = value[1].splitlines()
    # lines = "\\\\\n".join(lines)
    # # c) put it all together
    # latex_gloss = "\\egx. {} {}\n\n".format(label, lines)
    #
    # return(pandoc.RawBlock("latex", latex_gloss))
    
# if __name__ == "__main__":
#   pandoc.toJSONFilters([make_gloss, parse_references])
  
#
input_stream = io.TextIOWrapper(sys.stdin.buffer, encoding='utf-8')
input = input_stream.read()
# print(input, file=sys.stderr)
# sys.exit(1)

output = applyJSONFilters([make_gloss, parse_references], input, "")
# print(output, file=sys.stderr)
# sys.exit(1)

sys.stdout.write(output)

