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
			yaml = { "yamlfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters = {
			yamlfmt = {
				prepend_args = {
					"-formatter",
					"retain_line_breaks=true",
				},
			},
		},
		notify_on_error = true,
		log_level = vim.log.levels.ERROR,
	},
}
