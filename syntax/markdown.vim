

syn keyword Abujournal contained
hi Abujournal ctermfg=red guifg=red



syntax match org_list_checkbox /\[[ X-o\.\*\+\>\<\!]]/ contained
syntax match bujoitems "\[!\]"
syntax match bujoitems "\[>\]"
syntax match bujoitems "\[<\]"
syntax match bujoitems "\[+\]"
syntax match bujoitems "\[.\]"
syntax match bujoitems "\[*\]"
hi def link org_list_bullet Identifier
hi def link bujoitems Keyword
