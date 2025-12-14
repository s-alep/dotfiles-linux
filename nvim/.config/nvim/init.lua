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
    {'rebelot/kanagawa.nvim',},
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

require('kanagawa').setup({
  overrides = function(colors)
      local theme = colors.theme
      return {
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
      }
  end,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    }
  },
})
vim.lsp.enable('copilot')
vim.lsp.enable('basedpyright')
vim.cmd.colorscheme('kanagawa-dragon')

vim.api.nvim_set_hl(0, 'StatusLine', { link = 'none' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { link = 'none' })
-- require("lualine").setup{}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
