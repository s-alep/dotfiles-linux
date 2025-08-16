return {
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = false,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"bullets-vim/bullets.vim",
		},
		keys = {
			{ "<leader>so", ":ObsidianQuickSwitch<CR>", desc = "[S]earch [O]bsidian Files" },
			{ "<leader>ss", ":ObsidianSearch<CR>", desc = "[S]earch [O]bsidian Headers" },
			{ "<leader>st", ":ObsidianTags<CR>", desc = "[S]earch Obsidian [T]ags" },
			{ "<leader>og", ":ObsidianSearch<CR>", desc = "[O]bsidian [G]rep" },
			{ "<leader>ow", ":ObsidianWorkspace<CR>", desc = "[O]bsidian [W]orkspaces" },
			{ "<leader>os", ":ObsidianFollowLink hsplit<CR>", desc = "[O]bsidian Open Definition in [S]plit" },
			{ "<leader>or", ":ObsidianRename<CR>", desc = "[O]bsidian [R]ename" },
			{ "<leader>on", ":ObsidianNew<CR><CR>", desc = "[O]bsidian [N]ew" },
			{ "<leader>dt", ":ObsidianToday<CR>", desc = "[D]aily [T]oday" },
			{ "<leader>dw", ":ObsidianDailies -6 6<CR>", desc = "[D]aily all [W]eek" },
			{
				"<leader>oc",
				function()
					vim.ui.input({ prompt = "Enter filename: " }, function(input)
						if input and input ~= "" then
							vim.cmd("ObsidianNewFromTemplate " .. input .. ".md")
						end
					end)
				end,
				desc = "[O]bsidian New [C]apture",
			},
			{
				"<leader>ol",
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
	},
	{
		"hedyhli/outline.nvim",
		config = function()
			-- Example mapping to toggle outline
			vim.keymap.set("n", "<leader>oo", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

			require("outline").setup({})
		end,
	},
}
