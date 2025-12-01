return{
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-mini/mini.icons" },
  config = function()
    require('fzf-lua').setup({
      winopts = {
        height = 0.45,
        width = 1.0,
        row = 1,
        col = 0,
        preview = {
          hidden = true
        }
      },
      keymap = {
        builtin = {
          true,
          ["<Tab>"] = "toggle-preview",
          ["<C-u>"] = "preview-page-up",
          ["<C-d>"] = "preview-page-down"
        },
      }

    })

    require('fzf-lua').register_ui_select()

    -- Find
    vim.keymap.set('n', '<leader>w', '<cmd>lua FzfLua.buffers()<cr>')
    vim.keymap.set('n', '<leader>f', '<cmd>lua FzfLua.files()<cr>')
    vim.keymap.set('n', '<leader>sn', "<cmd>lua FzfLua.files({cwd = '~/.config/nvim'})<cr>")
    -- Grep
    vim.keymap.set('n', '<leader>/', '<cmd>lua FzfLua.blines()<cr>')
    vim.keymap.set('n', 'g/', '<cmd>lua FzfLua.live_grep()<cr>')
    vim.keymap.set('n', '<leader>*', '<cmd>lua FzfLua.cWORD()<cr>')
    -- Git
    vim.keymap.set('n', '<leader>gg' ,'<cmd>lua FzfLua.git_files()<cr>')
    vim.keymap.set('n', '<leader>gs' ,'<cmd>lua FzfLua.git_status()<cr>')
    vim.keymap.set('n', '<leader>gS' ,'<cmd>lua FzfLua.git_stash()<cr>')
    vim.keymap.set('n', '<leader>gc' ,'<cmd>lua FzfLua.git_commits()<cr>')
    vim.keymap.set('n', '<leader>gC' ,'<cmd>lua FzfLua.git_bcommits()<cr>')
    -- Lsp
    vim.keymap.set('n', 'gd' ,'<cmd>lua FzfLua.lsp_definitions()<cr>')
    vim.keymap.set('n', 'gD' ,'<cmd>lua FzfLua.lsp_declarations()<cr>')
    vim.keymap.set('n', 'gI' ,'<cmd>lua FzfLua.lsp_implementations()<cr>')
    vim.keymap.set('n', 'gs' ,'<cmd>lua FzfLua.lsp_document_symbols()<cr>')
    vim.keymap.set('n', 'gS' ,'<cmd>lua FzfLua.lsp_live_workspace_symbols()<cr>')
    vim.keymap.set('n', 'gR' ,'<cmd>lua FzfLua.lsp_references()<cr>')
    vim.keymap.set('n', 'gy' ,'<cmd>lua FzfLua.lsp_typedefs()<cr>')
    vim.keymap.set('n', 'g.' ,'<cmd>lua FzfLua.lsp_code_actions()<cr>')
    vim.keymap.set('n', '<leader>q' ,'<cmd>lua FzfLua.lsp_document_diagnostics()<cr>')
    -- Misc
    vim.keymap.set('n', '<leader>sr' ,'<cmd>lua FzfLua.resume()<cr>')
    vim.keymap.set('n', '<F1>' ,'<cmd>lua FzfLua.helptags()<cr>')
    vim.keymap.set('n', '<F2>' ,'<cmd>lua FzfLua.manpages()<cr>')
    vim.keymap.set('n', '<F3>' ,'<cmd>lua FzfLua.colorschemes()<cr>')
    vim.keymap.set('n', '<F4>' ,'<cmd>lua FzfLua.keymaps()<cr>')
  end
}
