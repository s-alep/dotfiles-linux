-- Persistent terminal toggle configuration
local terminal_bufnr = nil
local terminal_winnr = nil

vim.keymap.set('t', '<C-[>', '<c-\\><c-n>')
local function toggle_terminal()
  -- If terminal exists and is open, hide it
  if terminal_winnr and vim.api.nvim_win_is_valid(terminal_winnr) then
    vim.api.nvim_win_hide(terminal_winnr)
    terminal_winnr = nil
    return
  end

  -- If terminal buffer doesn't exist, create it
  if not terminal_bufnr or not vim.api.nvim_buf_is_valid(terminal_bufnr) then
    vim.cmd 'botright 12split | terminal'
    terminal_bufnr = vim.api.nvim_get_current_buf()
    terminal_winnr = vim.api.nvim_get_current_win()
    -- Set buffer options for the terminal
    vim.api.nvim_buf_set_option(terminal_bufnr, 'buflisted', false)
    vim.api.nvim_win_set_option(terminal_winnr, 'number', false)
    vim.api.nvim_win_set_option(terminal_winnr, 'relativenumber', false)
    -- Return to normal mode after opening
    vim.api.nvim_feedkeys('i', 'n', false)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true), 'n', false)
  else
    -- If terminal exists but is hidden, show it
    vim.cmd 'botright 12split'
    vim.api.nvim_win_set_buf(0, terminal_bufnr)
    terminal_winnr = vim.api.nvim_get_current_win()
    -- Return to normal mode
    vim.api.nvim_feedkeys('i', 'n', false)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true), 'n', false)
  end
end

-- Map <leader>tt to toggle the terminal
vim.keymap.set('n', '<leader>tt', toggle_terminal, { noremap = true, silent = true })
