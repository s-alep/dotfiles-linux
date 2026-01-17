return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'mfussenegger/nvim-dap-python',
  },
  keys = {
    {'<leader>dd', function() require('dap').continue() end, desc = 'Debug: Start/Continue',},
    {'<leader>dt', function() require('dap').terminate() end, desc = 'Debug: Terminate',},
    {'<leader>dj', function() require('dap').step_into() end, desc = 'Debug: Step Into',},
    {'<leader>dk', function() require('dap').step_out() end, desc = 'Debug: Step Out',},
    {'<leader>dh', function() require('dapui').eval(nil, { enter = true }) end, desc = 'Debug: View Hover',},
    {'<leader>b', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle Breakpoint',},
    {'<leader>B', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Debug: Set Breakpoint',},
    {'<leader>db', ':DapClearBreakpoints<cr>', desc = 'Debug: Clear Breakpoints',},
    {'<leader>dl', '<cmd>DapStepInto<cr>', desc = 'Debug: Step Into',},
    {'<leader>dc', '<cmd>DapDisconnect<cr>', desc = 'Debug: Disconnect',},
    {'<leader>du', function() require('dapui').toggle() end, desc = 'Debug: Toggle dapui',},
    {'<leader>dw', function() require('dapui').float_element('watches', { title = 'Watch', width = 100, height = 35, enter = true, position = 'center' }) end, desc = 'Debug: View Watches',},
    {'<leader>dv', function() require('dapui').float_element('scopes', { title = 'Scopes', width = 100, height = 35, enter = true, position = 'center' }) end, desc = 'Debug: View Scope',},
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

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

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    require('dap-python').setup 'python3'

    dap.configurations.python = {
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
    }
  end,
}
