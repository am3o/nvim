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
			local palettes = require("catppuccin.palettes").get_palette("mocha")

			require("devicon-colorscheme").setup({
				colors = {
					blue = palettes.blue,
					cyan = palettes.teal,
					green = palettes.green,
					magenta = palettes.pink,
					orange = palettes.maroon,
					purple = palettes.mauve,
					red = palettes.red,
					white = palettes.subtext0,
					yellow = palettes.yellow,
					bright_blue = palettes.blue,
					bright_cyan = palettes.teal,
					bright_green = palettes.green,
					bright_magenta = palettes.pink,
					bright_orange = palettes.maroon,
					bright_purple = palettes.mauve,
					bright_red = palettes.red,
					bright_yellow = palettes.yellow,
				},
			})
		end,
	},
}
