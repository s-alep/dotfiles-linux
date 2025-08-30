return {
  'olimorris/codecompanion.nvim',
  opts = {},
  cond = not vim.g.vscode,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('codecompanion').setup {
      adapters = {
        http = {
          gemini = function()
            return require('codecompanion.adapters').extend('gemini', {
              env = {
                api_key = 'cmd: echo $GOOGLE_AI_API_KEY',
              },
            })
          end,
        },
      },
      display = {
        diff = {
          provider = 'inline',
        },
      },
      strategies = {
        chat = {
          adapter = 'gemini',
        },
        inline = {
          adapter = 'gemini',
        },
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>we', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'v' }, '<leader>ww', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
    vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })
    vim.cmd [[cab cc CodeCompanion]]
  end,
}
