vim.keymap.set('n', "<C-v>i", function() vim.cmd.source '.nvim/init.lua'end)
vim.keymap.set('n', "<C-v>e", function() vim.cmd.edit '.nvim/init.lua'end)

vim.keymap.set({'n',"v"}, '<leader>y', '"+y')
vim.keymap.set({'n'}, '<leader>Y', '"+yy')
vim.keymap.set({'n', "v"}, '<leader>p', '"+p')
vim.keymap.set({'n', "v"}, '<leader>P', '"+P')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'R', 'viwp')
vim.keymap.set('n', '<leader>r', 'viw"+p')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('n', '<leader>ef', function()
  vim.ui.input({ prompt = 'Enter filetype: ' }, function(input)
    if input and input ~= '' then
      vim.cmd('set filetype=' .. input)
    end
  end)
end)

vim.keymap.set('n', ';;', 'A;<Esc>', { desc = 'Add ;' })
vim.keymap.set('n', 'gD', '<cmd>vsplit | wincmd l | lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', [["]], '<cmd>lua vim.diagnostic.open_float()<cr>' )

vim.keymap.set('n', 'gb', '<cmd>bnext<cr>')
vim.keymap.set('n', 'gB', '<cmd>bprev<cr>')
vim.keymap.set('n', '<C-Tab>', '<cmd>b#<cr>')

vim.keymap.set('n', 'gh', '^')
vim.keymap.set('n', 'gl', '$')
vim.keymap.set('n', '%', 'ggVG')

vim.keymap.set('n', '<leader>1', '<cmd>1tabn<cr>')
vim.keymap.set('n', '<leader>2', '<cmd>2tabn<cr>')
vim.keymap.set('n', '<leader>3', '<cmd>3tabn<cr>')
vim.keymap.set('n', '<leader>4', '<cmd>4tabn<cr>')
vim.keymap.set('n', '<leader>5', '<cmd>5tabn<cr>')


vim.keymap.set('t', '<C-w>q', '<c-\\><c-n><c-w>q')
vim.keymap.set('t', '<C-[>', '<c-\\><c-n>')

vim.keymap.set("n", '<leader>ti', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 })
end)

vim.keymap.set("n", '<leader>tl', function()
    local current = vim.api.nvim_get_option_value("background", {})
    vim.opt.background = (current == 'light') and 'dark' or 'light'
end)

vim.keymap.set("n", "<leader>tv", function()
    local vt_enabled = not vim.diagnostic.config().virtual_text
    vim.diagnostic.config({
        virtual_text = vt_enabled and {current_line = true} or false
    })
    print("Virtual text: " .. (vt_enabled and "ON" or "OFF"))
end)

vim.keymap.set('n', '<leader>tw',function()
  vim.o.wrap = not vim.o.wrap
end)
