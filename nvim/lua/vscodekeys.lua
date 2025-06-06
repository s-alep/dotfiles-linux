vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.cmdheight = 10

local map = vim.keymap

local opts = { noremap = true, silent = true }
map.set('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

-- Cockblock
map.set('i', '<left>', '<cmd>echo "Use the Insert Mode!"<CR>')
map.set('i', '<left>', '<cmd>echo "Use the Insert Mode!"<CR>')
map.set('i', '<right>', '<cmd>echo "Use the Insert Mode!"<CR>')
map.set('i', '<up>', '<cmd>echo "Use the Insert Mode!"<CR>')
map.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
map.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Editor Shortcuts
map.set('n', 'za', "<Cmd>lua require('vscode').call('editor.toggleFold')<CR>", opts)
map.set('n', '<leader>=', "<Cmd>lua require('vscode').call('editor.action.formatDocument')<CR>", opts)
map.set('n', 'ciu', 'T_ct_', opts)
map.set('n', 'cu', 'ct_', opts)
map.set('n', 'diu', 'T_dt_', opts)
map.set('n', 'du', 'dt_', opts)
map.set('n', 'cid', 'T-ct-', opts)
map.set('n', 'cd', 'ct-', opts)
map.set('n', 'did', 'T-dt-', opts)

-- Code Actions
map.set('n', 'cr', "<Cmd>lua require('vscode').call('editor.action.rename')<CR>")
map.set('v', 'cr', "<Cmd>lua require('vscode').call('editor.action.rename')<CR>")
map.set('n', 'cx', "<Cmd>lua require('vscode').call('editor.action.quickFix')<CR>")
map.set('n', 'cs', "<Cmd>lua require('vscode').call('editor.action.triggerSuggest')<CR>")

-- Code Navigation
map.set('n', '<leader>p', "<Cmd>lua require('vscode').call('workbench.action.quickOpen')<CR>", opts)
map.set('n', '<leader>;', "<Cmd>lua require('vscode').call('workbench.action.showCommands')<CR>", opts)
map.set('v', '<leader>;', "<Cmd>lua require('vscode').call('workbench.action.showCommands')<CR>", opts)
map.set('n', 'gs', "<Cmd>lua require('vscode').call('workbench.action.gotoSymbol')<CR>", opts)
map.set('n', 'gS', "<Cmd>lua require('vscode').call('workbench.action.showAllSymbols')<CR>", opts)
map.set('n', '<leader>q', "<Cmd>lua require('vscode').call('workbench.actions.view.problems')<CR>", opts)
map.set('n', '<leader><leader>', "<Cmd>lua require('vscode').call('workbench.action.showAllEditors')<CR>", opts)
map.set('n', '<leader>sp', "<Cmd>lua require('vscode').call('workbench.action.openRecent')<CR>", opts)
map.set('n', '<leader>sg', "<Cmd>lua require('vscode').call('workbench.action.quickOpen',{ args = {'%'}})<CR>", opts)
map.set('n', '<leader>/', "<Cmd>lua require('vscode').call('fuzzySearch.activeTextEditor')<CR>", opts)

-- Editor Navigation
map.set('n', '<leader>x', "<Cmd>lua require('vscode').call('workbench.view.explorer')<CR>", opts)
map.set('n', '<leader>X', "<Cmd>lua require('vscode').call('workbench.view.extensions')<CR>", opts)
map.set('n', '<leader>g', "<Cmd>lua require('vscode').call('workbench.view.scm')<CR>", opts)
map.set('n', '<leader>a', "<Cmd>lua require('vscode').call('workbench.action.toggleSidebarVisibility')<CR>", opts)
map.set('n', '<leader>tt', "<Cmd>lua require('vscode').call('workbench.action.terminal.toggleTerminal')<CR>", opts)
map.set('n', '<leader>tc', "<Cmd>lua require('vscode').call('workbench.action.toggleCenteredLayout')<CR>", opts)
map.set('n', '<leader>tz', "<Cmd>lua require('vscode').call('workbench.action.toggleZenMode')<CR>", opts)
map.set('n', '<leader>tf', "<Cmd>lua require('vscode').call('workbench.action.toggleFullScreen')<CR>", opts)

-- Debugging
--
map.set('n', '<leader>b', "<Cmd>lua require('vscode').call('editor.debug.action.toggleBreakpoint')<CR>", opts)
map.set('n', '<leader>B', "<Cmd>lua require('vscode').call('debug.editBreakpoint')<CR>", opts)
map.set('n', '<leader>dd', "<Cmd>lua require('vscode').call('workbench.action.debug.start')<CR>", opts)
map.set('n', '<leader>dt', "<Cmd>lua require('vscode').call('workbench.action.debug.stop')<CR>", opts)
map.set('n', '<leader>dn', "<Cmd>lua require('vscode').call('workbench.action.debug.continue')<CR>", opts)
map.set('n', '<leader>dr', "<Cmd>lua require('vscode').call('workbench.action.debug.restart')<CR>", opts)
map.set('n', '<leader>dh', "<Cmd>lua require('vscode').call('workbench.action.debug.showDebugHover')<CR>", opts)
map.set('n', '<leader>dv', "<Cmd>lua require('vscode').call('multiCommand.debugVariables')<CR>", opts)

-- Containers
map.set('n', '<leader>td', "<Cmd>lua require('vscode').call('remote-containers.reopenInContainer')<CR>", opts)
map.set('n', '<leader>tD', "<Cmd>lua require('vscode').call('remote-containers.reopenLocally')<CR>", opts)

