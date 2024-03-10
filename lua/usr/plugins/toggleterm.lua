return {
	"akinsho/toggleterm.nvim",
	version = "*",
	enabled = false,
	opts = {
		direction = "float",
		shell = vim.o.shell,
		auto_scroll = true, -- automatically scroll to the bottom on terminal output
		float_opts = {
			border = "rounded",
			winblend = 3,
			title_pos = "center",
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
	end,
}
