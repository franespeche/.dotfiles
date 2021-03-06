" source vim
noremap <silent> <leader>rr :so %<cr>

" change background
noremap <silent> <leader>bd :set background=dark<cr>
noremap <silent> <leader>bl :set background=light<cr>

" toggle dark mode
noremap <silent> <leader>im :ToggleDarkMode()<cr>

" cd cwd
" # see :help expand
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
noremap <silent> <leader>mw :call MarkWindowSwap()<CR>
noremap <silent> <leader>sp :call DoWindowSwap()<CR>
"				fullscreen
nnoremap <silent> <leader>zo :ZoomToggle<CR>

" open floating terminal
noremap <silent> <leader>tt :FloatermNew<cr>
"      bottom terminal
" noremap <silent> <leader>tj :split | resize 10 | terminal<cr>
" exit terminal
"tnoremap <Esc><Esc> <C-\><C-n> 

" explorer
nmap <space>en :CocCommand explorer --preset nvim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>
nmap <space>eb :CocCommand explorer --preset buffer<CR>

" scroll window
map <C-y> <C-y>k
map <C-e> <C-e>j

" buffers
" nmap <space>nn :b#<cr>
nmap <leader>bp :bp<cr>
nmap <leader>bn :bn<cr>

" substitute
nmap <leader>ss :%s/\v
" substitute word
nmap <leader>sw :%s#<C-r>=expand("<cword>")<cr>#

" dehighlight find results
nmap <silent> <esc><esc> :noh<cr>
" find cword
nmap <leader>fw /<C-r>=expand("<cword>")<cr><cr>

" restart ts-server
nmap <silent> <space>tr :CocCommand tsserver.restart<cr>

" yank line-block
map Y yy

" show hints
nmap <leader>ch <Plug>(coc-codeaction)
" quick fix
nmap <leader>qf <Plug>(coc-fix-current)

" goto definition
nmap <silent>gd <Plug>(coc-definition)
"      type-definition
nmap <silent>gy <Plug>(coc-type-definition)
"      implementation
nmap <silent>gi <Plug>(coc-implementation)
"      references
nmap <silent>gr <Plug>(coc-references)

" comment line
map ,, gcc
vmap ,, gc

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
