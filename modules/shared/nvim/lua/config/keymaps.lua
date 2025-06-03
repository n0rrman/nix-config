--
-- CONFIG --
--
-- Imports
local ng = require("ng")
local telescope = require("telescope.builtin")
local harpoon = require("harpoon")

-- New keymap function
local function keymap(input, output, desc, mode)
	local opts = {
		noremap = true,
		silent = true,
		desc = desc,
	}
	vim.keymap.set(mode or "n", input, output, opts)
end

--
-- GENERAL KEYMAPS --
keymap("<F1>", "<Nop>", "Disable F1 help")
keymap("Q", "<Nop>", "Disable Ex mode")
--
-- Window navigation: ctrl-[h,j,k,l]
keymap("<C-h>", "<cmd>wincmd h<CR>", "Window navigation: Navigate to left window")
keymap("<C-j>", "<cmd>wincmd j<CR>", "Window navigation: Navigate to lower window")
keymap("<C-k>", "<cmd>wincmd k<CR>", "Window navigation: Navigate to upper window")
keymap("<C-l>", "<cmd>wincmd l<CR>", "Window navigation: Navigate to right window")

-- Window arrangement: Leader->CTRL-[h,j,k,l]
keymap("<leader><C-h>", "<C-W><S-h>", "Window arrangement: Move window left")
keymap("<leader><C-j>", "<C-W><S-j>", "Window arrangement: Move window down")
keymap("<leader><C-k>", "<C-W><S-k>", "Window arrangement: Move window up")
keymap("<leader><C-l>", "<C-W><S-l>", "Window arrangement: Move window right")

-- Window resize: Leader->[h,j,k,l]
keymap("<leader>h", "<C-W>5<", "Window resize: Move window border left")
keymap("<leader>j", "<C-W>5+", "Window resize: Move window border down")
keymap("<leader>k", "<C-W>5-", "Window resize: Move window border up")
keymap("<leader>l", "<C-W>5>", "Window resize: Move window border right")

-- Tab management: Leader->t...
keymap("<leader>tn", "<cmd>tabnew<cr>", "Tab management: Create new tab")
keymap("<leader>tx", "<cmd>tabclose<cr>", "Tab management: Close current tab")
keymap("<leader>t,", ":LualineRenameTab ", "Tab management: Rename current tab")
for i = 1, 9 do
	keymap(
		string.format("<leader>%d", i),
		string.format("<cmd>tabnext %d<cr>", i),
		string.format("Tab management: Go to tab %d", i)
	)

	keymap(
		string.format("<leader>t%d", i),
		string.format("<cmd>tabnext %d<cr>", i),
		string.format("Tab management: Go to tab %d (alt)", i)
	)

	keymap(
		string.format("<leader>tm%d", i),
		string.format("<cmd>tabmove %d<cr>", i),
		string.format("Tab management: Move tab to position %d", i)
	)
end

-->
-- PLUGIN KEYMAPS --

-- Copy / paste: Leader -> c
keymap("<leader>cy", '"+y', "Copy selection to clipboard", "v")
keymap("<leader>cp", '"+p', "Paste from clipboard", "")

-- Oil: -
keymap("-", "<CMD>Oil --float<CR>", "Oil: Open Oil / Open parent directory")

-- Angular: Leader -> n
keymap("<leader>nt", ng.goto_template_for_component, "Ng: Go to template file")
keymap("<leader>nc", ng.goto_component_with_template_file, "Ng: Go to component file")
keymap("<leader>nT", ng.get_template_tcb, "Ng: Get template typecheck block")

-- Git: Leader -> g
keymap("<leader>gk", "<cmd>DiffviewOpen<cr>", "Diffview: Open diffview")
keymap("<leader>gj", "<cmd>DiffviewClose<cr>", "Diffview: Close diffview")
keymap("<leader>gb", "<cmd>Gitsigns blame<cr>", "Gitsigns: Show gitblame")
keymap("<leader>gg", "<cmd>CopilotChatToggle<cr>", "Copilot: Open chat")
vim.api.nvim_set_keymap("i", "<S-Tab>", "copilot#Accept('<CR>')", { expr = true, silent = true })

-- DBUI: Leader -> d
keymap("<leader>d", "<cmd>:tab DBUI<cr>", "DBUI: Open diffview")

-- Diagnostics: Leader -> a
keymap("<leader>aa", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Diagnostic: Show actions")
keymap("<leader>ad", "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostic: Show diagnostics")
keymap("<leader>aj", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Diagnostic: Go to next")
keymap("<leader>ak", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Diagnostic: Go to previous")

-- Telescope: Leader -> f
keymap("<leader>ff", telescope.find_files, "Telescope: Find files")
keymap("<leader>fg", telescope.live_grep, "Telescope: Live grep")
keymap("<leader>fb", telescope.buffers, "Telescope: Buffers")
keymap("<leader>fv", telescope.git_status, "Telescope: Git status")
keymap("<leader>fk", telescope.keymaps, "Telescope: Nvim keymaps")
keymap("<leader>fs", telescope.grep_string, "Telescope: Selected word")
keymap("<leader>fp", telescope.registers, "Telescope: Registers")
keymap("<leader>fu", ":Telescope undo<CR>", "Telescope: Undo")

-- LSP
keymap("<leader>fd", telescope.builtin.lsp_definitions, "Telescope: LSP definitions")
keymap("<leader>fr", telescope.builtin.lsp_references, "Telescope: LSP references")
keymap("<leader>fi", telescope.builtin.lsp_implementations, "Telescope: LSP implementations")
keymap("<leader>ft", telescope.builtin.lsp_type_definitions, "Telescope: LSP type definitions")

-- Obsidian: Leader -> o
keymap("<leader>fo", ":ObsidianSearch<CR>", "Obsidian: Search with Telescope")
keymap("<leader>od", ":ObsidianDailies -5 2<CR>", "Obsidian: Open Dailies")
keymap("<leader>on", ":ObsidianNewFromTemplate<CR>", "Obsidian: New Note (from template)")
keymap("<leader>os", ":ObsidianSearch<CR>", "Obsidian: Search")
keymap("<leader>ot", ":ObsidianTags<CR>", "Obsidian: Tags")
keymap("<leader>ow", ":ObsidianWorkspace<CR>", "Obsidian: Workspace")
keymap("<leader>ob", ":ObsidianBacklink<CR>", "Obsidian: Backlinks")
keymap("<leader>ox", ":ObsidianToggleCheckbox<CR>", "Obsidian: Toggle Checkbox")


-- Harpoon: Leader -> h
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

keymap("<leader>ha", function() harpoon:list():add() end, "Harpoon: Add file")
keymap("<leader>fh", function() toggle_telescope(harpoon:list()) end, "Harpoon: Search files")
keymap("<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Harpoon: Toggle menu")
-- vim.keymap.set("n", "<leader>ha", function()
-- 	harpoon:list():add()
-- end)
-- vim.keymap.set("n", "<leader>fh", function()
-- 	toggle_telescope(harpoon:list())
-- end, { desc = "Open harpoon window" })
-- vim.keymap.set("n", "<leader>hh", function()
-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
-- end)
