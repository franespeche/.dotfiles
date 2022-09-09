" Changes scroll mode to "1" by pressing <leader><S-j> OR <leader><S-k>
" Modes:
"   0. Pressing <S-j> OR <S-k> will scroll the page leaving the cursor line where
"   it is
"   1. Pressing <S-j> OR <S-k> will scroll the page AND the cursor line

" set default scroll mode to "0"
if !exists("g:flag")
  let g:scrollMode=0
endif

" function to change scroll mode to "1"
function ChangeScrollMode()
  let g:scrollMode=1
endfunction

" Mappings:
" Toggle scroll mode
nnoremap <leader><S-j> :call ChangeScrollMode()<cr>
nnoremap <leader><S-k> :call ChangeScrollMode()<cr>
" scroll window based on mode
nnoremap <expr> <S-j> g:scrollMode==0 ? '2<C-e>2j' : '2<C-e>'
nnoremap <expr> <S-k> g:scrollMode==0 ? '2<C-y>2k' : '2<C-y>'

" reset mode on CursorHold
autocmd CursorHold * silent let g:scrollMode=0
