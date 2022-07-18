" source vim
noremap <silent> <leader>rr :so %<cr>

" change background
noremap <silent> <leader>bd :set background=dark<cr>
noremap <silent> <leader>bl :set background=light<cr>

" toggle dark mode
noremap <silent> <leader>im :ToggleDarkMode()<cr>

" cd cwd
" # see :help expand
noremap  <leader>cd :cd %:h<cr> :pwd<cr>

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
noremap <silent> <silent> <C-<> :vertical resize -3<cr>
noremap <silent> <silent> <C->> :vertical resize +3<cr>
"       rotate
noremap <silent> <leader>ws :wincmd r<cr>
noremap <silent> <leader>wh :wincmd H<cr>
noremap <silent> <leader>wv :wincmd J<cr>
"				swap
noremap <silent> <leader>mw :call MarkWindowSwap()<CR>
noremap <silent> <leader>sp :call DoWindowSwap()<CR>
"				fullscreen
nnoremap <silent> <leader>zo :ZoomToggle<CR>

<<<<<<< Updated upstream
" explorer
nmap <space>en :CocCommand explorer --preset nvim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>
nmap <space>eb :CocCommand explorer --preset buffer<CR>
nmap <space>es :CocCommand explorer --preset scale<CR>
nmap <space>el :CocList explPresets<CR>
=======
" floating terminal
noremap <silent> <leader>tt :FloatermNew<cr>

" exit terminal mode
tnoremap <esc> <C-\><C-n>:q!<cr>
>>>>>>> Stashed changes

" follow scroll with cursor
map <C-y> <C-y>k
map <C-e> <C-e>j

" buffers
nmap <leader>bp :bp<cr>
nmap <leader>bn :bn<cr>
<<<<<<< Updated upstream
nmap <leader>bd :bd!<cr>
=======
>>>>>>> Stashed changes

" start a substitute
nmap <leader>ss :%s/\v
" substitute cword
nmap <leader>sw :%s#<C-r>=expand("<cword>")<cr>#

" find cword
nmap <leader>fw /<C-r>=expand("<cword>")<cr><cr>
" dehighlight find results
nmap <silent> <esc><esc> :noh<cr>

" yank line-block
map Y yy

" coc goto definition
nmap <silent>gd <Plug>(coc-definition)
"					 type-definition
nmap <silent>gy <Plug>(coc-type-definition)
"					 implementation
nmap <silent>gi <Plug>(coc-implementation)
"					 references
nmap <silent>gr <Plug>(coc-references)
"			show hints
nmap <leader>ch <Plug>(coc-codeaction)
"			quick fix
nmap <space>qf <Plug>(coc-fix-current)
"			restart ts-server
nmap <leader>tr :CocCommand tsserver.restart<cr>
"			explorer
nmap <space>en :CocCommand explorer --preset nvim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>
nmap <space>eb :CocCommand explorer --preset buffer<CR>
nmap <space>es :CocCommand explorer --preset scale<CR>
nmap <space>el :CocList explPresets<CR>

" comment line
map ,, gcc
vmap ,, gc
