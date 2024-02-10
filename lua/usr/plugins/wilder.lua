return {
	"gelguy/wilder.nvim",
	opts = {
		modes = { ":", "/", "?" },
	},
	config = function(_, opts)
		local wilder = require("wilder")
		wilder.setup(opts)
		-- wilder.set_option("pipeline", {
		-- 	wilder.branch(
		-- 		wilder.cmdline_pipeline({
		-- 			language = "python",
		-- 			fuzzy = 1,
		-- 		}),
		-- 		wilder.python_search_pipeline({
		-- 			-- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
		-- 			pattern = wilder.python_fuzzy_pattern(),
		-- 			-- omit to get results in the order they appear in the buffer
		-- 			sorter = wilder.python_difflib_sorter(),
		-- 			-- can be set to 're2' for performance, requires pyre2 to be installed
		-- 			-- see :h wilder#python_search() for more details
		-- 			engine = "re",
		-- 		})
		-- 	),
		-- })
		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer({
				-- highlighter applies highlighting to the candidates
				highlighter = wilder.basic_highlighter(),
			})
		)
	end,
}
