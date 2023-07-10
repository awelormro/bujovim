syn keyword Abujournal contained
hi Abujournal ctermfg=red guifg=red

" Unordered lists
syn match pandocUListItem /^>\=\s*[*+-]\s\+-\@!.*$/ nextgroup=pandocUListItem,pandocLaTeXMathBlock,pandocLaTeXInlineMath,pandocEscapedDollar,pandocDelimitedCodeBlock,pandocListItemContinuation contains=@Spell,pandocEmphasis,pandocStrong,pandocNoFormatted,pandocStrikeout,pandocSubscript,pandocSuperscript,pandocStrongEmphasis,pandocStrongEmphasis,pandocPCite,pandocICite,pandocCiteKey,pandocReferenceLabel,pandocLaTeXCommand,pandocLaTeXMathBlock,pandocLaTeXInlineMath,pandocEscapedDollar,pandocReferenceURL,pandocAutomaticLink,pandocFootnoteDef,pandocFootnoteBlock,pandocFootnoteID,bujoitems,pandocAmpersandEscape skipempty display


syntax match org_list_checkbox /\[[ X-o\.\*\+\>\<\!]]/ contained
syntax match bujoitems "\[!\]"
syntax match bujoitems "\[>\]"
syntax match bujoitems "\[<\]"
syntax match bujoitems "\[+\]"
syntax match bujoitems "\[.\]"
syntax match bujoitems "\[*\]"
hi def link bujoitems type
