return {
  {'nvim-mini/mini.extra', version = false, config = function()  require('mini.extra').setup()end,},
  {
    'nvim-mini/mini.hues',
    version = false,
    config = function()
      require('mini.hues').setup {
        background = '#14161B',
        foreground = '#C4C6CD',
        n_hues = 4,
        saturation = 'mediumhigh'
      }
    end,
  },
  {
    'nvim-mini/mini.ai',
    version = '*',
    config = function()
      local treesitter = require('mini.ai').gen_spec.treesitter
      local ai = require('mini.extra').gen_ai_spec
      require('mini.ai').setup {
        n_lines = 500,
        custom_textobjects = {
          f = treesitter { a = '@function.outer', i = '@function.inner' },
          c = treesitter { a = '@class.outer', i = '@class.inner' },
          i = ai.indent(),
          B = ai.buffer(),
          g = ai.line(),
        },
      }
    end,
  },
  {'nvim-mini/mini.icons', version = '*', config = function()   require('mini.icons').setup {}end,},
  {
    'nvim-mini/mini.indentscope',
    version = false,
    config = function()
      require('mini.indentscope').setup {
        draw = { delay = 0, animation = require('mini.indentscope').gen_animation.none() },
        options = { try_as_border = true },
        symbol = '│',
      }
    end,
  },
  {
    'nvim-mini/mini.splitjoin',
    version = '*',
    config = function() 
      require('mini.splitjoin').setup {
        mappings = { toggle = '<C-m>', split = '', join = '' }
      } 
    end,
  },
  {'nvim-mini/mini.surround', version = '*', config = function()   require('mini.surround').setup {}end,},
  {'nvim-mini/mini-git', version = '*', config = function()   require('mini.git').setup {}end,},
  {'nvim-mini/mini.pairs', version = '*', config = function()   require('mini.pairs').setup()end,},
}
