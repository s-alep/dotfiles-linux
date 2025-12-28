vim.pack.add({
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/rcarriga/nvim-dap-ui',
    'https://github.com/nvim-neotest/nvim-nio',
    'https://github.com/mfussenegger/nvim-dap-python',
})

local dap_obj = require('dap')
local dapui = require('dapui')

dapui.setup {
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
        icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
        },
    },
    layouts = {
        {
            elements = {
                {
                    id = 'console',
                    size = 0.33,
                },
                {
                    id = 'breakpoints',
                    size = 0.33,
                },
                {
                    id = 'watches',
                    size = 0.33,
                },
            },
            position = 'bottom',
            size = 5,
        }
    },
}

vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
local breakpoint_icons = vim.g.have_nerd_font
and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
for type, icon in pairs(breakpoint_icons) do
    local tp = 'Dap' .. type
    local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
    vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
end

dap_obj.listeners.after.event_initialized['dapui_config'] = dapui.open
dap_obj.listeners.before.event_terminated['dapui_config'] = dapui.close
dap_obj.listeners.before.event_exited['dapui_config'] = dapui.close

require('dap-python').setup 'python3'

dap_obj.adapters.lua = {
    type = 'executable',
    command = 'local-lua-debugger-vscode-debug-adapter',
}

dap_obj.adapters.java = function(callback)
    callback({
        type = 'server';
        host = '127.0.0.1';
        port = 5005;
    })
end

dap_obj.adapters.php = {
    type = 'executable',
    command = 'php-debug-adapter', -- or full path to it
    args = {},
}

dap_obj.adapters.lldb = {
    type = 'executable',
    command = 'codelldb', -- adjust as needed
    name = 'lldb',
}

local path = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
dap_obj.configurations.rust = {
    {
        name = 'rust',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.getcwd() .. '/target/debug/' .. path
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

dap_obj.configurations.java = {
    {
        classPaths = {},
        projectName = "Hello",
        javaExec = "/usr/bin/java",
        mainClass = "Hello",
        modulePaths = {},
        name = "Launch Hello",
        request = "launch",
        type = "java"
    },
}
dap_obj.configurations.lua = {
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
dap_obj.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003,
        pathMappings = {
            ['/var/www/html'] = '${workspaceFolder}', -- DDEV web root
            ['/var/www/html/web'] = '${workspaceFolder}/web', -- DDEV web root
        },
    },
}
dap_obj.configurations.python = {
    {
        name = 'Python Attach to container',
        type = 'python',
        request = 'attach',
        port = 5678,
        host = 'localhost',
        pathMappings = {
            {
                localRoot = '${workspaceFolder}',
                remoteRoot = '/workspace',
            },
        },
    },
    {
        name = 'Python FastAPI',
        type = 'python',
        request = 'launch',
        module = 'fastapi',
        args = {
            'dev',
            'main.py',
        },
        jinja = 'true',
    },
    {
        name = 'Python Flask',
        type = 'python',
        request = 'launch',
        module = 'flask',
        args = {
            'run',
        },
        jinja = 'true',
    },
    {
        name = 'Uvicorn',
        type = 'python',
        request = 'launch',
        module = 'uvicorn',
        args = {
            'app.main:app', -- Adjust if needed
            '--host',
            '0.0.0.0',
            '--port',
            '8000',
            '--reload',
        },
    },
}

vim.keymap.set('n', '<leader>dd', function()
    require('dap').continue()
end)
vim.keymap.set('n', '<leader>dt', function()
    require('dap').terminate()
end)
vim.keymap.set('n', '<leader>dj', function()
    require('dap').step_into()
end)
vim.keymap.set('n', '<leader>dk', function()
    require('dap').step_out()
end)
vim.keymap.set('n', '<leader>dk', function()
    require('dapui').eval(nil, { enter = true })
end)
vim.keymap.set('n', '<leader>b', function()
    require('dapui').toggle_breakpoint()
end)
vim.keymap.set('n', '<leader>B', function()
    require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end)
vim.keymap.set('n', '<leader>db', function()
    require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end)
vim.keymap.set('n', '<leader>dc', function()
    vim.cmd('<cmd>DapDisconnect<cr>')
end)
vim.keymap.set('n', '<leader>du', function()
    require('dapui').toggle()
end)
vim.keymap.set('n', '<leader>dw', function()
    require('dapui').float_element('watches', { title = 'Watch', width = 100, height = 35, enter = true, position = 'center' })
end)
vim.keymap.set('n', '<leader>dv', function()
    require('dapui').float_element('scopes', { title = 'Scopes', width = 100, height = 35, enter = true, position = 'center' })
end)
