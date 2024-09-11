return {
	"stevearc/conform.nvim",
	enabled = true,
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			["go"] = { "goimports", "gofmt" },
			["helm"] = {},
			["javascript"] = { "dprint", { "prettierd", "prettier" } },
			["javascriptreact"] = { "dprint" },
			["json"] = { "jq" },
			["lua"] = { "stylua" },
			["markdown"] = { { "prettierd", "prettier" }, "markdownlint" },
			["markdown.mdx"] = { { "prettierd", "prettier" } },
			["typescript"] = { "dprint", { "prettierd", "prettier" } },
			["typescriptreact"] = { "dprint" },
			["yaml"] = { "yamlfmt" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			timeout_ms = 2000,
			lsp_fallback = true,
		},
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2", "-ci" },
			},
			dprint = {
				condition = function(_, ctx)
					return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
				end,
			},
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
