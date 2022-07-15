let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = 'right:60%'
let g:fzf_tags_command = 'ctags --recurse --options=.ctags'

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RgFzf call RipgrepFzf(<q-args>, <bang>1)

nnoremap <leader>ff :<C-u>Files<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fF :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <leader>aa :RgFzf<cr>
nnoremap <leader>za mA:RgFzf <C-r>=expand("<cword>")<cr><cr>
nnoremap <leader>zr mA:Rg <C-r>=expand("<cword>")<cr><space>
nnoremap <leader>H :Helptags<cr>
