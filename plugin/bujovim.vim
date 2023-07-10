" vim: set fdm=marker:
" Bullet journal variables {{{1
" Override default icons for Bullet journal {{{2
let g:bullet_journal_extension = get(g:, 'bulletjournalextension',    'markdown')
let bujodefaulticons=['\.', 'x', 'o','\*', '\!', '\-\-', '»', '«', '+']
let j=0

if exists('g:bujoicons')
  while j<9
    let bujodefaulticons[j]=g:bujoicons[j]
    let j=j+1
  endwhile
endif

let g:bulletjournalicons=bujodefaulticons

" echo g:bulletjournalicons


" Override default filetype for Bullet journal {{{2
" if g:bullet_journal_extension=='markdown'
"   echo 'markdown settings loaded'
"   let g:bujovimheader='\#'
" elseif g:bullet_journal_extension=='rmarkdown'
"   echo 'rmarkdown settings loaded'
"   let g:bujovimheader='\#'
" elseif g:bullet_journal_extension =='vimwiki'
"   echo 'vimwiki settings loaded'
"   let g:bujovimheader='\='
" elseif g:bullet_journal_extension =='wiki'
"   echo 'wiki.vim settings loaded'
"   let g:bujovimheader='\#'
" elseif g:bullet_journal_extension == 'org'
"   echo 'orgmode settings loaded'
"   let g:bujovimheader='\*'
" else
"   echo 'markdown settings loaded'
"   let g:bujovimheader='\#'
" endif
" Bullet journal functions to add {{{1
" Picker for note type {{{2

fun! BulletJournalnotepicker(args)
  let currline = getline('.')
  let argspl=split(a:args, ' ')
  " echo argspl
  if currline =~ '^- \[ \]'
    if argspl[0] == 'task'
      exe 'substitute /- \[ \]/- \[ \] ' . g:bulletjournalicons[0] . ' /'
      echo 'task issue added'
    elseif argspl[0] == 'completedtask'
      exe  'substitute /- \[ \]/- \[ \]' . g:bulletjournalicons[1] . ' /'
    elseif argspl[0] == 'event'
      exe  'substitute /- \[ \]/- \[ \]' . g:bulletjournalicons[2] . ' /'
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
  normal $
endf

nnoremap <Leader>bu<Leader>t :call BulletJournalnotepicker('task')<CR>
" Vim highlight attempt {{{2

hi def BulletJournal1 ctermfg=yellow guifg=yellow 
hi def BulletJournal2 ctermfg=green guifg=green 
hi def BulletJournal3 ctermfg=yellow guifg=yellow
hi def BulletJournal4 ctermfg=green guifg=green 
hi def BulletJournal5 ctermfg=yellow guifg=green 
hi def BulletJournal6 ctermfg=yellow guifg=green 
hi def BulletJournal7 ctermfg=blue guifg=blue 
hi def BulletJournal8 ctermfg=blue guifg=blue 
hi def BulletJournal9 ctermfg=red guifg=red 

" au Bufenter *.org  AirlineRefresh

fun! CallHighlight()
  au Bufenter,BufRead *.org call matchadd('BulletJournal1', '\['.g:bulletjournalicons[0].'\]')
  au Bufenter,BufRead *.org call matchadd('BulletJournal2', '\['.g:bulletjournalicons[1].'\]')
  au Bufenter,BufRead *.org call matchadd('BulletJournal3', '\['.g:bulletjournalicons[2].'\]')
  au Bufenter,BufRead *.org call matchadd('BulletJournal4', '\['.g:bulletjournalicons[3].'\]')
  au Bufenter,BufRead *.org call matchadd('BulletJournal5', '\['.g:bulletjournalicons[4].'\]')
  au Bufenter,BufRead *.org call matchadd('BulletJournal6', '\['.g:bulletjournalicons[5].'\]')
  au Bufenter,BufRead *.org call matchadd('BulletJournal7', '\['.g:bulletjournalicons[6].'\]')
  au Bufenter,BufRead *.org call matchadd('BulletJournal8', '\['.g:bulletjournalicons[7].'\]')
  au Bufenter,BufRead *.org call matchadd('BulletJournal9', '\['.g:bulletjournalicons[8].'\]')
endf

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

" Bujo creation and open {{{2

function! OpenBulletJournal()
  let filename = strftime('%Y-%m-%d') . '.org'
  let filepath = g:orgmode_journal_path . filename
  execute 'edit ' . filepath
  let pruebareng1=getline(1)
  " echo pruebareng1
  let pruebareng2=getline(3)
  " echo pruebareng2
  if pruebareng1=~ '* ' . strftime('%Y-%m-%d')
    execute 'normal, G'
    $put = '** ' . strftime('%H:%M') . '                 :org-journal:'
    execute 'm $'
  else
    execute 'normal, gg'
    0put = '* ' . strftime('%Y-%m-%d') . '               :org-journal:'
    $put = '** ' . strftime('%H:%M') . '                 :org-journal:'
  endif  
endfunction

command! -nargs=0 Openbujo call OpenBulletJournal()
" Default keymaps {{{1
nnoremap <Leader>bt :call BulletJournalConvertline()<CR>
nnoremap <Leader>bs :call BulletJournalInsertAppend()<CR>
nnoremap <Leader>bf :call BulletJournalnoteTogglerFoward()<CR> 
nnoremap <Leader>bb :call BulletJournalnoteTogglerBackward()<CR> 

