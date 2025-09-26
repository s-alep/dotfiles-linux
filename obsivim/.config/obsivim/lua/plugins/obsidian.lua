return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"bullets-vim/bullets.vim",
	},
	keys = {
		{ "bp", ":ObsidianQuickSwitch<CR>", desc = "[S]earch [O]bsidian Files" },
		{ "bg", ":ObsidianSearch<CR>", desc = "[S]earch [O]bsidian Headers" },
		{ "bt", ":ObsidianTags<CR>", desc = "[S]earch Obsidian [T]ags" },
		{ "bw", ":ObsidianWorkspace<CR>", desc = "[O]bsidian [W]orkspaces" },
		{ "bs", ":ObsidianFollowLink hsplit<CR>", desc = "[O]bsidian Open Definition in [S]plit" },
		{ "br", ":ObsidianRename<CR>", desc = "[O]bsidian [R]ename" },
		{ "bn", ":ObsidianNew<CR><CR>", desc = "[O]bsidian [N]ew" },
		{ "bdt", ":ObsidianToday<CR>", desc = "[D]aily [T]oday" },
		{ "bdw", ":ObsidianDailies -6 6<CR>", desc = "[D]aily all [W]eek" },
		{
			"bl",
			function()
				local line_num = vim.api.nvim_win_get_cursor(0)[1]
				local line = vim.api.nvim_get_current_line()

				-- Match "HH:MM - HH:MM"
				local h1, m1, h2, m2 = string.match(line, "(%d%d):(%d%d)%s*%-%s*(%d%d):(%d%d)")

				if h1 and m1 and h2 and m2 then
					local t1 = tonumber(h1) * 60 + tonumber(m1)
					local t2 = tonumber(h2) * 60 + tonumber(m2)
					local diff = t2 - t1

					if diff < 0 then
						print("End time is before start time.")
						return
					end

					local dh = math.floor(diff / 60)
					local dm = diff % 60

					local duration = string.format("=> %02d:%02d", dh, dm)
					local updated = line .. " " .. duration

					vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { updated })
				else
					print("Line does not match expected format (HH:MM - HH:MM)")
				end
			end,
			desc = "Get Work [L]og",
		},
	},
	opts = {
		ui = {
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
			},
		},
		templates = {
			folder = "templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			substitutions = {},
		},
		workspaces = {
			{
				name = "notes",
				path = "~/Documents/notes/coding/",
			},
			{
				name = "songs",
				path = "~/Documents/notes/songs",
			},
			{
				name = "chill",
				path = "~/Documents/notes/chill",
			},
			{
				name = "journal",
				path = "~/Documents/notes/journal",
			},
		},
	},
}
