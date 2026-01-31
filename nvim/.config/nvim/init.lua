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

require('lazy').setup {
  {
    'rose-pine/neovim',
    name='rose-pine',
    opts ={
        variant = 'moon',
        styles = { italic = false, transparency = true }
      }
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      bright_border = true,
      transparent = {
        bg = true,
        float = true
      },
      italic_comments = false
    }
  },
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'vulgaris',
      transparent = true,
      code_style = {
        comments = { italic = false },
        conditionals = { italic = false },
        namespaces = { italic = false },
        parameters = { italic = false },
      },
      lualine={
        transparent = true
      }
    }
  },
  { import = 'plugins' }
}

vim.cmd.colorscheme "bamboo"

require 'keymap'
vim.lsp.enable('copilot')
vim.lsp.enable('zls')
vim.lsp.enable('basedpyright')

-- vim: ts=2 sts=2 sw=2 et
