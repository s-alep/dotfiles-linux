local dap = require 'dap'

dap.adapters.lldb = {
    type = 'executable',
    command = 'codelldb',
    name = 'lldb',
}

dap.configurations.cpp = {
    {
        name = 'cpp',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.getcwd() .. '/a.out'
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
    },
}
