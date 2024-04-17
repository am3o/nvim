return {
	"goolord/alpha-nvim",
	enabled = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("alpha").setup(require("alpha.themes.startify").config)
	end,
}
