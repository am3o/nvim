return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "jq" },
			-- FIXME: add yamlfmt parameter to respect empty lines
			yaml = { "yamlfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		notify_on_error = true,
		log_level = vim.log.levels.ERROR,
	},
}
