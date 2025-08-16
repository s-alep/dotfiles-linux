return {
  {
    'echasnovski/mini.clue',
    version = '*',
    config = function()
      local miniclue = require 'mini.clue'
      miniclue.setup {
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {

          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      }
    end,
  },
  {
    'echasnovski/mini.pick',
    version = '*',
    config = function()
      require('mini.pick').setup {}

      vim.keymap.set('n', '<leader>p', ':Pick files<cr>')
      vim.keymap.set('n', '<leader>sg', ':Pick grep_live<cr>')
      vim.keymap.set('n', '<leader>sr', ':Pick resume<cr>')
      vim.keymap.set('n', '<leader><leader>', ':Pick buffers<cr>')

      vim.api.nvim_create_user_command('Hook', function()
        require('mini.pick').builtin.grep({
          pattern = [[\#\[Hook]],
        }, {
          source = {},
        })
      end, {})
      vim.api.nvim_create_user_command('Help', function()
        vim.cmd [[Pick help]]
      end, {})
      vim.keymap.set('n', '<leader>sn', function()
        require('mini.pick').start {
          source = {
            name = 'nvim config files',
            items = vim.fn.systemlist 'find ~/.config/nvim -type f',
          },
          prompt = 'Pick a file',
          on_accept = function(item)
            vim.cmd('edit ' .. item)
          end,
        }
      end, { desc = 'Pick config file' })
    end,
  },
  {
    'echasnovski/mini.extra',
    version = '*',
    config = function()
      require('mini.extra').setup {}
      vim.keymap.set('n', '<leader>q', ':Pick diagnostic<cr>')
      vim.keymap.set('n', '<leader>sd', ':Pick history<cr>')
      vim.keymap.set('n', '<leader>/', ':Pick buf_lines<cr>')
      vim.keymap.set('n', 'gs', ':Pick lsp scope="document_symbol"<cr>')
      vim.keymap.set('n', 'gs', ':Pick lsp scope="document_symbol"<cr>')
      vim.keymap.set('n', 'gS', ':Pick lsp scope="workspace_symbol"<cr>')
      vim.keymap.set('n', 'gI', ':Pick lsp scope="implementation"<cr>')
      vim.keymap.set('n', 'gd', ':Pick lsp scope="definition"<cr>')

      vim.api.nvim_create_user_command('Key', function()
        vim.cmd [[Pick keymaps]]
      end, {})
    end,
  },
  {
    'echasnovski/mini.icons',
    version = '*',
    config = function()
      require('mini.icons').setup {}
    end,
  },
  {
    'echasnovski/mini.ai',
    version = '*',
    config = function()
      require('mini.ai').setup {
        n_lines = 500,
      }
    end,
  },
  {
    'echasnovski/mini.indentscope',
    version = false,
    cond = not vim.g.vsocde,
    config = function()
      require('mini.indentscope').setup {
        draw = {
          delay = 0,
          animation = require('mini.indentscope').gen_animation.none(),
        },
        options = {
          try_as_border = true,
        },
        symbol = '│',
      }
    end,
  },
  {
    'echasnovski/mini.hipatterns',
    version = '*',
    cond = not vim.g.vsocde,
    config = function()
      local hipatterns = require 'mini.hipatterns'
      hipatterns.setup {
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    version = '*',
    cond = not vim.g.vsocde,
    config = function()
      require('mini.splitjoin').setup { mappings = { toggle = 'gj', split = '', join = '' } }
    end,
  },
  {
    'echasnovski/mini.files',
    version = '*',
    cond = not vim.g.vsocde,
    config = function()
      require('mini.files').setup {
        vim.keymap.set('n', '<leader>x', ':lua MiniFiles.open()<cr>', { desc = 'e[X]plorer' }),
      }
    end,
  },
  {
    'echasnovski/mini.surround',
    version = '*',
    config = function()
      require('mini.surround').setup {}
    end,
  },
  {
    'echasnovski/mini-git',
    version = '*',
    cond = not vim.g.vsocde,
    config = function()
      require('mini.git').setup {}
    end,
  },
  {
    'echasnovski/mini.pairs',
    version = '*',
    cond = not vim.g.vsocde,
    config = function()
      require('mini.pairs').setup()
    end,
  },
}
