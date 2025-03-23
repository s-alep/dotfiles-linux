return {
  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true, opts = ... },
  { 'rebelot/kanagawa.nvim' },
  { 'navarasu/onedark.nvim' },
  { 'EdenEast/nightfox.nvim' },
  { 'ayu-theme/ayu-vim' },
  { 'thesimonho/kanagawa-paper.nvim' },
  { 'NTBBloodbath/doom-one.nvim' },
  { 'Shatur/neovim-ayu' },
  { 'shaunsingh/nord.nvim' },
  { 'rmehri01/onenord.nvim' },
  { 'AlexvZyl/nordic.nvim' },
  { 'sts10/vim-pink-moon' },
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
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
}
