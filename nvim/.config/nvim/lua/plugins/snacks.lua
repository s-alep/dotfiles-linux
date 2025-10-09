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
local ivy = { preset = "ivy", layout = { position = "bottom" } }
return {
  'folke/snacks.nvim',
  opts = {
    picker = {},
    lazygit = {},
  },
  keys = {
    {'<C-w>g', function() Snacks.lazygit() end},
    {'<leader>u', function() Snacks.picker.undo() end, desc = 'Undo History',},
    {'gs', function() Snacks.picker.lsp_symbols { layout = options } end, desc = 'LSP Symbols',},
    {'gS', function() Snacks.picker.lsp_workspace_symbols { layout = options } end, desc = 'LSP Workspace Symbols',},
    {'<F1>', function() Snacks.picker.help({layout = options}) end, desc = 'Help Pages',},
    {'<F2>', function() Snacks.picker.keymaps({layout = options}) end, desc = 'Keymaps',},
    {'<F3>', function() Snacks.picker.colorschemes({layout = live_preview}) end, desc = 'Colorschemes',},
    {'<F4>', function() Snacks.picker.man({layout = options}) end, desc = 'Man Pages',},
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>glf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>sp", function() Snacks.picker.projects({dev = { "~/Documents/dev" }}) end, desc = "Projects" },
    -- { "<leader> ", function() Snacks.picker.buffers({layout = ivy}) end, desc = "Buffers" },
    -- { "g/", function() Snacks.picker.grep({layout = ivy}) end, desc = "Grep" },
    -- { "<leader>x", function() Snacks.explorer() end, desc = "File Explorer" },
    -- { "<leader>sn", function() Snacks.picker.files({ layout = ivy,cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    -- { "<leader>p", function() Snacks.picker.files({layout = ivy}) end, desc = "Find Files" },
    -- { "<leader>/", function() Snacks.picker.lines({layout = ivy}) end, desc = "Buffer Lines" },
    -- { "<leader>*", function() Snacks.picker.grep_word({layout = ivy}) end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- { "<leader>q", function() Snacks.picker.diagnostics_buffer({layout = ivy}) end, desc = "Buffer Diagnostics" },
    -- { "<leader>sr", function() Snacks.picker.resume({layout = ivy}) end, desc = "Resume" },
    -- { "gd", function() Snacks.picker.lsp_definitions({layout = ivy}) end, desc = "Goto Definition" },
    -- { "gD", function() Snacks.picker.lsp_declarations({layout = ivy}) end, desc = "Goto Declaration" },
    -- { "gR", function() Snacks.picker.lsp_references({layout = ivy}) end, nowait = true, desc = "References" },
    -- { "gI", function() Snacks.picker.lsp_implementations({layout = ivy}) end, desc = "Goto Implementation" },
    -- { "gy", function() Snacks.picker.lsp_type_definitions({layout = ivy}) end, desc = "Goto T[y]pe Definition" },
  },

}
