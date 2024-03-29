local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- [[ Basic keymaps ]]
-- Set <space> as the leader key
-- Note: Must happen before plugins are required (otherwise wrong leader will be d)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>tpm", "<cmd>Lazy<cr>", { silent = true })

require("lazy").setup({
	spec = "usr.plugins",
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
