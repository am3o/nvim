return {
	{
		"folke/tokyonight.nvim",
		enabled = true,
		priority = 1000,
		opts = {
			style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			transparent = true, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				sidebars = "dark", -- style for sidebars, see below
				floats = "dark", -- style for floating windows
			},
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "moon", -- auto, main, moon, or dawn
			dark_variant = "moon", -- main, moon, or dawn
			disable_background = false,
			dim_inactive_windows = true,
			extend_background_behind_borders = true,
			styles = {
				bold = true,
				italic = true,
				transparency = false,
			},
			highlight_groups = {
				StatusLineNc = { link = "StatusLine" },
			},
			groups = {
				border = "muted",
				link = "iris",
				panel = "surface",

				error = "love",
				hint = "iris",
				info = "foam",
				warn = "gold",

				git_add = "foam",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "subtle",

				headings = {
					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd.colorscheme("rose-pine")

			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
}
