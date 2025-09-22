return {
  {
    'nvim-mini/mini.ai',
    version = '*',
    config = function()
      local treesitter = require('mini.ai').gen_spec.treesitter
      require('mini.ai').setup {
        n_lines = 500,
        custom_textobjects = {
          f = treesitter { a = '@function.outer', i = '@function.inner' },
          c = treesitter { a = '@class.outer', i = '@class.inner' },
          i = treesitter { a = '@block.outer', i = '@block.inner' },
        },
      }
    end,
  },
  {'nvim-mini/mini.icons', version = '*', config = function() require('mini.icons').setup {} end,},
  {
    'nvim-mini/mini.indentscope',
    version = false,
    config = function()
      require('mini.indentscope').setup {draw = { delay = 0, animation = require('mini.indentscope').gen_animation.none() }, options = { try_as_border = true }, symbol = '│',}
    end,
  },
  {
    'nvim-mini/mini.hipatterns',
    version = '*',
    config = function() local hipatterns = require 'mini.hipatterns' hipatterns.setup { highlighters = { hex_color = hipatterns.gen_highlighter.hex_color() } } end,
  },
  {
    'nvim-mini/mini.splitjoin',
    version = '*',
    config = function() require('mini.splitjoin').setup { mappings = { toggle = '<C-m>', split = '', join = '' } } end,
  },
  {'nvim-mini/mini.surround', version = '*', config = function() require('mini.surround').setup {} end,},
  {'nvim-mini/mini-git', version = '*', config = function() require('mini.git').setup {} end,},
  {'nvim-mini/mini.pairs', version = '*', config = function() require('mini.pairs').setup() end,},
}
