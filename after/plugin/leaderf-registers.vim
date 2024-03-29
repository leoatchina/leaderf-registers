" ============================================================================
" File:        leaderf-registers.vim
" Description:
" Author:      leo <leoatchina@outlook.com>
" Website:     https://github.com/leoatchina
" Note:
" License:     Apache License, Version 2.0
" ============================================================================

if !exists("g:Lf_Extensions")
    let g:Lf_Extensions = {}
endif

let g:Lf_Extensions.registers = {
        \ "source": "leaderf#registers#source",
        \ "highlights_def": {
        \   "Lf_hl_RegistersText": '^\W\s\+\S\+',
        \ },
        \ "highlights_cmd": [
        \   "hi link Lf_hl_RegistersText Text",
        \ ],
        \ "accept": "leaderf#registers#getreg",
        \ "arguments": [
            \ { "name": ["--visual", "-V"], "nargs": 0},
            \ { "name": ["--insert", "-I"], "nargs": 0},
          \ ]
\ }

command! -bar -nargs=* LeaderfPaste  Leaderf registers
command! -bar -nargs=* LeaderfPasteV Leaderf registers -V
command! -bar -nargs=* LeaderfPasteI Leaderf registers -I
