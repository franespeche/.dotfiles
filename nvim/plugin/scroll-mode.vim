
" set default scroll mode to "0"
" if !exists("g:scrollMode")
  " let g:scrollMode=0
" endif

" function to change scroll mode to "1"
" function SetNormalScrollMode()
  " let g:scrollMode=1
" endfunction

" Mappings:
" Toggle scroll mode
" nnoremap <silent> <leader><space> :call SetNormalScrollMode()<cr>

" scroll window based on mode
" nnoremap <expr> <S-j> g:scrollMode==0 ? '3<C-e>3j' : '3<C-e>'
" nnoremap <expr> <S-k> g:scrollMode==0 ? '3<C-y>3k' : '3<C-y>'

" reset mode on CursorHold
" autocmd CursorHold * silent let g:scrollMode=0
