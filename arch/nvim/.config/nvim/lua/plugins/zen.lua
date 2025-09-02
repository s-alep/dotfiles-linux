return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      backdrop = 1,
    },
    plugins = {
      gitsigns = { enabled = true },
    },
  },
  config = function()
    vim.keymap.set('n', '<leader>tz', '<cmd>ZenMode<cr>')
  end,
}
