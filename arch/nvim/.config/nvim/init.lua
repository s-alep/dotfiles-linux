if not vim.g.vscode then
  require 'opts'
end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

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
  'tpope/vim-sleuth',
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
  ui = {
    icons = {},
  },
})

if vim.g.vscode then
  require 'code'
else
  require 'keymap'
  require 'terminal'
  require 'cab'

  vim.o.statusline = "%f [%{%v:lua.require'nvim-navic'.get_location()%}]"
  if vim.g.neovide then
    vim.cmd.colorscheme 'habamax'
    -- else
    --   local color = 'tokyonight-night'
    --
    --   vim.cmd.colorscheme(color)
    --   vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
    --   vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })
    --   vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
    --   vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
    --   vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
    --   vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'NONE' })
    --
    --   vim.keymap.set('n', '<leader>tg', function()
    --     local normal = vim.fn.execute 'hi Normal'
    --     local current_color = vim.api.nvim_exec2('colorscheme', { output = true }).output
    --     if not string.find(normal, 'guibg') then
    --       vim.cmd.colorscheme(current_color)
    --     else
    --       vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
    --       vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })
    --       vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
    --       vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
    --       vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
    --       vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'NONE' })
    --     end
    --   end, { desc = '[T]oggle back[G]round opacity' })
  end
end
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
