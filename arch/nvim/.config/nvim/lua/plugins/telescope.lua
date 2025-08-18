return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  cond = not vim.g.vscode,
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      pickers = {
        colorscheme = { theme = 'dropdown', previewer = false },
        buffers = { theme = 'dropdown', previewer = false },
        grep_string = { theme = 'dropdown', previewer = true, layout = 'vertical' },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    local map = vim.keymap.set
    local builtin = require 'telescope.builtin'
    vim.api.nvim_create_user_command('Mpage', function()
      builtin.man_pages()
    end, {})
    vim.api.nvim_create_user_command('Help', function()
      builtin.help_tags()
    end, {})
    vim.api.nvim_create_user_command('Keys', function()
      builtin.keymaps()
    end, {})
    vim.api.nvim_create_user_command('Color', function()
      builtin.colorscheme()
    end, {})
    map('n', '<leader>p', builtin.find_files, { desc = '[P]ick files' })
    map('n', '<leader>q', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    map('n', '<leader>sd', builtin.command_history, { desc = '[S]earch comman[D] history' })
    map('n', '<leader>sb', builtin.builtin, { desc = '[S]earch [B]uiltins' })
    map('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
    map('n', '<leader>*', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    map('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    map('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    map('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 30,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.api.nvim_create_user_command('Hook', function()
      builtin.grep_string {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--line-number',
          '--column',
          '--smart-case',
        },
        cwd = '~/Documents/dev/arbi',
        search = '#[Hook',
        word_match = '-w',
        disable_coordinates = true,
        only_sort_text = false,
      }
    end, {})
    vim.api.nvim_create_user_command('Hooks', function()
      builtin.grep_string {
        cwd = '~/Documents/dev/arbi',
        search = '#[Hook',
        word_match = '-w',
        disable_coordinates = true,
        only_sort_text = false,
      }
    end, {})
    map('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
