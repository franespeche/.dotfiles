map Y yy

" motion
noremap H ^
noremap L $
nmap ! :!
map <leader>ww :wincmd w<cr>

" splits navigation
noremap <C-h> :wincmd h<cr>
noremap <C-j> :wincmd j<cr>
noremap <C-k> :wincmd k<cr>
noremap <C-l> :wincmd l<cr>

" splits resizing
noremap <silent> <C-<> :vertical resize -3<cr>
noremap <silent> <C->> :vertical resize +3<cr>
noremap <silent> <leader>f :wincmd _<cr>
noremap <silent> <leader>F :wincmd =<cr>
" noremap <silent> <leader>tt :50vs term://zsh<cr>

" change 2 split windows from vert to horizontal and vice versa
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

map <C-y> <C-y>k
map <C-e> <C-e>j

" map <leader>ww :wincmd w<cr>
" map <leader>wh :wincmd h<cr>
" map <leader>wj :wincmd j<cr>
" map <leader>wk :wincmd k<cr>
" map <leader>wl :wincmd l<cr>

" buffers
nmap <leader>md :b#<cr>                         " Previous buffer
nmap <leader>wd :bd<cr>                         " delete buffer
nmap <leader>wD :!rm %<cr>:bd!<cr>              " delete buffer and file
"
" Copy current file path to registers \"* and \"+
nmap <leader>cp :let @*=@%<cr>:let @+=@%<cr>

" Start a substitute
nmap <leader>ss :%s/\v

" Pull word under cursor into LHS of a substitute (for quick search and replace)
nmap <leader>zs :%s#<C-r>=expand("<cword>")<cr>#

" Yank from the cursor to the end of the line, to be consistent with C and D.
"nnoremap Y y$

" Use space as " shortcut
nmap <space> "
vmap <space> "


" no wrap
nnoremap <silent> <leader>nw :set nowrap!<cr>

" Clear search highlight
nmap <silent> <leader>/ :nohl<cr>

" comments
map <leader>, gcc
vmap <leader>, gc

" swap two words (from ornicar)
" nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'
" nmap <silent> gW :s/\(\%#[^\s]\+\)\(\_W\+\)\([^\s]\+\)/\3\2\1/<CR>`'

" taken from https://pragmaticpineapple.com/ultimate-vim-typescript-setup/
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
