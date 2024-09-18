return {
	"apple/pkl-neovim",
	enabled = true,
	event = { "BufReadPre *.pkl" },
	build = function()
		vim.cmd("TSInstall! pkl")
	end,
}
