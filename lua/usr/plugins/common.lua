return {
	{
		"nvim-lua/plenary.nvim",
		enabled = true,
		lazy = true,
		name = "plenary",
	},
	{
		"echasnovski/mini.icons",
		enabled = true,
		lazy = true,
		opts = {
			style = "glyph",
		},
	},
	{
		"nvim-tree/nvim-web-devicons",
		enabled = true,
		lazy = true,
	},
	{
		"dgox16/devicon-colorscheme.nvim",
		enabled = true,
		lazy = true,
		dependencies = {
			"catppuccin/nvim",
		},
		config = function()
			local mocha = require("catppuccin.palettes").get_palette("mocha")

			require("devicon-colorscheme").setup({
				colors = {
					blue = mocha.blue,
					cyan = mocha.teal,
					green = mocha.green,
					magenta = mocha.pink,
					orange = mocha.maroon,
					purple = mocha.mauve,
					red = mocha.red,
					white = mocha.subtext0,
					yellow = mocha.yellow,
					bright_blue = mocha.blue,
					bright_cyan = mocha.teal,
					bright_green = mocha.green,
					bright_magenta = mocha.pink,
					bright_orange = mocha.maroon,
					bright_purple = mocha.mauve,
					bright_red = mocha.red,
					bright_yellow = mocha.yellow,
				},
			})
		end,
	},
}
