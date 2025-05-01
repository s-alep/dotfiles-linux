if not vim.g.vscode then
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
  vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
  vim.keymap.set('n', '<C-d>', '<C-d>zz')
  vim.keymap.set('n', '<C-u>', '<C-u>zz')
end
--
-- Basic KeyMaps
--
-- Remove the arrow keys
vim.keymap.set('i', '<left>', '<cmd>echo "Use the Insert Mode!"<CR>')
vim.keymap.set('i', '<left>', '<cmd>echo "Use the Insert Mode!"<CR>')
vim.keymap.set('i', '<right>', '<cmd>echo "Use the Insert Mode!"<CR>')
vim.keymap.set('i', '<up>', '<cmd>echo "Use the Insert Mode!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
-- Other keymaps
vim.keymap.set('i', 'jj', '<Esc>')
