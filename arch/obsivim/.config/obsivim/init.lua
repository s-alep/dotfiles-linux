--
-- Vim options
--
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showbreak = "↪ "
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.opt.showmode = false
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.api.nvim_create_user_command("Push", function()
	local datetime = os.date("%y%m%d%H%M")
	local command = '!git commit -m "notes sync ' .. datetime .. '"'
	vim.cmd("Git add .")
	vim.cmd(command)
	vim.cmd("Git push")
end, {})
-- Other keymaps
vim.keymap.set("n", "<M-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<M-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<M-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>ta", ":Alpha<cr>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-sleuth",
	"tpope/vim-surround",
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{ import = "custom.plugins" },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
vim.cmd.colorscheme("eldritch")
vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#ff6c6b", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#da8548", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#98be65", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#51afef", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = "#c678dd", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = "#46d9ff", bold = true })

vim.diagnostic.config({ virtual_text = { current_line = true } })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
