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
" splits navigate
noremap <silent> <C-l> :wincmd l<cr>
noremap <silent> <C-h> :wincmd h<cr>
noremap <silent> <C-j> :wincmd j<cr>
noremap <silent> <C-k> :wincmd k<cr>
inoremap <silent> <C-l> <Esc>:wincmd l<cr>
inoremap <silent> <C-h> <Esc>:wincmd h<cr>
inoremap <silent> <C-j> <Esc>:wincmd j<cr>
inoremap <silent> <C-k> <Esc>:wincmd k<cr>
"	splits resize
" noremap <silent> <leader>wb :wincmd _<cr>
" noremap <silent> <leader>wn :wincmd =<cr>
" noremap <silent> < :vertical resize -3<cr>
" noremap <silent> > :vertical resize +3<cr>
" splits rotate
noremap <silent> <leader>wr :wincmd r<cr>
noremap <silent> <leader>wh :wincmd H<cr>
noremap <silent> <leader>wv :wincmd J<cr>
"	splits swap
noremap <silent> <leader>wm :call MarkWindowSwap()<CR>
noremap <silent> <leader>wc :call DoWindowSwap()<CR>
"	splits fullscreen
nnoremap <silent> <leader>zo :ZoomToggle<CR>

" open floating terminal
noremap <silent> <leader>tt :FloatermNew<cr>

" scroll window
" map <C-y> <C-y>k
" map <C-e> <C-e>j
nnoremap <S-j> 2<C-e>2j
nnoremap <S-k> 2<C-y>2k

" buffers
" nmap <space>nn :b#<cr>
nmap <leader>bp :bp<cr>
nmap <leader>bn :bn<cr>

" start a substitute
nnoremap <leader>ss :%s#\v
" start a substitute inside the selected range only
vnoremap <leader>ss :<C-u>%s#\%V\v
" subsitute word under " register
nnoremap <leader><space>s :<C-u>%s#<C-r>"#
" subsitute word under " register inside the selected range
vnoremap <leader><space>s :<C-u>%s#\%V\v<C-r>"#
" substitute cword
nnoremap <leader>sw :%s#<C-r>=expand("<cword>")<cr>#
" nnoremap <leader>iw :'<,'>s#<C-r>=expand("<cword>")<cr>#

" search within selection
vnoremap / <ESC>/\%V
" search selected text
" vnoremap // y/<C-R>=escape(@",'/\')<CR>
" find cword
" nmap <leader>fw /<C-r>=expand("<cword>")<cr><cr>

" unhighlight find results
nmap <silent> <esc><esc> :noh<cr>

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
map Q :q<cr>
map <space>Q :q!<cr>

" unbind space
map <space> <Nop>

" move to first WORD before current opening bracket
noremap <space>b F(b
noremap <space><S-b> F(B

" indenting behavior
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" autopairs toggle
noremap <leader>' :call AutoPairsToggle()<cr>

" do not insert comment after pressing 'o'
nnoremap <space>o o<C-u>

" open this file in a new split
nnoremap <space>em :vs ~/.dotfiles/nvim/mappings.vim<cr>

" exec current line (helpful for debugging)
nnoremap <leader>e :exe getline(line('.'))<cr>

" try/catch snippet
inoremap ;tc try {} catch (err: any) {}<ESC>^f{a<cr><cr><esc>k

" repeat last substitution
nnoremap <leader>. :&&<cr>

" yank into custom ("a") register
noremap <space>y "ay
noremap <space>p "ap

" move to start or end of block in visual mode
vnoremap <S-j> %
vnoremap <S-k> %

" got from @ornicar
" expand current filed dir in console mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" toggle line numbers
nnoremap <leader>sn :set relativenumber!<cr>
