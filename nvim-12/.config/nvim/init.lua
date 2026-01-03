vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- ## LSP ===================================================
vim.lsp.enable('lua_ls')
vim.lsp.enable('zls')
vim.lsp.enable('basedpyright')
vim.lsp.enable('ts_ls')
vim.lsp.enable('rust_analyzer')
-- ## Opts ===================================================
vim.g.have_nerd_font = true
vim.g.netrw_banner = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autocomplete=true
vim.o.complete='.,w,b,spell'
vim.o.completeopt='preview,menuone,noselect,fuzzy,nosort'
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
vim.opt.swapfile = false
vim.o.winborder = 'rounded'
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 20
vim.opt.langmap="ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"
vim.cmd [[se path+=**]]
-- ## Plugins ===================================================
-- ### Pack ===================================================
vim.pack.add({
    "https://github.com/neanias/everforest-nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/ziglang/zig.vim",
    "https://github.com/nvim-mini/mini.extra",
    "https://github.com/nvim-mini/mini.jump2d",
    "https://github.com/nvim-mini/mini.ai",
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/nvim-mini/mini.diff",
    "https://github.com/nvim-mini/mini.splitjoin",
    "https://github.com/nvim-mini/mini.surround",
    "https://github.com/nvim-mini/mini.pairs",
    "https://github.com/nvim-mini/mini.cmdline",
    'https://github.com/mrjones2014/smart-splits.nvim',
})
-- ### Inits ===================================================
require('everforest').setup{
  transparent_background_level = 2
}
vim.cmd.colorscheme('everforest')
require('smart-splits').setup()
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
require('oil').setup {
      keymaps = {
        ['q'] = { 'actions.close', mode = 'n' },
      },
      use_default_keymaps = true,
      float = {
        max_width = 0.5,
        max_height = 0.5,
      },
}
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
require('mini.extra').setup {}
require('mini.icons').setup {}
require('mini.surround').setup {}
require('mini.pairs').setup {}
require('mini.jump2d').setup {
    allowed_windows = {
        not_current = false,
    },
    view= {
        n_steps_ahead = 1
    },
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
-- ## KEYMAPS =============================================
-- ### Editing  ===========================================
vim.keymap.set({'n',"v"}, '<leader>y', '"+y')
vim.keymap.set({'n'}, '<leader>Y', '"+yy')
vim.keymap.set({'n', "v"}, '<leader>p', '"+p')
vim.keymap.set({'n', "v"}, '<leader>P', '"+P')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'R', 'viwp')
vim.keymap.set('n', '<leader>r', 'viw"+p')
vim.keymap.set('n', '<leader>ef', function()
  vim.ui.input({ prompt = 'Enter filetype: ' }, function(input)
    if input and input ~= '' then
      vim.cmd('set filetype=' .. input)
    end
  end)
end)
vim.keymap.set('n', ';;', 'A;<Esc>', { desc = 'Add ;' })
-- ### Oil  ================================================
vim.keymap.set('n', '<leader>O', function()
  vim.ui.input({ prompt = 'Oil SSH to:' }, function(input)
    if input and input ~= '' then
      vim.cmd('Oil oil-ssh://' .. input .. "/")
    end
  end)
end, { desc = 'Oil SSH' })

-- vim.keymap.set('n', '<leader>o', function()
--     require('oil').toggle_float()
-- end)
-- ### Navigation  ================================================
vim.keymap.set('n', [["]], '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', 'gb', '<cmd>bnext<cr>')
vim.keymap.set('n', 'gB', '<cmd>bprev<cr>')
vim.keymap.set('n', '<C-Tab>', '<cmd>b#<cr>')
vim.keymap.set({'n', 'v'}, 'gh', '^')
vim.keymap.set({'n', 'v'}, 'gl', '$')
vim.keymap.set('n', '$', 'ggVG')
vim.keymap.set('n', '<leader>1', '<cmd>1tabn<cr>')
vim.keymap.set('n', '<leader>2', '<cmd>2tabn<cr>')
vim.keymap.set('n', '<leader>3', '<cmd>3tabn<cr>')
vim.keymap.set('n', '<leader>4', '<cmd>4tabn<cr>')
vim.keymap.set('n', '<leader>5', '<cmd>5tabn<cr>')
vim.keymap.set('n', '<C-[>', '<C-w>w')
vim.keymap.set('t', '<C-w>q', '<c-\\><c-n><c-w>q')
vim.keymap.set('t', '<C-[>', '<c-\\><c-n>')
vim.keymap.set('n', 'gZ', '<cmd>lua  MiniDiff.toggle_overlay()<cr>')
vim.keymap.set('n', '<leader>o', function()
    _G.wezpicker()
end)

_G.wezpicker = function()
    path = vim.fn.expand('%:p:h')
    pane_id = os.getenv('WEZTERM_PANE')
    if pane_id then
        vim.cmd('silent !wezterm cli spawn --cwd ' .. path .. ' ~/.config/wezterm/wezpicker ' .. pane_id)
    end
end
-- ### Toggles  ================================================
vim.keymap.set("n", '<leader>ti',
  function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 })
  end
)
vim.keymap.set("n", '<leader>tl', '<cmd>se bg=light<cr>')

local vt_enabled = false

vim.keymap.set("n", "<leader>tv", function()
    vt_enabled = not vt_enabled
    local diag_conf = {}
    if vt_enabled then
        diag_conf = {current_line = true}
    else
        diag_conf = false
    end
    vim.diagnostic.config({
        virtual_lines = diag_conf
    })
    print("Virtual text: " .. (vt_enabled and "ON" or "OFF"))
end)
vim.keymap.set('n', '<leader>tw',function() 
  vim.o.wrap = not vim.o.wrap
end)

vim.keymap.set('n', "<leader>dr", function()
    vim.cmd('!zig build-exe ' .. vim.fn.expand('%:t'))
    vim.cmd('!./' .. vim.fn.expand('%:t:r'))
end)
-- ### FzfLua  ================================================
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
vim.keymap.set('n', '<leader>G', function()
    pwd = vim.fn.getcwd()
    is_wezterm  = os.getenv('TERM_PROGRAM') == 'WezTerm'
    if is_wezterm then
        vim.cmd('silent !wezterm cli spawn --cwd ' .. pwd .. ' lazygit')
    end
end)
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
vim.keymap.set('n', '<leader>u' ,function() 
    require('fzf-lua').undotree({
        winopts = { preview = { hidden = false} }
    })
end)
-- ## Aucmds ==================================================================
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
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
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("active_cursorline", { clear = true }),
  callback = function()
    vim.opt_local.cursorline = true
  end,
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = "active_cursorline",
	callback = function()
		vim.opt_local.cursorline = false
	end,
})
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                end,
            })
        end
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
            end
        }
    }
    fzf_lua.fzf_exec("fd -a -td -tl -d 1", opts)
end
vim.cmd([[command! -nargs=* Configuration lua _G.fzf_config()]])
