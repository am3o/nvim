return {
	"folke/todo-comments.nvim",
	enabled = true,
	keys = {
		{ "<leader>td", desc = "Toggle [T]o[D]o" },
	},
	opts = {
		signs = true,
		keywords = {
			FIX = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "Bug", "FixIt", "Issue" }, -- a set of other keywords that all map to this FIX keywords
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = { icon = " ", color = "info", alt = { "TODO" } },
			HACK = { icon = " ", color = "warning", alt = { "HACK", "Hack" } },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "Perf", "PERFORMANCE", "Optimize" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO", "Info" } },
			TEST = { icon = "⏲ ", color = "test", alt = { "TEST", "TESTING", "PASSED", "FAILED" } },
		},
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
			info = { "DiagnosticInfo", "#2563EB" },
			hint = { "DiagnosticHint", "#10B981" },
			test = { "Identifier", "#FF00FF" },
			default = { "Identifier", "#7C3AED" },
		},
	},
	config = function(_, opts)
		require("todo-comments").setup(opts)

		-- BUG: change the world
		-- FIXME: Another fix me
		-- FixIt: foo
		-- PERF: slow own
		-- TEST: Another good job
		-- HACK: use defer because of reasons
		-- Hack: another hack
		-- NOTE: adding a Note
		-- TODO: Show me again
		vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { silent = true, desc = "Toggle [T]o[D]o" })
	end,
}
