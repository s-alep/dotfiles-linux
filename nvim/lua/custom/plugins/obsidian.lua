return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>so', '<cmd>ObsidianQuickSwitch<CR>', desc = '[S]earch [O]bsidian Files' },
    { '<leader>st', '<cmd>ObsidianTags<CR>', desc = '[S]earch Obsidian [T]ags' },
    { '<leader>oj', '<cmd>ObsidianTags journal<CR>', desc = '[S]earch Obsidian [T]ags' },
    { '<leader>os', '<cmd>ObsidianFollowLink hsplit<CR>', desc = '[O]bsidian Open Definition in [S]plit' },
    { '<leader>od', '<cmd>ObsidianDailies -6 6<CR>', desc = '[O]bsidian [D]ailies' },
    {
      '<leader>on',
      function()
        vim.ui.input({ prompt = 'Enter filename: ' }, function(input)
          if input and input ~= '' then
            vim.cmd('ObsidianNewFromTemplate ' .. input .. '.md')
          end
        end)
      end,
      desc = '[O]bsidian [N]ew Capture',
    },
  },
  opts = {
    workspaces = {
      {
        name = 'notes',
        path = '/mnt/c/Users/SpyrosAlepakos/code/notes/',
      },
    },
    daily_notes = {
      folder = 'journal',
      date_format = '%Y-%m-%d',
      alias_format = '%B %-d, %Y',
      default_tags = { 'journal' },
      template = nil,
    },
    templates = {
      folder = '/mnt/c/Users/SpyrosAlepakos/code/notes/templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      substitutions = {},
    },
  },
}
