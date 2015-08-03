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

syntax match  dataflowArrow           "<-\|->"
syntax region dataflowString          start=+"+ end=+"\|$+
syntax match  dataflowKey             /\<[a-zA-Z_$][0-9a-zA-Z_$]*\>\(\s*:\)\@=/
syntax region dataflowTextBlock       start="|" end="$"
syntax region dataflowMap             start="{" end="}" fold transparent contains=dataflowKey
syntax region dataflowChildren        start="\[" end="\]" fold transparent contains=dataflowArrow,dataflowString,dataflowMap,dataflowChildren

hi link dataflowKeyword   Keyword
hi link dataflowArrow     Operator
hi link dataflowString    String
hi link dataflowTextBlock Special
hi link dataflowKey       Constant


let b:current_syntax = "dataflow"
if main_syntax == 'dataflow'
  unlet main_syntax
endif
