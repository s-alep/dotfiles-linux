return {
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
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {}
    end,
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'warmer',
      }
    end,
  },
}
