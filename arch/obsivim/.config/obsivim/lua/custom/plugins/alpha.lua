return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.buttons.val = {
			dashboard.button("n", " New Note", ":ObsidianNew<CR><CR>"),
			dashboard.button("nt", " New Note From Template", ":ObsidianNewFromTemplate<CR>"),
			dashboard.button("v", " Choose Vault", ":ObsidianWorkspace<CR>"),
			dashboard.button("td", "󰃶 Today", ":ObsidianToday<CR>"),
			dashboard.button("tm", " Tomorrow", ":ObsidianTomorrow<CR>"),
			dashboard.button("r", "󱠇  MRU", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
		}
		dashboard.section.header.val = {

			"██████╗░░█████╗░░█████╗░░██████╗",
			"██╔══██╗██╔══██╗██╔══██╗██╔════╝",
			"██║░░██║██║░░██║██║░░╚═╝╚█████╗░",
			"██║░░██║██║░░██║██║░░██╗░╚═══██╗",
			"██████╔╝╚█████╔╝╚█████╔╝██████╔╝",
			"╚═════╝░░╚════╝░░╚════╝░╚═════╝░",
		}
		alpha.setup(dashboard.opts)
	end,
}
