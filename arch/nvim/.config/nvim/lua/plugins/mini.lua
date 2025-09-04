return {
  {
    'nvim-mini/mini.ai',
    version = '*',
    config = function()
      require('mini.ai').setup {
        n_lines = 500,
      }
    end,
  },
  {
    'nvim-mini/mini.icons',
    version = '*',
    config = function()
      require('mini.icons').setup {}
    end,
  },
  {
    'nvim-mini/mini.indentscope',
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
    'nvim-mini/mini.hipatterns',
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
    'nvim-mini/mini.splitjoin',
    version = '*',
    cond = not vim.g.vsocde,
    config = function()
      require('mini.splitjoin').setup { mappings = { toggle = 'gj', split = '', join = '' } }
    end,
  },
  {
    'nvim-mini/mini.files',
    version = '*',
    cond = not vim.g.vsocde,
    config = function()
      require('mini.files').setup {
        vim.keymap.set('n', '<leader>x', ':lua MiniFiles.open()<cr>', { desc = 'e[X]plorer' }),
      }
    end,
  },
  {
    'nvim-mini/mini.surround',
    version = '*',
    config = function()
      require('mini.surround').setup {}
    end,
  },
  {
    'nvim-mini/mini-git',
    version = '*',
    cond = not vim.g.vsocde,
    config = function()
      require('mini.git').setup {}
    end,
  },
  {
    'nvim-mini/mini.pairs',
    version = '*',
    cond = not vim.g.vsocde,
    config = function()
      require('mini.pairs').setup()
    end,
  },
}
