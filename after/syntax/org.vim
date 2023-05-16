syntax match MiGrupo /\v(\bArriba\b|\bel\b|\bToluca\b)/
syntax match Migrupo1 "- \[\.\]"
syntax match Migrupo1 "\t- \[ \] \[\.\]"
syntax match Migrupo1 "\s- \[\.\]"
syntax match Migrupo1 "\t- \[\.\]"
syntax match Migrupo1 "^- \[\.\]"
syntax match Migrupo1 "*- \[\.\]"
syntax match Migrupo2 /\[\>\]/
" highlight MiGrupo1 guifg=red ctermfg=red ctermbg=black gui=bold cterm=bold
hi def link MiGrupo1 PreProc
highlight Migrupo2 guifg=red ctermfg=red ctermbg=black gui=bold cterm=bold
syn keyword Macro Abujournal
syn keyword Macro \[\.\]
" [>]
