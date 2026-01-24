local dap = require 'dap'


dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
    },
    name = 'lldb'
}

local path = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
dap.configurations.rust = {
    {
        name = 'rust',
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.getcwd() .. '/target/debug/' .. path
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}
