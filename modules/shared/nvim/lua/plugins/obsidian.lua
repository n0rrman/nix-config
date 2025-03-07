return {
	"epwalsh/obsidian.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "main",
				path = "~/Obsidian/main",
			},
		},
		ui = {
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
			},
		},

		mappings = {
			["<leader>ox"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			["<cr>"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { buffer = true, expr = true },
			},
		},
		templates = {
			folder = "template",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			substitutions = {},
		},
		daily_notes = {
			folder = "daily",
			template = "default.md",
		},
		notes_subdir = "quick",
		note_id_func = function()
			return tostring(os.time())
		end,

		follow_url_func = function(url)
			vim.ui.open(url)
		end,
	},
}
