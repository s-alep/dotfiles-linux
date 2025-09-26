local options = {
  preview = false,
  layout = {
    backdrop = false,
    row = 10,
    width = 0.4,
    min_width = 80,
    height = 0.5,
    border = 'rounded',
    box = 'vertical',
    { win = 'preview', title = '{preview}', height = 1, border = 'rounded' },
    {
      box = 'vertical',
      border = 'rounded',
      title = '{title} {live} {flags}',
      title_pos = 'center',
      { win = 'input', height = 1, border = 'bottom' },
      { win = 'list', border = 'none' },
    },
  },
}
local live_preview ={
  finder = "vim_colorschemes",
  format = "text",
  preview = "colorscheme",
  preset = "vertical",
  confirm = function(picker, item)
    picker:close()
    if item then
      picker.preview.state.colorscheme = nil
      vim.schedule(function()
        vim.cmd("colorscheme " .. item.text)
      end)
    end
  end,
}
return {
  'folke/snacks.nvim',
  opts = {
    picker = {},
  },
  keys = {
    {'<leader>u', function() Snacks.picker.undo() end, desc = 'Undo History',},
    -- {'gs', function() Snacks.picker.lsp_symbols { layout = options } end, desc = 'LSP Symbols',},
    {'gS', function() Snacks.picker.lsp_workspace_symbols { layout = options } end, desc = 'LSP Workspace Symbols',},
    {'<F1>', function() Snacks.picker.help({layout = options}) end, desc = 'Help Pages',},
    {'<F2>', function() Snacks.picker.keymaps({layout = options}) end, desc = 'Keymaps',},
    {'<F3>', function() Snacks.picker.colorschemes({layout = live_preview}) end, desc = 'Colorschemes',},
    {'<F4>', function() Snacks.picker.man({layout = options}) end, desc = 'Man Pages',},
{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
{ "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
{ "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
{ "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
  },

}
