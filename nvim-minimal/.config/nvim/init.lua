-- Options
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.netrw_banner=false

vim.o.rnu = true
vim.o.ac=true
vim.o.cpt='o'
vim.o.cot='popup,menuone,nosort,noselect'
vim.o.ts = 4
vim.o.et = true
vim.o.sw = 4
vim.o.wrap = false
vim.o.lbr = true
vim.o.shm='ltToOCFc'
vim.o.mouse = 'a'
vim.o.bri = true
vim.o.udf = true
vim.o.scs = true
vim.o.scl = 'yes'
vim.o.ut = 250
vim.o.tm = 300
vim.o.spr = true
vim.o.sb = true
vim.o.list = true
vim.o.so = 10
vim.o.swf = false
vim.o.ut=5000
vim.o.ch=0
vim.o.ph = 6
vim.o.lmap="ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"

vim.cmd [[se path+=**]]
vim.cmd('packadd! nvim.undotree')
vim.cmd('packadd! nohlsearch')
require('vim._extui').enable {}

-- Aucmds
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.html"},
  callback = function()
    vim.bo.filetype = "html"
  end,
})
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = false})
        end
    end,
})

-- Keymaps
vim.keymap.set('n',        '<leader>u',      ':Undotree<cr>')
vim.keymap.set('n',        '<leader>sn'     , function() vim.cmd.edit('$MYVIMRC') end)
vim.keymap.set('n',        '<leader>x',      '<cmd>Sex<cr>')
vim.keymap.set('n',        '<leader>o',      '<cmd>Ex<cr>')
vim.keymap.set({'n',"v"},  '<leader>y',      '"+y')
vim.keymap.set({'n'},      '<leader>Y',      '"+yy')
vim.keymap.set({'n', "v"}, '<leader>p',      '"+p')
vim.keymap.set({'n', "v"}, '<leader>P',      '"+P')
vim.keymap.set('n',        '<Esc>',          '<cmd>nohlsearch<CR>')
vim.keymap.set('n',        '<C-d>',          '<C-d>zz')
vim.keymap.set('n',        '<C-u>',          '<C-u>zz')
vim.keymap.set('n',        'R',              'viwp')
vim.keymap.set('n',        '<leader>r',      'viw"+p')
vim.keymap.set('n',        ';;',             'A;<Esc>')
vim.keymap.set('n',        'gb',             '<cmd>bnext<cr>')
vim.keymap.set('n',        'gB',             '<cmd>bprev<cr>')
vim.keymap.set('n',        '<C-Tab>',        '<cmd>b#<cr>')
vim.keymap.set('n',        'n',              'nzzzv')
vim.keymap.set('n',        'N',              'Nzzzv')
vim.keymap.set('v',        '<',              '<gv')
vim.keymap.set('v',        '>',              '>gv')
vim.keymap.set({'n', 'v'}, 'gh',             '^')
vim.keymap.set({'n', 'v'}, 'gl',             '$')
vim.keymap.set('n',        '$',              'ggVG')
vim.keymap.set('n',        [["]],            '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n',        "<leader>q",      '<cmd>lua vim.diagnostic.setloclist()<cr>')
vim.keymap.set('n',        "<C-v>i",         function() vim.cmd.source('.nvim/init.lua') end)
vim.keymap.set('n',        "<C-v>e",         function() vim.cmd.edit('.nvim/init.lua') end)
vim.keymap.set('i',        "<C-a>",          '<cmd>lua vim.lsp.buf.signature_help()<cr>')

-- LSP
vim.lsp.enable('lua_ls')
vim.lsp.enable('zls')
vim.lsp.enable('basedpyright')
vim.lsp.enable('ts_ls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('clangd')

-- Pack
vim.pack.add {
    "https://github.com/rose-pine/neovim",
    "https://github.com/nvim-mini/mini.ai",
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/nvim-mini/mini.splitjoin",
    "https://github.com/nvim-mini/mini.surround",
    "https://github.com/nvim-mini/mini.pairs",
    "https://github.com/nvim-mini/mini.pick",
    "https://github.com/nvim-mini/mini.cmdline",
    "https://github.com/neovim/nvim-lspconfig",
    'https://github.com/mrjones2014/smart-splits.nvim',
}

require('rose-pine').setup {
    variant = 'moon',
    enable= {
        terminal = false
    },
    styles = {
        italic = false,
        transparency = true
    },
    highlight_groups={
        StatusLineTerm = {link = "Normal"},
        StatusLineTermNC = {link = "Normal"}
   }

}
vim.cmd.colorscheme "rose-pine"

require('smart-splits').setup()
vim.keymap.set('n', '<A-h>',  require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>',  require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>',  require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>',  require('smart-splits').resize_right)
vim.keymap.set('n', '<C-h>',  require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>',  require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>',  require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>',  require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)

require 'mini.pick'.setup()
vim.keymap.set('n', '<leader>f',        '<cmd>Pick files<cr>')
vim.keymap.set('n', 'g/',               '<cmd>Pick grep_live<cr>')
vim.keymap.set('n', '<leader>w',        '<cmd>Pick buffers<cr>')
vim.keymap.set('n', '<leader><leader>', '<cmd>Pick resume<cr>')
vim.keymap.set('n', '<F1>',             '<cmd>Pick help<cr>')

local pair = require('mini.ai').gen_spec.pair
require('mini.icons').setup {}
require('mini.surround').setup {}
require('mini.pairs').setup {}
require('mini.ai').setup {
    n_lines = 500,
    custom_textobjects = {
        ['u'] = pair('_', '_', {type = "greedy"}),
        ['d'] = pair('-', '-', {type = "greedy"})
    },
}
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


-- vim.diagnostic.config({
--     virtual_lines = true
-- })

vim.lsp.inlay_hint.enable(true, { 0 })
