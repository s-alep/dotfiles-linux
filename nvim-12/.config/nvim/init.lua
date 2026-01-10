require 'options'
require 'lsp'
require 'pack'
require 'mini'
require 'fzf'
require 'treesitter'
require 'aucmds'
require 'keymaps'

vim.cmd('packadd! nvim.undotree')
vim.cmd('packadd! nohlsearch')
vim.keymap.set('n', '<leader>u', ':Undotree<cr>')
require('vim._extui').enable {}

