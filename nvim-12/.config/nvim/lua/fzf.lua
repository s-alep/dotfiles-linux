vim.pack.add({
    "https://github.com/ibhagwan/fzf-lua",
})

local fzf = require('fzf-lua')

fzf.setup({
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
            ['ctrl-h'] = FzfLua.actions.file_split
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
})
fzf.register_ui_select()


local fzf_git_window_opts = {
    winopts = {
        fullscreen = true,
        preview = {
            layout = 'vertical',
            vertical = 'up:80%',
            hidden = false
        }
    }
}

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
    require('fzf-lua').git_commits(fzf_git_window_opts)
end)
vim.keymap.set('n', '<leader>gc', function()
    require('fzf-lua').git_bcommits(fzf_git_window_opts)
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
-- vim.keymap.set('n', '<leader>u' ,function() 
--     require('fzf-lua').undotree({
--         winopts = { preview = { hidden = false} }
--     })
-- end)
vim.keymap.set('n', '<leader>sp', function()
    local fzf_lua = require'fzf-lua'
    opts =  {
        cwd = '/home/salepakos/Documents/dev',
        prompt = "Directories> ",
        actions = {
            ['default'] = function(selected)
                vim.cmd("cd " .. selected[1])
                vim.cmd("Oil " .. selected[1])
            end
        }
    }
    fzf_lua.fzf_exec("fd -a --type d -d 2", opts)
end)

_G.fzf_config = function()
    local fzf_lua = require'fzf-lua'
    opts =  {
        cwd = '/home/salepakos/.config',
        prompt = "Configuration> ",
        winopts = {
            fullscreen = true
        },
        actions = {
            ['default'] = function(selected)
                vim.cmd("cd " .. selected[1])
                vim.cmd(":e " .. selected[1])
            end,
            ['q'] = function()
                vim.cmd.quit()
            end

        }
    }
    fzf_lua.fzf_exec("fd -a -td -tl -d 1", opts)
end
vim.cmd([[command! -nargs=* Configuration lua _G.fzf_config()]])
