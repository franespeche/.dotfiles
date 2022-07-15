let g:mapleader = ","

set mouse=a												" enable mouse scroll

set encoding=UTF-8								" encoding

set cmdheight=2										" cmd height

set shortmess+=c									" dont pass messages to |ins-completion-menu|

set tabstop=2											" indentation
set softtabstop=2 noexpandtab
set shiftwidth=2

set autoread											" read files upon being changed from outside vim

set clipboard=unnamedplus 				" use all clipboards

set undolevels=2000     					" numbers of undo
set undofile            					" persist undo

set hidden												" don't prompt for save when leaving an unsaved buffer

set wildmode=list:full						" autocomplete first occurence
set wildignore=.git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**

set number												" show line numbers
set ruler													" show cursor position
set cursorline

set ignorecase										" case-insensitive search
set smartcase											" case=sensitive if expression contains a capital letter
set showmatch											" show matching char (like {})
set wrapscan											" cycle search

set nowrap												" no line wrapping
set scrolloff=8                 	" Show 7 lines of context around the cursor.
set sidescrolloff=8

highlight Comment cterm=italic  	" italic comments

" set shortmess+=c             		" Do not show 'match xx of xx' and other messages during auto-completion
set noswapfile

set fillchars=fold:/,diff:⣿
" set fillchars+=vert:\

set gdefault											" s///g default

set splitbelow										" open split lanes to right and bottom
set splitright
