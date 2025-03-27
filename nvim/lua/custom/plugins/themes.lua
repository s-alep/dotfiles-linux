return {
  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true, opts = ... },
  { 'rebelot/kanagawa.nvim', opts = { transparent = true } },
  { 'EdenEast/nightfox.nvim' },
  { 'thesimonho/kanagawa-paper.nvim' },
  { 'Shatur/neovim-ayu' },
  { 'AlexvZyl/nordic.nvim', opts = { transparent = { bg = true } } },
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.g.everforest_enable_italic = true
      -- vim.g.everforrest_background = 'dim'
      -- vim.g.everforest_transparent_background = true
      -- vim.g.everforrest_cursor = 'red'
      -- vim.g.everforrest_float_style = 'dim'
      -- vim.g.everforest_dim_inactive_windows = true
      -- vim.g.everforest_floag_style = 'dim'
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },
}
