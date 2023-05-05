" vim: set fdm=marker:
echo 'bullet journal loaded'

" Bullet journal functions to add {{{1
" Picker for note type {{{2
" let g:bulletjournalicons=['t', 'd', 'o','a', 'u', 'I', 'p', 'q', 'n']

fun! BulletJournalnotepicker(args)
  let currline = getline('.')
  let argspl=split(a:args, ' ')
  echo argspl
  if currline =~ '- \[ \] '
    if argspl[0] == 'task'
      exe 'substitute /- \[ \] /- \[ \]' . g:bulletjournalicons[0] . ' /'
    endif
    elseif argspl[0] == 'completedtask'
      exe  'substitute /- \[ \] /- \[ \]' . g:bulletjournalicons[1] . ' /'
    elseif argspl[0] == 'event'
      exe  'substitute /- \[ \] /- \[ \]' . g:bulletjournalicons[2] . ' /'
    elseif argspl[0] == 'important'
      exe  'substitute /- \[ \] /- \[ \]' . g:bulletjournalicons[3] . ' /'
    elseif argspl[0] == 'idea'
      exe  'substitute /- \[ \] /- \[ \]' . g:bulletjournalicons[4] . ' /'
    elseif argspl[0] == 'irrelevant'
      exe  'substitute /- \[ \] /- \[ \]' . g:bulletjournalicons[5] . ' /'
    elseif argspl[0] == 'migrate1'
      exe  'substitute /- \[ \] /- \[ \]' . g:bulletjournalicons[6] . ' /'
    elseif argspl[0] == 'migrate2'
      exe  'substitute /- \[ \] /- \[ \]' . g:bulletjournalicons[7] . ' /'
    elseif argspl[0] == 'discuss'
      exe  'substitute /- \[ \] /- \[ \]' . g:bulletjournalicons[8] . ' /'
    endif
  endif
endf
" Vim highlight attempt {{{2

hi def BulletJournal1 ctermfg=yellow guifg=yellow 
hi def BulletJournal2 ctermfg=green guifg=green 
hi def BulletJournal3 ctermfg=yellow guifg=yellow
hi def BulletJournal4 ctermfg=green guifg=green 
hi def BulletJournal5 ctermfg=yellow guifg=green 
hi def BulletJournal6 ctermfg=yellow guifg=green 
hi def BulletJournal7 ctermfg=green guifg=green 

" augroup longLines
  " autocmd!
  " au Bufenter *.org  match BulletJournal1 /\[\.\]/
  au Bufenter *.org  AirlineRefresh
" augroup END

" Bullet journal Toggle icon {{{2
" Bullet toggle forward {{{3
fun! BulletJournalnoteTogglerFoward()
  let currline = getline('.')
  if currline =~ '- \[ \] \['
    let cont=0
    while cont<=len(g:bulletjournalicons)-1
      let comp = '- \[ \] \[' . g:bulletjournalicons[cont] . '\] '
      let comprev='- \[ \] \[' . g:bulletjournalicons[cont-1] . '\] ' 
      " let compnext='- \[ \] \[' . g:bulletjournalicons[cont+1] . '\] '
      if currline =~ comprev
        exe 'substitute /'. comprev . '/' . comp
        break
      elseif cont==len(g:bulletjournalicons)-1
        exe 'substitute /' . comprev . '- \[ \] \[' . g:bulletjournalicons[0] . '\] ' 
      endif
      let cont = cont+1
    endwhile
  endif
endf
" Bullet toggle backward {{{3
fun! BulletJournalnoteTogglerBackward()
  let currline = getline('.')
  if currline =~ '- \[ \] \['
    let cont=0
    while cont<=len(g:bulletjournalicons)-1
      let comp = '- \[ \] \[' . g:bulletjournalicons[cont] . '\] '
      let comprev='- \[ \] \[' . g:bulletjournalicons[cont-1] . '\] ' 
      if currline =~ comp
        exe 'substitute /'. comp . '/' . comprev
        break
      endif
      let cont = cont+1
    endwhile
  endif
endf

" Bullet Journal append {{{2 
fun! BulletJournalInsertAppend()
  let currline = getline('.')
  if currline != "- [ ]" ||  '- \[X\]'
   normal o- [ ] [.]
   normal ==
   normal A
  endif
endf
" Bulllet Journal Convert line {{{2
fun! BulletJournalConvertline()
  let currline = getline('.')
  if currline != "- [ ]" ||  '- \[X\]' 
    normal 0wi- [ ] [.] 
    normal ==
  endif
endf

" Conceal attempts {{{2

" Default keymaps {{{1
nnoremap <Leader>bs :call BulletJournalInsertAppend()<CR>
nnoremap <Leader>bf :call BulletJournalnoteTogglerFoward()<CR> 
nnoremap <Leader>bb :call BulletJournalnoteTogglerBackward()<CR> 
