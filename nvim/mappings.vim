" source vim
noremap <silent> <leader>rr :so ~/.dotfiles/nvim/init.vim<cr>

" change background
" noremap <silent> <leader>bd :set background=dark<cr>
" noremap <silent> <leader>bl :set background=light<cr>

" toggle dark mode
" noremap <silent> <leader>im :ToggleDarkMode()<cr>

" cd cwd
" see :help expand
noremap <leader>cd :cd %:h<cr> :pwd<cr>

" motion
noremap H ^
noremap L $

" open new tab
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>

" execute :norm command
xnoremap <leader>n :norm 

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

" faster selection
vnoremap <S-j> 2j
vnoremap <S-k> 2k

" move to start or end of block in visual mode
xnoremap <space>j %
xnoremap <space><S-k> %

nnoremap <leader><S-j> :call ChangeScrollMode()<cr>
nnoremap <leader><S-k> :call ChangeScrollMode()<cr>

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
vnoremap <leader>sw :<C-u>%s#\%V<C-r>=expand("<cword>")<cr>#
" nnoremap <leader>iw :'<,'>s#<C-r>=expand("<cword>")<cr>#

" search within selection
vnoremap / <ESC>/\%V
" search selected text
vnoremap // y/<C-R>=escape(@",'/\')<CR>
" find cword
" nmap <leader>fw /<C-r>=expand("<cword>")<cr><cr>

" unhighlight find results
nmap <silent> <esc><esc> :noh<cr>

" yank line-block
map Y yy

" comment line
map ,, gcc

" vim fuvitive
nnoremap <leader>gb <cmd>Git blame<cr>

" toggle wrap
nnoremap <leader>zz <cmd>set wrap!<cr>

" vim-plug
nnoremap <leader>pi <cmd>PlugInstall<cr>
nnoremap <leader>pc <cmd>PlugClean<cr>

" fold everything but selection
" got from https://stackoverflow.com/questions/674613/vim-folds-for-everything-except-something
vnoremap <Leader>za <Esc>`<kzfgg`>jzfG`<

" save, quit
map ;q :q<cr>
map ;<C-q> :q!<cr>
map ;w :w<cr>

" unbind space
map <space> <Nop>

" move to first WORD before current opening bracket
noremap <space><S-b> F(B
noremap <space>b F(b

" indenting behavior
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" do not insert comment after pressing 'o'
nnoremap <space>o o<C-u>
nnoremap <space>O O<C-u>

" open this file in a new split
nnoremap <space>em :e ~/.dotfiles/nvim/mappings.vim<cr>

" exec current line (helpful for debugging)
nnoremap <leader>e :exe getline(line('.'))<cr>

" repeat last substitution
nnoremap <leader>. :&&<cr>

" yank into custom ("a") register
noremap <space>y "ay
noremap <space>p "ap

" expand current dir
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" toggle line numbers
nnoremap <leader>sn :set relativenumber!<cr>

" toggle auto-pairs
noremap <C-n> <Esc>:call AutoPairsToggle()<cr>
inoremap <C-n> <Esc>:call AutoPairsToggle()<cr>a

" go to first function in main column
" see :h [[
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

nmap vi/ :1,.v?^\s*/?<cr>jV:<C-u>.,18v#^\s*/#<cr>k
nnoremap vi/ <Nop>
nnoremap vi/ V

" cycle through methods or keys in an object
map [m [mzt
map ]m ]mzt

nnoremap <space>J J
inoremap <C-o> <Esc>o

" Bufstop
nnoremap <leader>b :Bufstop<cr>
" nnoremap <leader>b :BufstopFast<cr>
nnoremap <leader><Tab> :BufstopBack<cr>
nnoremap <leader><Space><Tab> :BufstopForward<cr>
" buffers
" nmap <space>nn :b#<cr>
nnoremap <space>{ :bp<cr>
nnoremap <space>} :bn<cr>


imap <C-h> <Esc>ha
imap <C-l> <Esc>la
imap <C-j> <Esc>ja
imap <C-k> <Esc>ka


" function! s:explorer_is_opened()
"   " let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 'closest')
"   return CocAction('runCommand', 'explorer.getNodeInfo', 'closest')

" function! s:explorer_cur_dir()
"   let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
"   return fnamemodify(node_info['fullpath'], ':h')
" endfunction

" function! s:exec_cur_dir(cmd)
"   let dir = s:explorer_cur_dir()
"   execute 'cd ' . dir
"   execute a:cmd
" endfunction
" augroup CocExplorerRefreshDir
"   autocmd!
"   autocmd BufEnter * call <SID>explorer_refresh_dir()
" echo node_info
