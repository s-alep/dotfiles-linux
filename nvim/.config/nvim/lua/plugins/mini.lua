return {
    {'nvim-mini/mini.extra', version = false, config = true,},
    {'nvim-mini/mini.icons', version = '*', config = true},
    {'nvim-mini/mini.surround', version = '*', config = true},
    {'nvim-mini/mini.pairs', version = '*', config = true},
    {'nvim-mini/mini.ai', version = '*',
        config = function()
            local treesitter = require('mini.ai').gen_spec.treesitter
            local ai = require('mini.extra').gen_ai_spec
            local pair = require('mini.ai').gen_spec.pair
            require('mini.ai').setup {
                n_lines = 500,
                custom_textobjects = {
                    f = treesitter { a = '@function.outer', i = '@function.inner' },
                    c = treesitter { a = '@class.outer', i = '@class.inner' },
                    g = treesitter { a = '@comment.outer', i = '@comment.inner' },
                    i = ai.indent(),
                    B = ai.buffer(),
                    ['u'] = pair('_', '_', {type = "greedy"}),
                    ['d'] = pair('-', '-', {type = "greedy"})
                },
            }
        end,
    },
    {'nvim-mini/mini.diff', version = false,
        opts = {
            mappings = {
                apply = 'gq',
                reset = 'gz',
                textobject = 'gz'
            }
        },
        keys = {
            {'gZ', '<cmd>lua  MiniDiff.toggle_overlay()<cr>'}
        }
    },
    {'nvim-mini/mini.splitjoin', version = '*',
        opts =  {
            mappings = { toggle = 'grs', split = '', join = '' }
        }
    },
    {'nvim-mini/mini.cmdline', version = '*',
        opts = {
            autocomplete ={
                enable = true,
                delay = 300
            },
            autopeek = {
                enable = false
            }
        }
    }
}
