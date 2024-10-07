return {
	"gelguy/wilder.nvim",
	enabled = false,
	event = "VeryLazy",
	opts = {
		modes = { ":", "/", "?" },
	},
	config = function(_, opts)
		local wilder = require("wilder")
		wilder.setup(opts)

		wilder.set_option("pipeline", {
			wilder.branch(wilder.cmdline_pipeline({
				fuzzy = 1,
				set_pcre2_pattern = 1,
			})),
		})

		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				highlighter = wilder.basic_highlighter(),
				min_width = "100%",
				min_height = "50%",
				left = { " ", wilder.popupmenu_devicons() },
				border = "rounded",
			}))
		)
	end,
}
