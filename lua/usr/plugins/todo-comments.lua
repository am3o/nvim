return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = true,
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#2563EB" },
				hint = { "DiagnosticHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
				test = { "Identifier", "#FF00FF" },
			},
		},
		config = function(_, opts)
			local todo = require("todo-comments")
			todo.setup(opts)

			-- BUG: change the world
			-- PERF: slow down
			-- HACK: use defer becaus of reasons
			-- NOTE: adding a Note
			-- FIXME: Another fix me
			-- TODO: Show me again
			vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", { silent = true, desc = "toggle [T]o[D]o" })
		end,
	},
}
