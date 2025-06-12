vim.lsp.enable({
	"bashls",
	"gopls",
	"helm_ls",
	"lua_ls",
	"terraform_lsp",
	"ts_ls",
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = {
			title = "native LSP",
			icon = "🔧",
			render = "default",
			stages = "slide",
		}

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client then
			vim.notify("LSP attached: " .. client.name, vim.log.levels.INFO, opts)
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { remap = false })
		vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { remap = false })

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
	},
	virtual_lines = {
		current_line = true,
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Toggle virtual_text off when on the line with the error
-- vim.api.nvim_create_autocmd("CursorMoved", {
-- 	callback = function()
-- 		local current_line = vim.api.nvim_win_get_cursor(0)[1] - 1
-- 		local diagnostics = vim.diagnostic.get(0, { lnum = current_line })
-- 		vim.diagnostic.config({
-- 			virtual_text = vim.tbl_isempty(diagnostics) and { spacing = 0, prefix = "●" } or false,
-- 		})
-- 	end,
-- })
