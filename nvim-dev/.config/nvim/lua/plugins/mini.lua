return {
    {'nvim-mini/mini.extra', version = false, config = function()  require('mini.extra').setup()end,},
    {'nvim-mini/mini.pick', version = false, config = function()  require('mini.pick').setup()end,},
    { 'nvim-mini/mini.jump2d', version = '*', config= function() require('mini.jump2d').setup({
        mappings = {
            start_jumping = "gw"
        }
    }) end},
    {
        'nvim-mini/mini.ai',
        version = '*',
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
    {'nvim-mini/mini.icons', version = '*', config = function()   require('mini.icons').setup {}end,},
    { 'nvim-mini/mini.diff', version = false, config = function()
        require('mini.diff').setup{
            mappings = {
                apply = 'gq',
                reset = 'gz',
                textobject = 'gz'
            }
        }
        vim.keymap.set('n', 'gZ', '<cmd>lua  MiniDiff.toggle_overlay()<cr>')
    end},
    -- {
    --     'nvim-mini/mini.indentscope',
    --     version = false,
    --     config = function()
    --         require('mini.indentscope').setup {
    --             draw = { delay = 0, animation = require('mini.indentscope').gen_animation.none() },
    --             options = { try_as_border = true },
    --             symbol = '│',
    --         }
    --     end,
    -- },
    {
        'nvim-mini/mini.splitjoin',
        version = '*',
        config = function()
            require('mini.splitjoin').setup {
                mappings = { toggle = 'grs', split = '', join = '' }
            }
        end,
    },
    {'nvim-mini/mini.surround', version = '*', config = function()   require('mini.surround').setup {}end,},
    {'nvim-mini/mini.pairs', version = '*', config = function()   require('mini.pairs').setup()end },
    -- {'nvim-mini/mini.hues', version = false, config = function() 
    --     require('mini.hues').setup({ background = '#002734', foreground = '#c0c8cc' }) -- azure
    -- end },
    {'nvim-mini/mini.cmdline', version = '*', config = function()   require('mini.cmdline').setup({
        autocomplete ={
            enable = true,
            delay = 300
        },
        autopeek = {
            enable = false
        }
    })end },
}
