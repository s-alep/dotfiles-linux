return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'mfussenegger/nvim-dap-python',
  },

  cond = not vim.g.vscode,
  keys = {
    {
      '<leader>dd',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<leader>dt',
      function()
        require('dap').terminate()
      end,
      desc = 'Debug: Terminate',
    },
    {
      '<leader>dj',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<leader>dk',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>dh',
      function()
        require('dapui').eval(nil, { enter = true })
      end,
      desc = 'Debug: View Hover',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    {
      '<leader>db',
      ':DapClearBreakpoints<cr>',
      desc = 'Debug: Clear Breakpoints',
    },
    {
      '<leader>dl',
      '<cmd>DapStepInto',
      desc = 'Debug: Step Into',
    },
    {
      '<leader>dc',
      '<cmd>DapDisconnect',
      desc = 'Debug: Disconnect',
    },
    {
      '<leader>du',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: Toggle dapui',
    },
    {
      '<leader>dw',
      function()
        require('dapui').float_element('watches', { title = 'Watch', width = 100, height = 35, enter = true, position = 'center' })
      end,
      desc = 'Debug: View Watches',
    },
    {
      '<leader>dv',
      function()
        require('dapui').float_element('scopes', { title = 'Scopes', width = 100, height = 35, enter = true, position = 'center' })
      end,
      desc = 'Debug: View Scope',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        'debugpy',
        'php-debug-adapter',
      },
    }

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
              id = 'repl',
              size = 0.25,
            },
            {
              id = 'console',
              size = 0.25,
            },
            {
              id = 'breakpoints',
              size = 0.25,
            },
            {
              id = 'stack',
              size = 0.25,
            },
          },
          position = 'bottom',
          size = 10,
        },
        {
          elements = {
            {
              id = 'scopes',
              size = 0.5,
            },
            {
              id = 'watches',
              size = 0.5,
            },
          },
          position = 'right',
          size = 40,
        },
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

    dap.adapters.lua = {
      type = 'executable',
      command = 'local-lua-debugger-vscode-debug-adapter',
    }
    dap.adapters.php = {
      type = 'executable',
      command = 'php-debug-adapter', -- or full path to it
      args = {},
    }

    dap.adapters.lldb = {
      type = 'executable',
      command = 'codelldb', -- adjust as needed
      name = 'lldb',
    }

    local path = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    dap.configurations.rust = {
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
    dap.configurations.lua = {
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
    dap.configurations.php = {
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
    dap.configurations.python = {
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
        name = 'Uvicorn setup',
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
  end,
}
