return {
	{
		"akinsho/bufferline.nvim",
		enabled = true,
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
		config = function(_, opts)
			require("bufferline").setup(opts)
		end,
	},
}
