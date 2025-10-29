vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'No Highligh' })
vim.keymap.set('n', 'ciu', 'T_ct_', { desc = 'Change Inside underscore' })
vim.keymap.set('n', 'cu', 'ct_', { desc = 'Change to underscore' })
vim.keymap.set('n', 'diu', 'T_dt_', { desc = 'Delete inside underscore' })
vim.keymap.set('n', 'du', 'dt_', { desc = 'Delete to underscore' })
vim.keymap.set('n', 'gp', '"_dP', { desc = 'Yank line without break string' })
vim.keymap.set('n', 'yr', 'gp', { desc = 'Smart Paste' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll Down and Center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and Center' })
vim.keymap.set('n', '<leader>ep', 'viwp', { desc = 'Paste into current word' })
vim.keymap.set('n', '<leader>ef', function()
  vim.ui.input({ prompt = 'Enter filetype: ' }, function(input)
    if input and input ~= '' then
      vim.cmd('set filetype=' .. input)
    end
  end)
end, { desc = 'Set filetype' })
vim.keymap.set('n', ';;', 'A;<Esc>', { desc = 'Add ;' })
vim.keymap.set({ 'n', 'v' }, '<leader>tf', vim.lsp.buf.format, { desc = '[T]ap [F]ormat' })
vim.keymap.set('n', 'gD', '<cmd>vsplit | wincmd l | lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', 'gh', '<cmd>lua vim.diagnostic.open_float()<cr>' )
vim.keymap.set('n', 'g.', '<cmd>tabnew<cr><cmd>te<cr>itmux a<cr>')
vim.keymap.set('n', 'gb', '<cmd>bnext<cr>')
vim.keymap.set('n', 'gB', '<cmd>bprev<cr>')
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set('n', '<CR>', '<CR>', { buffer = true, noremap = true, silent = false })
  end,
})

-- tabs

vim.keymap.set('n', '<leader>1', '<cmd>1tabn<cr>')
vim.keymap.set('n', '<leader>2', '<cmd>2tabn<cr>')
vim.keymap.set('n', '<leader>3', '<cmd>3tabn<cr>')
vim.keymap.set('n', '<leader>4', '<cmd>4tabn<cr>')
vim.keymap.set('n', '<leader>5', '<cmd>5tabn<cr>')
vim.keymap.set('n', '<leader>5', '<cmd>5tabn<cr>')


vim.keymap.set('n', '<leader>tr', '<cmd>colorscheme randomhue<cr>')
