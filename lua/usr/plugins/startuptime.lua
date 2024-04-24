return {
	"dstein64/vim-startuptime",
	enabled = true,
	event = "VeryLazy",
	cmd = "StartupTime",
	init = function()
		vim.g.startuptime_tries = 10
	end,
}
