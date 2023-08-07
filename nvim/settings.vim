let g:mapleader = ","

set mouse=a                       " enable mouse scroll

set encoding=UTF-8                " encoding

set cmdheight=2                   " cmd height

set shortmess+=c                  " dont pass messages to |ins-completion-menu|

set tabstop=2                     " indentation
set softtabstop=2 expandtab
set shiftwidth=2

augroup VimFiles
  autocmd!
  " match github's tabulation's width
  autocmd FileType vim setlocal shiftwidth=4 softtabstop=4

augroup end

set autoread                      " read files upon being changed from outside vim

set clipboard=unnamedplus         " use all clipboards

set undolevels=2000               " numbers of undo
set undofile                      " persist undo

set hidden                        " don't prompt for save when leaving an unsaved buffer

set wildmode=list:full            " autocomplete first occurence
set wildignore=.git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**

set relativenumber number         " show line numbers
set ruler                         " show cursor position
set cursorline

set ignorecase                    " case-insensitive search
set smartcase                     " case=sensitive if expression contains a capital letter
set showmatch                     " show matching char (like {})
set wrapscan                      " cycle search

set nowrap                        " no line wrapping
set scrolloff=11                  " Show 11 lines of context around the cursor.
set sidescrolloff=11


set t_Co=256                      " set colors

" set shortmess+=c                " Do not show 'match xx of xx' and other messages during auto-completion
set noswapfile

set fillchars=fold:/,diff:⣿
" set fillchars+=vert:\

set gdefault                      " s///g default

set splitbelow                    " open split lanes to right and bottom
set splitright

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set foldenable
set foldmethod=syntax
set foldlevel=99                  " don't fold by default when first opening a file

let g:typescript_ignore_typescriptdoc=1
" https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file
" To get correct comment highlighting, you can install vim-jsonc (which has built-in support for coc-settings.json), or even simply add:
autocmd FileType json syntax match Comment +\/\/.\+$+

" got from vim's rust plugin docs
syntax enable
filetype plugin indent on
