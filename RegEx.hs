--  Adapted from:
--  http://www1.eafit.edu.co/asicard/courses/automata-CB0081/src/RegExp.html

module RegEx where

-- A polymorphic data regular expression data type
data RegExp  = Empty
             | Epsilon
             | Symbol Char
             | Star RegExp
             | Plus RegExp RegExp
             | Dot  RegExp RegExp
