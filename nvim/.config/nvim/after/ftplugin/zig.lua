local dap = require('dap')

local path = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')

dap.adapters.lldb = {
    type = 'executable',
    command = 'codelldb', -- adjust as needed
    name = 'lldb',
}

dap.configurations.zig = {
    {
        name = 'Zig-Out',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.getcwd() .. '/zig-out/bin/' .. path
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
    {
        name = 'Zig Build Exe',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.getcwd() .. '/' .. vim.fn.expand('%:t:r')

        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}
