vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.cmdheight = 10

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'nvim-mini/mini.ai',
    version = '*',
    after = 'mini.extra',
    config = function()
      local treesitter = require('mini.ai').gen_spec.treesitter
      local ai = require('mini.extra').gen_ai_spec
      local pair = require('mini.ai').gen_spec.pair
      require('mini.ai').setup {
        n_lines = 500,
        custom_textobjects = {
          f = treesitter { a = '@function.outer', i = '@function.inner' },
          c = treesitter { a = '@class.outer', i = '@class.inner' },
          g = treesitter { a = '@comment.outer', i = '@comment.inner' },
          i = ai.indent(),
          B = ai.buffer(),
          ['u'] = pair('_', '_', {type = "greedy"}),
          ['d'] = pair('-', '-', {type = "greedy"})
        },
      }
    end,
  },
  {
    'nvim-mini/mini.surround',
    version = '*',
    config = function()
      require('mini.surround').setup {}
    end,
  },
  {'nvim-mini/mini.extra', version = false, config = function()  require('mini.extra').setup()end,},
  {  'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
    branch = 'main'
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      local ts = require('nvim-treesitter')
      ts.install({
        'bash',
        'comment',
        'css',
        'diff',
        'fish',
        'git_config',
        'git_rebase',
        'gitcommit',
        'gitignore',
        'html',
        'javascript',
        'json',
        'latex',
        'lua',
        'luadoc',
        'make',
        'markdown',
        'markdown_inline',
        'python',
        'php',
        'query',
        'regex',
        'scss',
        'svelte',
        'toml',
        'tsx',
        'typescript',
        'typst',
        'vim',
        'vimdoc',
        'vue',
        'xml',
        'kdl'
      })

      local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

      local ignore_filetypes = {
        'checkhealth',
        'lazy',
        'fzf',
        'oil',
        'mason',
        'snacks_dashboard',
        'snacks_notif',
        'snacks_win',
      }

      -- Auto-install parsers and enable highlighting on FileType
      vim.api.nvim_create_autocmd('FileType', {
        group = group,
        desc = 'Enable treesitter highlighting and indentation',
        callback = function(event)
          if vim.tbl_contains(ignore_filetypes, event.match) then
            return
          end
          local lang = vim.treesitter.language.get_lang(event.match) or event.match
          local buf = event.buf
          pcall(vim.treesitter.start, buf, lang)
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          ts.install({ lang })
        end,
      })
    end,
  }
}, {
    ui = {
      icons = {},
    },
  })

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)


local map = vim.keymap

