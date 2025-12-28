vim.pack.add({
    "https://github.com/nvim-mini/mini.extra",
    "https://github.com/nvim-mini/mini.jump2d",
    "https://github.com/nvim-mini/mini.ai",
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/nvim-mini/mini.diff",
    "https://github.com/nvim-mini/mini.splitjoin",
    "https://github.com/nvim-mini/mini.surround",
    "https://github.com/nvim-mini/mini.pairs",
    "https://github.com/nvim-mini/mini.cmdline",
})

require('mini.extra').setup {}
require('mini.icons').setup {}
require('mini.surround').setup {}
require('mini.pairs').setup {}
require('mini.jump2d').setup {
    mappings = {
        start_jumping = "gw"
    }
}

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

require('mini.diff').setup{
    mappings = {
        apply = 'gq',
        reset = 'gz',
        textobject = 'gz'
    }
}
vim.keymap.set('n', 'gZ', '<cmd>lua  MiniDiff.toggle_overlay()<cr>')

require('mini.splitjoin').setup {
    mappings = { toggle = 'grs', split = '', join = '' }
}

require('mini.cmdline').setup {
    autocomplete ={
        enable = true,
        delay = 300
    },
    autopeek = {
        enable = false
    }
}
