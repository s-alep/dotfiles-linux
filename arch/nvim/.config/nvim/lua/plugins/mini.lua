return {
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
