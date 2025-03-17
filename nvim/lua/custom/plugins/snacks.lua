return {
  'folke/snacks.nvim',
  opts = {
    zen = { enabled = true },
    toggle = { enabled = true },
    dim = { enabled = true },
    image = {
      enabled = true,
      doc = {
        inline = vim.g.neovim_mode == 'skitty' and true or false,
        float = true,
        max_width = vim.g.neovim_mode == 'skitty' and 20 or 60,
        max_height = vim.g.neovim_mode == 'skitty' and 10 or 30,
      },
    },
  },
  keys = {
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Toggle Zen Mode',
    },
  },
}
