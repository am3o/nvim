return {
	"apple/pkl-neovim",
	enabled = true,
	event = { "BufReadPre *.pkl" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	build = function()
		vim.cmd("TSInstall! pkl")
	end,
}
