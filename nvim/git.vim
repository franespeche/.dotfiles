"
" env
"
" lazygit
let g:lazygit_floating_window_scaling_factor = 1

"
" mappings
"
" open tooltip with commit info
nnoremap <silent> <leader>gm :GitMessenger<cr>
" get link with the selected range (in visual mode) or to the file (in normal mode)
nnoremap <silent> <leader>gl :GBrowse<cr>
vnoremap <silent> <leader>gl :GBrowse<cr>
" git blame [vim fuvitive]
nnoremap <leader>gb <cmd>Git blame<cr>
" open lazygit
nnoremap <silent> <leader>gg :cd %:h<cr> :LazyGit<cr>
