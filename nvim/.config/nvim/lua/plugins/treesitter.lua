return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
  },
  {
    'SmiteshP/nvim-navic',
    config = function()
      require('nvim-navic').setup {
        icons = {
          File = '󰈙 ',
          Module = ' ',
          Namespace = '󰌗 ',
          Package = ' ',
          Class = '󰌗 ',
          Method = '󰆧 ',
          Property = ' ',
          Field = ' ',
          Constructor = ' ',
          Enum = '󰕘',
          Interface = '󰕘',
          Function = '󰊕 ',
          Variable = '󰆧 ',
          Constant = '󰏿 ',
          String = '󰀬 ',
          Number = '󰎠 ',
          Boolean = '◩ ',
          Array = '󰅪 ',
          Object = '󰅩 ',
          Key = '󰌋 ',
          Null = '󰟢 ',
          EnumMember = ' ',
          Struct = '󰌗 ',
          Event = ' ',
          Operator = '󰆕 ',
          TypeParameter = '󰊄 ',
        },
        lsp = {
          auto_attach = true,
          preference = nil,
        },
        highlight = false,
        separator = ' > ',
        depth_limit = 0,
        depth_limit_indicator = '..',
        safe_output = true,
        lazy_update_context = false,
        click = false,
        format_text = function(text)
          return text
        end,
      }
    end,
  },
  { 'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require 'treesitter-context'.setup {
        enable = false
      }
      vim.keymap.set('n', '<leader>c', '<cmd>TSContext toggle<cr>')
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    dependencies = { 'OXY2DEV/markview.nvim' },
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'python',
        'php',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'nm',
          scope_incremental = 'gns',
          node_decremental = 'nn',
        },
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
}
