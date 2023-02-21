" colorscheme gruvbox
" dark mode
highlight CocHighlightText guibg=Grey40
" light mode
" set background=light
" highlight CocHighlightText ctermbg=7 guibg=Grey90

" if &background!=dark
"   set background=dark
"   endif

" syntax
if !exists('g:syntax_on')
  syntax on
  let g:syntax_on = 1
endif

" colorscheme
if !exists('g:colors_name')
  silent! colorscheme gruvbox
  " silent! colorscheme dayfox

endif

" termguicolors
if !&termguicolors
  set termguicolors
endif

" Italics
let g:one_allow_italics = 1
highlight Comment cterm=italic  	

" format "check!" comments
:syntax match jsCommentCheck /^\s*[\/\/|"]\s*check!.*/
:hi jsCommentCheck guifg=white guibg=#b95d76

" check! holas
