vim.cmd.colorscheme(Color.color)
if Color.opaque == 1 then
  vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'NormalNC', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'NormalFloat' })
else
  vim.api.nvim_set_hl(0, 'StatusLine', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'StatusLineNC', { link = 'Normal' })
  require('lualine').setup {}
end

vim.keymap.set('n', '<leader>tg', function()
  local normal = vim.fn.execute 'hi Normal'
  local current_color = vim.api.nvim_exec2('colorscheme', { output = true }).output
  if not string.find(normal, 'guibg') then
    vim.cmd.colorscheme(current_color)
    vim.api.nvim_set_hl(0, 'StatusLine', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { link = 'Normal' })
    require('lualine').setup {}
  else
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalNC', { link = 'Normal' })
  end
end, { desc = '[T]oggle back[G]round opacity' })