local opts = { noremap = true, silent = true }
map.set('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

-- Cockblock
map.set('n', ';;', 'A;<esc>')

-- Editor Shortcuts
map.set('n', 'za', "<Cmd>lua require('vscode').call('editor.toggleFold')<CR>", opts)
map.set('n', '<leader>=', "<Cmd>lua require('vscode').call('editor.action.formatDocument')<CR>", opts)

-- Code Actions
map.set('v', 'grn', "<Cmd>lua require('vscode').call('editor.action.rename')<CR>")
map.set('n', 'g.', "<Cmd>lua require('vscode').call('editor.action.quickFix')<CR>")
map.set('n', '<C-s>', "<Cmd>lua require('vscode').call('editor.action.triggerSuggest')<CR>")
-- Code Navigation
map.set('n', '<leader>f', "<Cmd>lua require('vscode').call('workbench.action.quickOpen')<CR>", opts)
map.set('n', '<leader>;', "<Cmd>lua require('vscode').call('workbench.action.showCommands')<CR>", opts)
map.set('n', 'gs', "<Cmd>lua require('vscode').call('workbench.action.gotoSymbol')<CR>", opts)
map.set('n', 'gS', "<Cmd>lua require('vscode').call('workbench.action.showAllSymbols')<CR>", opts)
map.set('n', [["]], "<Cmd>lua require('vscode').call('editor.action.showHover')<CR>", opts)
map.set('n', 'gD', "<Cmd>lua require('vscode').call('editor.action.revealDefinitionAside')<CR>", opts)
map.set('n', 'gR', "<Cmd>lua require('vscode').call('references-view.findReferences')<CR>", opts)
map.set('n', '<leader>q', "<Cmd>lua require('vscode').call('workbench.actions.view.problems')<CR>", opts)
map.set('n', '<leader>w', "<Cmd>lua require('vscode').call('workbench.action.showAllEditors')<CR>", opts)
map.set('n', 'g/', "<Cmd>lua require('vscode').call('workbench.action.quickOpen',{ args = {'%'}})<CR>", opts)
map.set('n', '<F3>', "<Cmd>lua require('vscode').call('workbench.action.selectTheme')<CR>", opts)
map.set('n', '<leader>/', "<Cmd>lua require('vscode').call('fuzzySearch.activeTextEditor')<CR>", opts)

-- Editor Navigation
map.set('n', '<leader>x', "<Cmd>lua require('vscode').call('workbench.view.explorer')<CR>", opts)
map.set('n', '<leader>X', "<Cmd>lua require('vscode').call('workbench.view.extensions')<CR>", opts)
map.set('n', '<leader>g', "<Cmd>lua require('vscode').call('workbench.view.scm')<CR>", opts)
map.set('n', '<leader>r', "<Cmd>lua require('vscode').call('workbench.view.remote')<CR>", opts)
map.set('n', '<leader>a', "<Cmd>lua require('vscode').call('workbench.action.toggleSidebarVisibility')<CR>", opts)
map.set('n', '<leader>tt', "<Cmd>lua require('vscode').call('workbench.action.terminal.toggleTerminal')<CR>", opts)
map.set('n', '<leader>tc', "<Cmd>lua require('vscode').call('workbench.action.toggleCenteredLayout')<CR>", opts)
map.set('n', '<leader>tz', "<Cmd>lua require('vscode').call('workbench.action.toggleZenMode')<CR>", opts)
map.set('n', '<leader>tf', "<Cmd>lua require('vscode').call('workbench.action.toggleFullScreen')<CR>", opts)
map.set('n', '<leader>tw', "<Cmd>lua require('vscode').call('editor.action.toggleWordWrap')<CR>", opts)

-- Git stuff
map.set('n', '[c', "<Cmd>lua require('vscode').call('workbench.action.editor.previousChange')<CR>", opts)
map.set('n', ']c', "<Cmd>lua require('vscode').call('workbench.action.editor.nextChange')<CR>", opts)
map.set('n', '<leader>hb', "<Cmd>lua require('vscode').call('git.blame.toggleEditorDecoration')<CR>", opts)
map.set('n', '<leader>hd', "<Cmd>lua require('vscode').call('editor.action.dirtydiff.next')<CR>", opts)
map.set('v', '<leader>hr', "<Cmd>lua require('vscode').call('git.revertSelectedRanges')<CR>", opts)
-- Copilot
-- map.set('n', '<leader>ww', "<Cmd>lua require('vscode').call('workbench.action.chat.open')<CR>", opts)
-- map.set('n', '<leader>wn', "<Cmd>lua require('vscode').call('workbench.action.chat.toggleAgentMode')<CR>", opts)
-- map.set({ 'v', 'n' }, '<leader>wi', "<Cmd>lua require('vscode').call('inlineChat.start')<CR>", opts)

-- Debugging
map.set('n', '<leader>b', "<Cmd>lua require('vscode').call('editor.debug.action.toggleBreakpoint')<CR>", opts)
map.set('n', '<leader>B', "<Cmd>lua require('vscode').call('debug.editBreakpoint')<CR>", opts)
map.set('n', '<leader>dd', "<Cmd>lua require('vscode').call('workbench.action.debug.start')<CR>", opts)
map.set('n', '<leader>dt', "<Cmd>lua require('vscode').call('workbench.action.debug.stop')<CR>", opts)
map.set('n', '<leader>dn', "<Cmd>lua require('vscode').call('workbench.action.debug.continue')<CR>", opts)
map.set('n', '<leader>dr', "<Cmd>lua require('vscode').call('workbench.action.debug.restart')<CR>", opts)
map.set('n', '<leader>dh', "<Cmd>lua require('vscode').call('editor.debug.action.showDebugHover')<CR>", opts)
map.set('n', '<leader>dv', "<Cmd>lua require('vscode').call('multiCommand.debugVariables')<CR>", opts)
map.set('n', '<leader>db', "<cmd>lua require('vscode').call('workbench.debug.viewlet.action.removeAllBreakpoints')<cr>")

-- Containers
map.set('n', '<leader>td', "<Cmd>lua require('vscode').call('remote-containers.reopenInContainer')<CR>", opts)
map.set('n', '<leader>tD', "<Cmd>lua require('vscode').call('remote-containers.reopenLocally')<CR>", opts)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
