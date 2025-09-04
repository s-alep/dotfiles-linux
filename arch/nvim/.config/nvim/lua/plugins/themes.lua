return {
  { 'shaunsingh/nord.nvim' },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night',
      transparent = false,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = 'dark',
        floats = 'dark',
      },
    },
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker',
      }
      require('onedark').load()
      -- vim.cmd.colorscheme 'tokyonight'
    end,
  },
}
