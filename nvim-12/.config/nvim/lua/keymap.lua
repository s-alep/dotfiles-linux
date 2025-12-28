vim.keymap.set({'n',"v"}, '<leader>y', '"+y')
vim.keymap.set({'n'}, '<leader>Y', '"+yy')
vim.keymap.set({'n', "v"}, '<leader>p', '"+p')
vim.keymap.set({'n', "v"}, '<leader>P', '"+P')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'R', 'viwp')
vim.keymap.set('n', '<leader>r', 'viw"+p')

vim.keymap.set('n', '<leader>ef', function()
  vim.ui.input({ prompt = 'Enter filetype: ' }, function(input)
    if input and input ~= '' then
      vim.cmd('set filetype=' .. input)
    end
  end)
end)

vim.keymap.set('n', '<leader>O', function()
  vim.ui.input({ prompt = 'Oil SSH to:' }, function(input)
    if input and input ~= '' then
      vim.cmd('Oil oil-ssh://' .. input .. "/")
    end
  end)
end, { desc = 'Oil SSH' })

vim.keymap.set('n', '<leader>o', function()
    require('oil').toggle_float()
end)

vim.keymap.set('n', ';;', 'A;<Esc>', { desc = 'Add ;' })
vim.keymap.set('n', [["]], '<cmd>lua vim.diagnostic.open_float()<cr>')

vim.keymap.set('n', 'gb', '<cmd>bnext<cr>')
vim.keymap.set('n', 'gB', '<cmd>bprev<cr>')
vim.keymap.set('n', '<C-Tab>', '<cmd>b#<cr>')

vim.keymap.set('n', 'gh', '^')
vim.keymap.set('n', 'gl', '$')

vim.keymap.set('n', '<leader>1', '<cmd>1tabn<cr>')
vim.keymap.set('n', '<leader>2', '<cmd>2tabn<cr>')
vim.keymap.set('n', '<leader>3', '<cmd>3tabn<cr>')
vim.keymap.set('n', '<leader>4', '<cmd>4tabn<cr>')
vim.keymap.set('n', '<leader>5', '<cmd>5tabn<cr>')

vim.keymap.set('n', '<C-[>', '<C-w>w')


vim.keymap.set('t', '<C-w>q', '<c-\\><c-n><c-w>q')
vim.keymap.set('t', '<C-[>', '<c-\\><c-n>')

vim.keymap.set("n", '<leader>ti',
  function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 })
  end
)
vim.keymap.set("n", '<leader>tl', '<cmd>se bg=light<cr>')

local vt_enabled = false

vim.keymap.set("n", "<leader>tv", function()
    vt_enabled = not vt_enabled
    local diag_conf = {}
    if vt_enabled then
        diag_conf = {current_line = true}
    else
        diag_conf = false
    end
    vim.diagnostic.config({
        virtual_lines = diag_conf
    })
    print("Virtual text: " .. (vt_enabled and "ON" or "OFF"))
end)
vim.keymap.set('n', '<leader>tw',function() 
  vim.o.wrap = not vim.o.wrap
end)

vim.keymap.set('n', "<leader>dr", function()
    vim.cmd('!zig build-exe ' .. vim.fn.expand('%:t'))
    vim.cmd('!./' .. vim.fn.expand('%:t:r'))
end)
vim.keymap.set('n', '<leader>w', '<cmd>lua FzfLua.buffers()<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>lua FzfLua.files()<cr>')
vim.keymap.set('n', '<leader>sn', "<cmd>lua FzfLua.files({cwd = '~/.config/nvim'})<cr>")

vim.keymap.set(
    { "n", "v", "i" },
    "<C-x><C-f>",
    function() require('fzf-lua').complete_path() end,
    { silent = true, desc = "Fuzzy complete path" }
)
vim.keymap.set('n', '<leader>/', '<cmd>lua FzfLua.blines()<cr>')
vim.keymap.set('n', 'g/', '<cmd>lua FzfLua.live_grep()<cr>')
vim.keymap.set('n', '<leader>*', '<cmd>lua FzfLua.cWORD()<cr>')
vim.keymap.set('n', '<leader>gg' ,'<cmd>lua FzfLua.git_files()<cr>')
vim.keymap.set('n', '<leader>gb' ,'<cmd>lua FzfLua.git_blame()<cr>')
vim.keymap.set('n', '<leader>gs' ,'<cmd>lua FzfLua.git_status()<cr>')
vim.keymap.set('n', '<leader>gS' ,'<cmd>lua FzfLua.git_stash()<cr>')
vim.keymap.set('n', '<leader>gl', function()
    require('fzf-lua').git_commits({
        winopts = { preview = { hidden = false} }
    })
end)
vim.keymap.set('n', '<leader>gc', function()
    require('fzf-lua').git_bcommits({
        winopts = { preview = { hidden = false} }
    })
end)
vim.keymap.set('n', 'gd' ,'<cmd>lua FzfLua.lsp_definitions()<cr>')
vim.keymap.set('n', 'gD' , function()
    vim.cmd("vsplit")
    vim.lsp.buf.definition()
end)
vim.keymap.set('n', 'gI' ,'<cmd>lua FzfLua.lsp_implementations()<cr>')
vim.keymap.set('n', 'gs' ,'<cmd>lua FzfLua.lsp_document_symbols()<cr>')
vim.keymap.set('n', 'gS' ,'<cmd>lua FzfLua.lsp_live_workspace_symbols()<cr>')
vim.keymap.set('n', 'gR' ,'<cmd>lua FzfLua.lsp_references()<cr>')
vim.keymap.set('n', 'gy' ,'<cmd>lua FzfLua.lsp_typedefs()<cr>')
vim.keymap.set('n', 'g.' ,'<cmd>lua FzfLua.lsp_code_actions()<cr>')
vim.keymap.set('n', '<leader>q' ,'<cmd>lua FzfLua.lsp_document_diagnostics()<cr>')
vim.keymap.set('n', '<leader>sr' ,'<cmd>lua FzfLua.resume()<cr>')
vim.keymap.set('n', '<F1>' ,'<cmd>lua FzfLua.helptags()<cr>')
vim.keymap.set('n', '<F2>' ,'<cmd>lua FzfLua.manpages()<cr>')
vim.keymap.set('n', '<F3>' ,'<cmd>lua FzfLua.colorschemes()<cr>')
vim.keymap.set('n', '<F4>' ,'<cmd>lua FzfLua.keymaps()<cr>')
vim.keymap.set('n', '<leader>u' ,function() 
    require('fzf-lua').undotree({
        winopts = { preview = { hidden = false} }
    })
end)

-- vim.keymap.set('n', '<C-h>',  function() vim.cmd("!zellij action move-focus right")end)
-- vim.keymap.set('n', '<C-l>',  function() vim.cmd("!zellij action move-focus left")end)
