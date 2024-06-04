return {
	"dstein64/vim-startuptime",
	enabled = false,
	event = "VeryLazy",
	cmd = "StartupTime",
	init = function()
		vim.g.startuptime_tries = 10
	end,
}
