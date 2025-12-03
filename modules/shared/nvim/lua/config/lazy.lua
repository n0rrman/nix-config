-- Bind <space> to leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local is_minimal = vim.env.NVIM_MINIMAL == "1" or vim.env.SSH_CONNECTION ~= nil
vim.g.nvim_profile = is_minimal and "minimal" or "full"
vim.notify("Neovim profile: " .. vim.g.nvim_profile, vim.log.levels.INFO)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local spec = {
	{ import = "plugins.core" },
}

if not is_minimal then
	table.insert(spec, { import = "plugins.full" })
end

require("lazy").setup({
	spec = spec,
	install = { colorscheme = { "catppuccin" } },
	checker = { enabled = true },
})
