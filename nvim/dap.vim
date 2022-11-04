lua << EOF
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.typescript = {
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}
EOF

nnoremap <leader>db :lua require'dap'.toggle_breakpoint()<cr>
nnoremap <leader><S-k> :lua require'dap'.step_out()<cr>
nnoremap <leader><S-l> :lua require'dap'.step_into()<cr>
nnoremap <leader><S-j> :lua require'dap'.step_over()<cr>
nnoremap <leader>dn :lua require'dap'.continue()<cr>
nnoremap <leader>d_ :lua require'dap'.run_last()<cr>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<cr><C-w>l
nnoremap <leader>di :lua require'dap.ui.variables'.hover(function () return vim.fn.expand("<cexpr>") end)<cr>
nnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<cr>
nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<cr>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<cr>
" nnoremap <leader>da :lua require'debugHelper'.attach()<cr>
