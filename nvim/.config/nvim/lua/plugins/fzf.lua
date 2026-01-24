return{
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-mini/mini.icons" },
    keys = {
        {'<leader>w', function() require('fzf-lua').buffers() end},
        {'<leader>f', function() require('fzf-lua').files() end},
        {'<leader>sn', function() require('fzf-lua').files({cwd='~/.config/nvim'}) end},
        {'<leader>/', function() require('fzf-lua').blines() end},
        {'g/', function() require('fzf-lua').live_grep() end},
        {'<leader>*', function() require('fzf-lua').cWORD() end},
        {'<leader>*', function() require('fzf-lua').cWORD() end},
        {'<leader>gg', function() require('fzf-lua').git_files() end},
        {'<leader>gb', function() require('fzf-lua').git_blame() end},
        {'<leader>gs', function() require('fzf-lua').git_status() end},
        {'<leader>gS', function() require('fzf-lua').git_stash() end},
        {'<leader>gl', function() require('fzf-lua').git_commits({
            winopts = { preview = { hidden = false} }
        }) end},
        {'<leader>gc', function() require('fzf-lua').git_bcommits({
            winopts = { preview = { hidden = false} }
        }) end},
        {'<leader>gd', function() require('fzf-lua').lsp_definitions() end},
        {'<leader>gD', function()
            vim.cmd "vsplit"
            require('fzf-lua').lsp_definitions()
        end},
        {'gI', function() require('fzf-lua').lsp_implementations() end},
        {'gs', function() require('fzf-lua').lsp_document_symbols() end},
        {'gS', function() require('fzf-lua').lsp_workspace_symbols() end},
        {'gR', function() require('fzf-lua').lsp_references() end},
        {'gy', function() require('fzf-lua').lsp_typedefs() end},
        {'g.', function() require('fzf-lua').lsp_code_actions() end},
        {'<leader>q', function() require('fzf-lua').lsp_documents_diagnostics() end},
        {'<leader><leader>', function() require('fzf-lua').resume() end},
        {'<F1>', function() require('fzf-lua').helptags() end},
        {'<F2>', function() require('fzf-lua').manpages() end},
        {'<F3>', function() require('fzf-lua').colorschemes() end},
        {'<F4>', function() require('fzf-lua').keymaps() end},
        {'<leader>u', function() require('fzf-lua').undotree({
            winopts = { preview = { hidden = false} }
        }) end},


    },
    opts = function()
        return {
            winopts = {
                height = 0.45,
                width = 1.0,
                row = 1,
                col = 0,
                preview = {
                    hidden = true
                }
            },
            actions = {
                files = {
                    true,
                    ['ctrl-h'] = require('fzf-lua').actions.file_split
                }
            },
            keymap = {
                builtin = {
                    true,
                    ["<Tab>"] = "toggle-preview",
                    ["<C-u>"] = "preview-page-up",
                    ["<C-d>"] = "preview-page-down",
                },
            }
        }
    end,
    config = function(_, opts)
        require 'fzf-lua'.setup(opts)
        require('fzf-lua').register_ui_select()
    end
}
