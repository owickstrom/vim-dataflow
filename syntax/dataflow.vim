" Vim syntax file
"      Language: DataFlow
"    Maintainer: Oskar Wickström <https://github.com/owickstrom>
"       Version: 0.1.0
"

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'dataflow'
endif

syntax keyword dataflowKeyword  diagram boundary function database io

syntax region dataflowComment         start="/\*" end="\*/"
syntax region dataflowString          start=+"+ end=+"$+
syntax region dataflowTextBlock       start=+`+ end=+`+
syntax match  dataflowArrow           "<-\|->\|="
syntax match  dataflowEquals          "="
syntax match  dataflowAttrName        "\w\+ =" contains=dataflowEquals
syntax region dataflowMap             start="{" end="}" fold transparent contains=dataflowAttrName,dataflowArrow,dataflowString,dataflowMultiLineString,dataflowMap,dataflowOp

hi link dataflowAttrName        Identifier
hi link dataflowArrow           Operator
hi link dataflowEquals          Operator
hi link dataflowString          String
hi link dataflowTextBlock       Special
hi link dataflowKey             Constant
hi link dataflowComment         Comment


let b:current_syntax = "dataflow"
if main_syntax == 'dataflow'
  unlet main_syntax
endif
