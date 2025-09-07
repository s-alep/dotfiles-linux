return {
  {
    'nvim-mini/mini.extra',
    version = false,
    config = function()
      require('mini.extra').setup()
    end,
  },
  {
    'nvim-mini/mini.pick',
    dependecies = {
      'nvim-mini/mini.extra',
      'nvim-mini/mini.icons',
    },
    config = function()
      require('mini.pick').setup {
        mappings = {
          scroll_down = '<C-d>',
          scroll_up = '<C-u>',
        },
        window = {
          -- config = function()
          --   local height, width, starts, ends
          --   local win_width = vim.o.columns
          --   local win_height = vim.o.lines
          --
          --   if win_height <= 25 then
          --     height = math.min(win_height, 18)
          --     width = win_width
          --     starts = 1
          --     ends = win_height
          --   else
          --     width = math.floor(win_width * 0.37) -- 50%
          --     height = math.floor(win_height * 0.3) -- 30%
          --     starts = math.floor((win_width - width) / 2)
          --     -- center prompt: height * (50% + 30%)
          --     -- center window: height * [50% + (30% / 2)]
          --     ends = math.floor(win_height * 0.5)
          --   end
          --
          --   return {
          --     col = starts,
          --     row = ends,
          --     height = height,
          --     width = width,
          --     style = 'minimal',
          --   }
          -- end,
          prompt_caret = '|',
          prompt_prefix = '',
        },
      }
      local map = vim.keymap.set
      map('n', '<leader><leader>', '<cmd>Pick buffers<cr>')
      map('n', '<leader>p', '<cmd>Pick files<cr>')
      map('n', '<leader>sg', '<cmd>Pick grep_live<cr>')
      map('n', '<leader>/', '<cmd>Pick buf_lines<cr>')
      map('n', '<leader>q', '<cmd>Pick diagnostic<cr>')
      map('n', '<leader>sm', '<cmd>Pick marks<cr>')
      map('n', '<leader>sr', '<cmd>Pick resume<cr>')
      map('n', '<leader>sn', function()
        require('mini.pick').start {
          source = {
            name = 'nvim config files',
            items = vim.fn.systemlist 'fd -tf -tl . ~/.config/nvim',
          },
          prompt = 'Pick a file',
          on_accept = function(item)
            vim.cmd('edit ' .. item)
          end,
        }
      end)
      map('n', '<leader>x', '<cmd>Pick explorer<cr>')

      map('n', '<leader>gb', '<cmd>Pick git_branches<cr>')
      map('n', '<leader>gc', '<cmd>Pick git_commits<cr>')
      map('n', '<leader>gf', '<cmd>Pick git_files<cr>')
      map('n', '<leader>gh', '<cmd>Pick git_hunks<cr>')

      local lspicker = require('mini.extra').pickers.lsp
      map('n', 'gD', function()
        lspicker { scope = 'declaration' }
      end)
      map('n', 'gd', function()
        lspicker { scope = 'definition' }
      end)
      map('n', 'gI', function()
        lspicker { scope = 'implementation' }
      end)
      map('n', 'gy', function()
        lspicker { scope = 'type_definition' }
      end)
      map('n', 'gR', function()
        lspicker { scope = 'references' }
      end)
      map('n', 'gs', function()
        lspicker { scope = 'document_symbol' }
      end)
      map('n', 'gS', function()
        lspicker { scope = 'workspace_symbol' }
      end)

      map('n', '<F1>', '<cmd>Pick help<cr>')
      map('n', '<F2>', '<cmd>Pick keymaps<cr>')
      map('n', '<F3>', '<cmd>Pick colorschemes<cr>')

      vim.ui.select = MiniPick.ui_select
    end,
    version = false,
  },
}
