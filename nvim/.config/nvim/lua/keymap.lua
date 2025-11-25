vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'No Highligh' })
vim.keymap.set('n', 'ciu', 'T_ct_', { desc = 'Change Inside underscore' })
vim.keymap.set('n', 'cu', 'ct_', { desc = 'Change to underscore' })
vim.keymap.set('n', 'diu', 'T_dt_', { desc = 'Delete inside underscore' })
vim.keymap.set('n', 'du', 'dt_', { desc = 'Delete to underscore' })
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
vim.keymap.set({  'v' }, 'tf', vim.lsp.buf.format, { desc = '[T]ap [F]ormat' })
vim.keymap.set('n', 'gD', '<cmd>vsplit | wincmd l | lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', 'gh', '<cmd>lua vim.diagnostic.open_float()<cr>' )
vim.keymap.set('n', 'g-', '<cmd>tabnew<cr><cmd>te<cr>itmux a<cr>')
vim.keymap.set('n', 'gb', '<cmd>bnext<cr>')
vim.keymap.set('n', 'gB', '<cmd>bprev<cr>')

vim.keymap.set({'n', 'v'}, '<', '<<')
vim.keymap.set({'n', 'v'}, '>', '>>')
-- window mappings

-- vim.keymap.set('n', '<C-l>', '<C-w>l')
-- vim.keymap.set('n', '<C-k>', '<C-w>k')
-- vim.keymap.set('n', '<C-j>', '<C-w>j')
-- vim.keymap.set('n', '<C-h>', '<C-w>h')

-- tabs

vim.keymap.set('n', '<leader>1', '<cmd>1tabn<cr>')
vim.keymap.set('n', '<leader>2', '<cmd>2tabn<cr>')
vim.keymap.set('n', '<leader>3', '<cmd>3tabn<cr>')
vim.keymap.set('n', '<leader>4', '<cmd>4tabn<cr>')
vim.keymap.set('n', '<leader>5', '<cmd>5tabn<cr>')

vim.keymap.set('n', '<leader>u', '<cmd>Atone toggle<cr>')
-- vim.keymap.set('n', '<leader>o', '<cmd>Fyler kind=float<cr>')

vim.keymap.set('t', '<C-w>q', '<c-\\><c-n><c-w>q')
vim.keymap.set('t', '<C-[>', '<c-\\><c-n>')

vim.keymap.set("n", '<leader>ti',
  function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 })
  end
)
local vt_enabled = false

vim.keymap.set("n", "<leader>tv", function()
  vt_enabled = not vt_enabled
  vim.diagnostic.config({
    virtual_text = vt_enabled,
  })
  print("Virtual text: " .. (vt_enabled and "ON" or "OFF"))
end)
vim.keymap.set('n', '<leader>tw',function() 
  vim.o.wrap = not vim.o.wrap
end)

vim.keymap.set('n', '<leader>o', function()
  local pane_id = os.getenv('WEZTERM_PANE')
  local zellij = os.getenv('ZELLIJ')
  if pane_id ~= nil then
    local cwd = vim.fn.expand('%:p:h')
    os.execute("wezterm cli spawn --cwd " .. cwd .." /home/salepakos/.config/wezterm/wezpicker " .. pane_id)
  elseif zellij ~=nil then
    os.execute("zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- bash ~/.config/helix/zelpicker e %{buffer_name}")
  end
end)
