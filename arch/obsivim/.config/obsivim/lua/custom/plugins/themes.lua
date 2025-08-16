return {
  {
    'rebelot/kanagawa.nvim',
    opts = { transparent = false },
  },
  -- { 'zenbones-theme/zenbones.nvim' },
  { 'EdenEast/nightfox.nvim' },
  { 'ramojus/mellifluous.nvim' },
  { 'eldritch-theme/eldritch.nvim' },
  { 'dgox16/oldworld.nvim' },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'metalelf0/black-metal-theme-neovim',
    lazy = false,
    cond = not vim.g.neovide,
    priority = 1000,
    config = function()
      require('black-metal').setup {
        theme = 'nile',
        variant = 'dark',
        transparent = false,
      }
      require('black-metal').load()
    end,
  },
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'cool',
      }
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_enable_italic = true
    end,
  },
}
