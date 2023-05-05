
hi def BulletJournal1 ctermfg=yellow guifg=yellow 
hi def BulletJournal2 ctermfg=green guifg=green 
hi def BulletJournal3 ctermfg=yellow guifg=yellow
hi def BulletJournal4 ctermfg=green guifg=green 
hi def BulletJournal5 ctermfg=yellow guifg=green 
hi def BulletJournal6 ctermfg=yellow guifg=green 
hi def BulletJournal7 ctermfg=green guifg=green 

let bujostr1 = '\[' . g:bulletjournalicons[0] . '\]'
" for index in g:bulletjournalicons
"   au BufRead *.org echo index
" endfor
execute 'au BufRead \*.org syn match BulletJournal1 \/' . bujostr1  . '\/'
echo bujostr1  

" au BufRead *.org syn match BulletJournal1 /\[\.\]/
