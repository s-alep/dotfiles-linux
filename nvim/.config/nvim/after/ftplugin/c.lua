local dap = require 'dap'

dap.adapters.lldb = {
    type = 'executable',
    command = 'codelldb',
    name = 'lldb',
}

dap.configurations.c = {
    {
        name = 'c',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.getcwd() .. '/a.out'
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
    },
}
