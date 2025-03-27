return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'bullets-vim/bullets.vim',
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
      ui = { enabled = false },
      workspaces = {
        {
          name = 'notes',
          -- path = '~/code/notes/',
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
        folder = 'templates',
        time_format = '%H:%M',
        substitutions = {},
      },
    },
  },
  {
    'hedyhli/outline.nvim',
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set('n', '<leader>oo', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

      require('outline').setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      bullet = {
        enabled = true,
        right_pad = 1,
      },
      heading = {
        right_pad = 1,
        right_margin = 1,
        enabled = true,
        -- icons = { '🏵️', '🌸', '💮', '🌼' },
      },
    },
  },
}
