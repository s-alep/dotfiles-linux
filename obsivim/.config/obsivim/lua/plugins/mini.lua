return {
	"nvim-mini/mini.nvim",
	config = function()
		require("mini.pairs").setup()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.surround").setup()
		require("mini.icons").setup()
		require("mini.git").setup()
	end,
}
