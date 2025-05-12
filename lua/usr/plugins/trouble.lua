return {
	"folke/trouble.nvim",
	enabled = true,
	cmd = "Trouble",
	keys = {
		{
			"<leader>tt",
			function()
				if vim.tbl_isempty(vim.diagnostic.get()) then
					vim.notify("No diagnostic found", vim.log.levels.INFO, {
						title = "Diagnostic",
						render = "compact",
						stages = "slide",
					})
					return
				end

				local opts = {
					mode = "diagnostics",
				}
				require("trouble").toggle(opts)
			end,
			desc = "[T]oggle [T]rouble",
		},
	},
	opts = {
		modes = {
			diagnostics = {
				auto_open = false,
				auto_close = true,
			},
		},
	},
}
