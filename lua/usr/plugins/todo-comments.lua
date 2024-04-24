return {
	"folke/todo-comments.nvim",
	enabled = true,
	event = "VeryLazy",
	lazy = true,
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
		-- FIXME: Another fix me
		-- PERF: slow down
		-- HACK: use defer becaus of reasons
		-- NOTE: adding a Note
		-- TODO: Show me again
		-- TEST: Another good job
		vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { silent = true, desc = "[T]oggle [T]o[D]o" })
	end,
}
