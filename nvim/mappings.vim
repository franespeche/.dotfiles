" source vim
noremap <silent> <leader>rr :so ~/.dotfiles/nvim/init.vim<cr>

" change background
noremap <silent> <leader>bd :set background=dark<cr>
noremap <silent> <leader>bl :set background=light<cr>

" toggle dark mode
noremap <silent> <leader>im :ToggleDarkMode()<cr>

" cd cwd
" see :help expand
noremap <leader>cd :cd %:h<cr> :pwd<cr>

" motion
noremap H ^
noremap L $

" splits create
noremap <silent> <leader>l :vsp<cr>
noremap <silent> <leader>j :sp<cr>
" 	     navigate
noremap <silent> <C-l> :wincmd l<cr>
noremap <silent> <C-h> :wincmd h<cr>
noremap <silent> <C-j> :wincmd j<cr>
noremap <silent> <C-k> :wincmd k<cr>
inoremap <silent> <C-l> <Esc>:wincmd l<cr>
inoremap <silent> <C-h> <Esc>:wincmd h<cr>
inoremap <silent> <C-j> <Esc>:wincmd j<cr>
inoremap <silent> <C-k> <Esc>:wincmd k<cr>
"	      resize
noremap <silent> <leader>wb :wincmd _<cr>
noremap <silent> <leader>wn :wincmd =<cr>
" noremap <silent> < :vertical resize -3<cr>
" noremap <silent> > :vertical resize +3<cr>
"       rotate
noremap <silent> <leader>wr :wincmd r<cr>
noremap <silent> <leader>wh :wincmd H<cr>
noremap <silent> <leader>wv :wincmd J<cr>
"				swap
noremap <silent> <leader>wm :call MarkWindowSwap()<CR>
noremap <silent> <leader>wc :call DoWindowSwap()<CR>
"				fullscreen
nnoremap <silent> <leader>zo :ZoomToggle<CR>

" open floating terminal
noremap <silent> <leader>tt :FloatermNew<cr>

" scroll window
" map <C-y> <C-y>k
" map <C-e> <C-e>j
map <S-j> 2<C-e>2j
map <S-k> 2<C-y>2k

" buffers
" nmap <space>nn :b#<cr>
nmap <leader>bp :bp<cr>
nmap <leader>bn :bn<cr>

" substitute
nmap <leader>ss :%s/\v
"            word
nmap <leader>sw :%s#<C-r>=expand("<cword>")<cr>#
nmap <leader>iw :'<,'>s#<C-r>=expand("<cword>")<cr>#
"            selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" dehighlight find results
nmap <silent> <esc><esc> :noh<cr>
" find cword
nmap <leader>fw /<C-r>=expand("<cword>")<cr><cr>

" yank line-block
map Y yy

" comment line
map ,, gcc
vmap ,, gc

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" vim fuvitive
nnoremap <leader>gb <cmd>Git blame<cr>

" toggle wrap
nnoremap <leader>zz <cmd>set wrap!<cr>

" vim-plug
nnoremap <leader>pi <cmd>PlugInstall<cr>
nnoremap <leader>pc <cmd>PlugClean<cr>

" quit
map Q :q!<cr>

" change directory
nnoremap <leader>cdm <cmd>cd ~/.dotfiles/nvim<cr>

" unbind space
map <space> <Nop>

" move to first WORD befor current opening bracket
nnoremap <space>b F(b
nnoremap <space><S-b> F(B

" indenting behavior
vnoremap < <V
vnoremap > >V
