local dbg  = require "dap"

dbg.adapters.lua = {
    type = 'executable',
    command = 'local-lua-debugger-vscode-debug-adapter',
}
dbg.configurations.lua = {
    {
        name = 'Current file (local-lua-dbg, lua)',
        type = 'lua',
        request = 'launch',
        cwd = '${workspaceFolder}',
        program = {
            lua = 'lua5.4',
            file = '${file}',
        },
        args = {},
    },
}
