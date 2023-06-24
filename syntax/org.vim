
syn keyword Abujournal contained
hi Abujournal ctermfg=red guifg=red



syntax match org_list_checkbox /\[[ X-o\.\*\+\>\<\!]]/ contained
syntax match bujoitems "\[!\]"
syntax match bujoitems "\[>\]"
syntax match bujoitems "\[<\]"
syntax match bujoitems "\[+\]"
syntax match bujoitems "\[.\]"
syntax match bujoitems "\[*\]"
syntax match org_list_item /.*$/ contained contains=org_subtask_percent,org_subtask_number,org_subtask_percent_100,org_subtask_number_all,org_list_checkbox,org_bold,org_italic,org_underline,org_code,org_verbatim,org_timestamp,org_timestamp_inactive,org_list_def,texDelimiter
hi def link org_list_bullet Identifier
hi def link bujoitems type
