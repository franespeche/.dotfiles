let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-lua', 'coc-yaml', 'coc-explorer']

set updatetime=300
set shortmess+=c				" dont pass messages to ins-completion-menu
set signcolumn=yes			" always show the sign column, otherwise it would shift the text each time
												" diagnostics appear/become resolved
"let g:coc_fzf_preview = ''
"let g:coc_fzf_opts = []

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Show all diagnostics
nnoremap <silent> <leader>cc  :<C-u>CocFzfList diagnostics<cr>
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nnoremap <silent> <leader>ce  :<C-u>CocDiagnostics<cr>
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)zz
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
"nmap <silent> gi <Plug>(coc-implementation)

" either doHover or show documentation in preview window
nnoremap <silent><leader>ck :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>caap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" apply autofix to problem on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <leader>cr :CocRestart<cr> 

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>
" the above was specified differently in coc's documentation
" Run the Code Lens action on the current line.
" nmap <leader>cl  <Plug>(coc-codelens-action)

" Use `:Prettier` to format current buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Show commands
" nnoremap <silent> <space>c  :<C-u>CocFzfList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocFzfList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocFzfList symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cn  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <leader>cp  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocFzfListResume<CR>

highlight link CocHighlightText Visual


" restart ts-server
nmap <leader>tr :CocCommand tsserver.restart<cr>

" show hints
nmap <leader>ch <Plug>(coc-codeaction)
" quick fix
nmap <leader>qf <Plug>(coc-fix-current)

" goto definition
nmap gd <Plug>(coc-definition)
"      type-definition
nmap <silent>gy <Plug>(coc-type-definition)
"      implementation
nmap <silent>gi <Plug>(coc-implementation)
"      references
nmap <silent>gr <Plug>(coc-references)

" explorer
nmap <silent> <space>en :CocCommand explorer --preset nvim<CR>
nmap <silent> <space>ef :CocCommand explorer --preset floating<CR>

" refresh
" nmap <Leader>er <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>
" nmap <space>ei :CocCommand explorer --preset init_vim<CR>
" nmap <space>eb :CocCommand explorer --preset buffer<CR>

" highlight symbol under cursoron CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" enable JSX syntax highlighing in javascript files
let g:jsx_ext_required = 0 

" commented out 02/15/23
" attempt to refresh coc-explorer on BufEnter
" Sure the following script is called after CocExplorerOpenPost
" function s:explorer_inited()
" 	autocmd BufEnter * if (&filetype != 'coc-explorer') | exe 'silent! let dir = getcwd()'
"   autocmd BufEnter call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>
"	" autocmd BufEnter * call CocAction("runCommand", "explorer.doAction", "closest", {"name": "cd", "args": [dir]})
" endfunction
" autocmd User CocExplorerOpenPost call s:explorer_inited()
"
"
"

