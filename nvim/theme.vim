" colorscheme gruvbox
" dark mode
" highlight CocHighlightText guibg=Grey40
" light mode
" set background=light

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
syntax match jsCommentCheck /^\s*[\/\/|"]\s*check!.*/
hi jsCommentCheck guifg=white guibg=#b95d76

" note: this was in settings.vim
autocmd FileType json syntax match Comment +\/\/.\+$+

highlight Directory guifg=#549699
" hi Directory ctermfg=109 guifg=Cyan

" custom
syntax match fbCollections /collection/
hi fbCollections guifg=#E9BD15
syntax match fbSubCollections /sub-collection/
hi fbSubCollections guifg=#E9BD15
syntax match fbDocuments /document/
hi fbDocuments guifg=#FA8072
