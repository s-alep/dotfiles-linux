local options = {
  preview = false,
  layout = {
    backdrop = true,
    row = 0.65,
    column = 0.0,
    width = 0.9999,
    min_width = 80,
    height = 0.35,
    border = 'rounded',
    box = 'horizontal',
    {
      box = 'vertical',
      border = 'none',
      title = '{title} {live} {flags}',
      title_pos = 'center',
      { win = 'input', height = 1, border = 'none' },
      { win = 'list',border = 'none',
      },
    },
    { win = 'preview', title = '{preview}', border = 'left' },
  },
}
local live_preview = {
  finder = 'vim_colorschemes',
  format = 'text',
  preview = 'colorscheme',
  preset = 'vertical',
  confirm = function(picker, item)
    picker:close()
    if item then
      picker.preview.state.colorscheme = nil
      vim.schedule(function()
        vim.cmd('colorscheme ' .. item.text)
      end)
    end
  end,
}
local ivy = { preset = 'ivy', layout = { position = 'bottom' } }
return {
  'folke/snacks.nvim',
  opts = {
    picker = {
      prompt = "> ",
      win = {
        list ={
          keys = {
            ["<Tab>"] = { "toggle_preview", mode = { "i", "n" } },
            ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
          }
        },
        input ={
          keys = {
            ["<Tab>"] = { "toggle_preview", mode = { "i", "n" } },
            ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
          }
        }
      }
    },
    lazygit = {},
  },
  keys = {
    {'<C-w>g', function() Snacks.lazygit() end,},
    {'<leader>u', function() Snacks.picker.undo() end, desc = 'Undo History',},
    {'gs', function() Snacks.picker.lsp_symbols { layout = options } end, desc = 'LSP Symbols',},
    {'gS', function() Snacks.picker.lsp_workspace_symbols { layout = options } end, desc = 'LSP Workspace Symbols',},
    {'<F1>', function() Snacks.picker.help { layout = options } end, desc = 'Help Pages',},
    {'<F2>', function() Snacks.picker.keymaps { layout = options } end, desc = 'Keymaps',},
    {'<F3>', function() Snacks.picker.colorschemes { layout = live_preview } end, desc = 'Colorschemes',},
    {'<F4>', function() Snacks.picker.man { layout = options } end, desc = 'Man Pages',},
    {'<leader>gl', function() Snacks.picker.git_log() end, desc = 'Git Log',},
    {'<leader>gL', function() Snacks.picker.git_log_line() end, desc = 'Git Log Line',},
    {'<leader>glf', function() Snacks.picker.git_log_file() end, desc = 'Git Log File',},
    {'<leader>gs', function() Snacks.picker.git_status() end, desc = 'Git Status',},
    {'<leader>gS', function() Snacks.picker.git_stash() end, desc = 'Git Stash',},
    {'<leader>gg', function() Snacks.picker.git_files() end, desc = 'Find Git Files',},
    {'<leader>sp', function() Snacks.picker.projects {layout = options, dev = { '~/Documents/dev' } } end, desc = 'Projects',},
    {'<leader> ', function() Snacks.picker.buffers { current = false, sort_lastused = true, layout = options, } end, desc = 'Buffers',},
    { "g/", function() Snacks.picker.grep({layout = options}) end, desc = "Grep" },
    { "<leader>x", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader>sn", function() Snacks.picker.files({ layout = options,cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    {'<leader>p', function() Snacks.picker.files { layout = options } end, desc = 'Find Files',},
    { "<leader>/", function() Snacks.picker.lines({layout = options}) end, desc = "Buffer Lines" },
    { "<leader>*", function() Snacks.picker.grep_word({layout = options}) end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>q", function() Snacks.picker.diagnostics_buffer({layout = options}) end, desc = "Buffer Diagnostics" },
    { "<leader>sr", function() Snacks.picker.resume({layout = options}) end, desc = "Resume" },
    { "gd", function() Snacks.picker.lsp_definitions({ auto_confirm = true,layout = options}) end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations({layout = options}) end, desc = "Goto Declaration" },
    { "gR", function() Snacks.picker.lsp_references({layout = options}) end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations({layout = options}) end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions({layout = options}) end, desc = "Goto T[y]pe Definition" },
  },
}
