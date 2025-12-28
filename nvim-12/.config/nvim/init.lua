vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'opts'
require 'aucmds'

require 'mini'
-- require 'dap-conf'
require 'keymap'
-- require 'treesitter-c'

vim.lsp.enable('lua_ls')
vim.lsp.enable('zls')
vim.lsp.enable('basedpyright')

vim.pack.add({
  "https://github.com/neanias/everforest-nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/ziglang/zig.vim"
})


require('everforest').setup{
  transparent_background_level = 2
}

require('oil').setup {
      keymaps = {
        ['q'] = { 'actions.close', mode = 'n' },
      },
      use_default_keymaps = true,
      float = {
        max_width = 0.5,
        max_height = 0.5,
      },
}

vim.cmd.colorscheme('everforest')

local fzf = require('fzf-lua')
fzf.setup({
    winopts = {
        height = 0.45,
        width = 1.0,
        row = 1,
        col = 0,
        preview = {
            hidden = true
        }
    },
    actions = {
        files = {
            true,
            ['ctrl-h'] = FzfLua.actions.file_split
        }
    },
    keymap = {
        builtin = {
            true,
            ["<Tab>"] = "toggle-preview",
            ["<C-u>"] = "preview-page-up",
            ["<C-d>"] = "preview-page-down",
        },
    }
})
fzf.register_ui_select()

