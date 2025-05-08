return {
  'sainnhe/gruvbox-material',
  cond = not vim.g.vscode,
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_enable_italic = true
  end,
}
