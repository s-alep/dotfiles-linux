vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'opts'
require 'aucmds'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    "XXiaoA/atone.nvim",
    cmd = "Atone",
    opts = {}
  },
  'AlexvZyl/nordic.nvim',
  "folke/tokyonight.nvim",
  'Everblush/nvim' ,
  "Shatur/neovim-ayu",
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  { import = 'plugins' },
}, {
    rocks={
      enabled = false,
    },
    ui = {
      icons = {},
    },
})

require 'keymap'

vim.lsp.enable('copilot')
vim.lsp.enable('basedpyright')

-- vim.cmd.colorscheme('ayu-mirage')
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
