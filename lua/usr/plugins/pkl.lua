return {
	"apple/pkl-neovim",
	enabled = false,
	event = { "BufReadPre *.pkl" },
	build = function()
		vim.cmd("TSInstall! pkl")
	end,
}
