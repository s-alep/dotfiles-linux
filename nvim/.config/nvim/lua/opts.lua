vim.g.have_nerd_font = true
vim.g.netrw_banner = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showbreak = '↪ '
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
-- vim.schedule(function()
--   vim.opt.clipboard = 'unnamedplus'
-- end)
vim.opt.breakindent = true
-- vim.opt.termguicolors = false
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
vim.o.shell="/usr/sbin/nu"
vim.o.shcf = "--config ~/.config/nushell/config.nu -c"

-- local highlights = {
--   ["@keyword"]      = { ctermfg = 5,  bold = true  }, -- magenta
--   ["@function"]     = { ctermfg = 4,  bold = true  }, -- blue
--   ["@function.call"]= { ctermfg = 4 },
--   ["@method"]       = { ctermfg = 4 },
--   ["@variable"]     = { ctermfg = 7 },                -- bright white
--   ["@variable.builtin"] = { ctermfg = 6 },            -- cyan
--   ["@parameter"]    = { ctermfg = 3 },                -- yellow
--   ["@field"]        = { ctermfg = 6 },                -- cyan
--   ["@property"]     = { ctermfg = 6 },
--   ["@constant"]     = { ctermfg = 3 },                -- yellow
--   ["@constant.builtin"] = { ctermfg = 1 },            -- red
--   ["@type"]         = { ctermfg = 2, bold = true },   -- green
--   ["@type.builtin"] = { ctermfg = 2 },
--   ["@string"]       = { ctermfg = 2 },                -- green
--   ["@number"]       = { ctermfg = 3 },                -- yellow
--   ["@boolean"]      = { ctermfg = 1 },                -- red
--   ["@operator"]     = { ctermfg = 3 },                -- yellow
--   ["@comment"]      = { ctermfg = 8, italic = true }, -- dim/gray
--   ["@punctuation"]  = { ctermfg = 7 },                -- bright white
-- }
--
-- vim.api.nvim_set_hl(0, 'StatusLine', { link = 'Normal' })
-- vim.api.nvim_set_hl(0, 'StatusLineNC', { link = 'Normal' })
--
-- for group, opts in pairs(highlights) do
--     vim.api.nvim_set_hl(0, group, opts)
-- end
