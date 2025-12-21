return {
    {  'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
        requires = 'nvim-treesitter/nvim-treesitter',
        branch = 'main'
    },
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    enable_close = true, -- Auto close tags
                    enable_rename = true, -- Auto rename pairs of tags
                    enable_close_on_slash = false -- Auto close on trailing </
                },
                per_filetype = {
                    -- ["html"] = {
                    --     enable_close = false
                    -- }
                }
            })
        end
    },
    { 'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require 'treesitter-context'.setup {
                enable = false
            }
            vim.keymap.set('n', '<leader>tc', '<cmd>TSContext toggle<cr>')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate',
        config = function()
            local ts = require('nvim-treesitter')
            ts.install({
                'bash',
                'comment',
                'css',
                'diff',
                'fish',
                'git_config',
                'git_rebase',
                'gitcommit',
                'gitignore',
                'html',
                'javascript',
                'json',
                'latex',
                'lua',
                'luadoc',
                'make',
                'markdown',
                'markdown_inline',
                'norg',
                'python',
                'query',
                'regex',
                'scss',
                'svelte',
                'toml',
                'tsx',
                'typescript',
                'typst',
                'vim',
                'vimdoc',
                'vue',
                'xml',
            })

            local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

            local ignore_filetypes = {
                'checkhealth',
                'lazy',
                'mason',
                'snacks_dashboard',
                'snacks_notif',
                'snacks_win',
            }

            -- Auto-install parsers and enable highlighting on FileType
            vim.api.nvim_create_autocmd('FileType', {
                group = group,
                desc = 'Enable treesitter highlighting and indentation',
                callback = function(event)
                    if vim.tbl_contains(ignore_filetypes, event.match) then
                        return
                    end
                    local lang = vim.treesitter.language.get_lang(event.match) or event.match
                    local buf = event.buf
                    pcall(vim.treesitter.start, buf, lang)
                    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    ts.install({ lang })
                end,
            })
        end,
    }
}
