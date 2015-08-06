if exists('g:loaded_dataflow_validate_checker')
    finish
endif
let g:loaded_dataflow_validate_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_dataflow_validate_IsAvailable() dict
    return executable(self.getExec())
endfunction

function! SyntaxCheckers_dataflow_validate_GetLocList() dict
    let makeprg = self.makeprgBuild({
                \ 'args': 'validate' })

    let errorformat = '%A"%f" (line %l\, column %c):,%C%m'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ 'filetype': 'dataflow',
            \ 'name': 'validate',
            \ 'exec': 'dataflow' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
