return {
	{
		"rebelot/kanagawa.nvim",
		opts = { transparent = false },
	},
	-- { 'zenbones-theme/zenbones.nvim' },
	{ "EdenEast/nightfox.nvim" },
	{ "ramojus/mellifluous.nvim" },
	{ "eldritch-theme/eldritch.nvim" },
	{ "dgox16/oldworld.nvim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "cool",
			})
		end,
	},
}
