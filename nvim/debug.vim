" auto complete fix
" https://www.reddit.com/r/vim/comments/fyg1ma/how_to_find_out_whats_stopping_cspace_to_trigger/
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>

" CocOpenLog
" enter these commands:
" :profile start profile.log
" :profile func *
" :profile file *
" Make issue happen.
" Run command :profile stop (Neovim only).
" Exit vim, and open the newly generated profile.log file in your current
" directory.
" :profile start profile.log
" :profile func *
" :profile file *

" Use :call coc#client#open_log() to open a log file, or use :echo $NODE_CLIENT_LOG_FILE to get file path of log.
let g:node_client_debug = 1
let $NODE_CLIENT_LOG_FILE = "coc.nvim.logs"

" When using `dd` in the quickfix list, remove the item from the quickfix list.
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

function! IsLeftMostWindow()
    let curNr = winnr()
    wincmd h
    if winnr() == curNr
        return 1
    endif
    wincmd p " Move back.
    return 0
endfunction

function! IsWindowPosition(pos)
    let curNr = winnr()

    if a:pos == "right"
      wincmd l
    elseif a:pos == "left"
      wincmd h
    endif

    if winnr() == curNr
        return 1
    endif
    wincmd p " Move back.
    return 0
endfunction

function! Check()
  let flag = IsWindowPosition("right")
  echo "flag"
  echo flag
endfunction

nmap ,db :call Check()<cr>
