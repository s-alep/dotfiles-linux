return {
  'metalelf0/black-metal-theme-neovim',
  lazy = false,
  priority = 1000,
  cond = not vim.g.vscode,
  config = function()
    require('black-metal').setup {
      theme = 'venom',
      alt_bg = true,
      transparent = false,
      variant = 'dark',
    }
    require('black-metal').load()
  end,
}
