return {
  'folke/snacks.nvim',
  opts = {
    scratch = { enabled = true },
    styles = {
      zen = {
        enter = true,
        fixbuf = false,
        minimal = true,
        width = 185,
        height = 0,
        backdrop = { transparent = false, blend = 40 },
        keys = { q = false },
        zindex = 40,
        wo = {
          winhighlight = 'NormalFloat:Normal',
        },
        w = {
          snacks_main = true,
        },
      },
    },
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
      '<leader>ts',
      function()
        Snacks.scratch()
      end,
      desc = '[T]oggle [S]cratch Buffer',
    },
    {
      '<leader>ss',
      function()
        Snacks.scratch.select()
      end,
      desc = '[S]earch [S]cratch Buffer',
    },
    {
      'tz',
      function()
        Snacks.zen.zen()
      end,
      desc = '[T]oggle [Z]en Mode',
    },
  },
}
