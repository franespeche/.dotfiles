local dap = require('dap')
dap.adapters.node2 = {
  type = 'server',
  command = 'node',
  port: 9229,
  args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.typescript = {
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    port = 9229,
    processId = require'dap.utils'.pick_process,
  },
}
