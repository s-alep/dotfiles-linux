return {
    'mfussenegger/nvim-dap',
    dependencies = {
        {'rcarriga/nvim-dap-ui',
            opts = {
                icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
                layouts = {
                    {
                        elements = {
                            { id = 'console', size = 0.33, },
                            { id = 'breakpoints', size = 0.33, },
                            { id = 'watches', size = 0.33, },
                        },
                        position = 'bottom', size = 7,
                    }
                },
            }
        },
        'nvim-neotest/nvim-nio',
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',
        'mfussenegger/nvim-dap-python',
    },
    keys = {
        {'<leader>dd', function() require('dap').continue() end},
        {'<leader>dt', function() require('dap').terminate() end},
        {'<leader>dj', function() require('dap').step_into() end},
        {'<leader>dk', function() require('dap').step_out() end},
        {'<leader>d[', function() require('dap').step_back() end},
        {'<leader>d]', function() require('dap').step_over() end},
        {'<leader>dh', function() require('dapui').eval(nil, { enter = true }) end},
        {'<leader>b', function() require('dap').toggle_breakpoint() end},
        {'<leader>B', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end},
        {'<leader>db', function() require('dap').clear_breakpoints() end},
        {'<leader>dc', function() require 'dap'.disconnect() end},
        {'<leader>du', function() require('dapui').toggle() end,},
        {'<leader>dw', function() require('dapui').float_element(
            'watches',
            { title = 'Watch', width = 100, height = 35, enter = true, position = 'center' }
        ) end,},
        {'<leader>dv', function() require('dapui').float_element(
            'scopes',
            { title = 'Scopes', width = 100, height = 35, enter = true, position = 'center' }
        ) end,},
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        require('mason-nvim-dap').setup {
            automatic_installation = true,
            handlers = {},
            ensure_installed = {'debugpy', 'php-debug-adapter', 'java-debug-adapter'},
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

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
}
