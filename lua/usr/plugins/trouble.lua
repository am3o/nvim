return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		position = "bottom", -- position of the list can be: bottom, top, left, right
		icons = true, -- use devicons for filenames
		cycle_results = true, -- cycle item list when reaching beginning or end of list
		auto_close = true, -- automatically close the list when you have no diagnostics
		auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
		auto_fold = false, -- automatically fold a file trouble list at creation
		use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
	},
	config = function(_, opts)
		local trouble = require("trouble")
		trouble.setup(opts)

		vim.keymap.set("n", "<leader>tt", trouble.toggle)
	end,
}
