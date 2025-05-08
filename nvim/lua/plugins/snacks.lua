return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  cond = not vim.g.vscode,
  opts = {
    scratch = { enabled = true },
    indent = {
      animate = {
        enabled = true,
      },
    },
    explorer = { replace_netrw = true },
    dashboard = {
      preset = {
        keys = {
          { icon = ' ', key = 'p', desc = 'Find File', action = ':Telescope find_files' },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = 'Telescope live_grep' },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ':Telescope oldfiles' },
          { icon = '', key = 'c', desc = 'Select Theme', action = ':Telescope colorscheme' },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = 1 },
        { section = 'startup' },
      },
    },
  },
  keys = {
    {
      '<leader>x',
      function()
        Snacks.explorer.open()
      end,
      desc = 'Open e[X]plorer',
    },
    {
      '<leader>tp',
      function()
        Snacks.scratch()
      end,
      desc = '[T]oggle Scratch[P]ad',
    },
    {
      '<leader>ss',
      function()
        Snacks.scratch.select()
      end,
      desc = '[S]earch [S]cratchpads',
    },
  },
}
