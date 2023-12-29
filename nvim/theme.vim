" syntax
if !exists('g:syntax_on')
  syntax on
  let g:syntax_on = 1
endif

" colorscheme
if !exists('g:colors_name')
    if g:is_dark_mode
    echo "dark"
      " silent! colorscheme g:dark_theme
      silent! colorscheme gruvbox
      highlight Search cterm=None ctermfg=214 ctermbg=235 gui=None guifg=#2f2f2f guibg=#abb66f

    else
      " silent! colorscheme g:light_theme
      silent! colorscheme dayfox
    endif
endif


" termguicolors
if !&termguicolors
  set termguicolors
endif

" Italics
let g:one_allow_italics = 1
highlight Comment cterm=italic  	

" note: this was in settings.vim
autocmd FileType json syntax match Comment +\/\/.\+$+

highlight Directory guifg=#549699

" custom
syntax match fbCollections /collection/
hi fbCollections guifg=#E9BD15
syntax match fbSubCollections /sub-collection/
hi fbSubCollections guifg=#E9BD15
syntax match fbDocuments /document/
hi fbDocuments guifg=#FA8072
