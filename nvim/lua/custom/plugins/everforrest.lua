return {
  'sainnhe/everforest',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_enable_italic = true
    vim.g.everforrest_background = 'hard'
    vim.g.everforest_transparent_background = true
    vim.g.everforrest_cursor = 'red'
    vim.g.everforrest_float_style = 'dim'
    vim.cmd.colorscheme 'gruvbox'
  end,
}
