function! IsDarkMode()
    let os_name = system("uname")
    if match(os_name, 'Darwin') >= 0
        let result = system("defaults read -g AppleInterfaceStyle 2>/dev/null | tr -d '\n'")
        return result ==# 'Dark'
    else
        " Unsupported platform
        return 0
    endif
endfunction

" syntax
if !exists('g:syntax_on')
  syntax on
  let g:syntax_on = 1
endif

" colorscheme
if !exists('g:colors_name')
    if IsDarkMode()
      " silent! colorscheme g:dark_theme
      silent! colorscheme gruvbox
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
