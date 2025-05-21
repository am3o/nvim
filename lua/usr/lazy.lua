local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(path) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, path })
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
vim.opt.rtp:prepend(path)

-- [[ Basic keymaps ]]
-- Set <space> as the leader key
-- Note: Must happen before plugins are required (otherwise wrong leader will be d)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>tpm", "<cmd>Lazy<cr>", { silent = true })

require("lazy").setup({
	spec = {
		{ import = "usr.plugins" },
	},
	lockfile = vim.fn.stdpath("config") .. "/lua/usr/lazy-lock.json",
	ui = {
		title = "Lazy",
		border = "rounded",
	},
	change_detection = {
		notify = false,
	},
	performance = {
		cache = {
			enabled = true,
		},
	},
})
