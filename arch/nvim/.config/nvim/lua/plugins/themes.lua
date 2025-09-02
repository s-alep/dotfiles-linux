return {
  { 'shaunsingh/nord.nvim' },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
    },
  },
  -- lua/plugins/rose-pine.lua
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      styles = {
        transparency = true,
      },
    },
  },
  {
    'eldritch-theme/eldritch.nvim',
    lazy = false,
    priority = 1000,
    opts = { transparent = true },
  },
  {
    'zenbones-theme/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    config = function() end,
  },
}
