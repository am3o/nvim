return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	on_attach = function(client, buffer)
		vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, { desc = "Code actions", buffer = buffer })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions", buffer = buffer })
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Code rename", buffer = buffer })
		vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.:ormat, { desc = "Code format", buffer = buffer })
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, { desc = "Documentation", buffer = buffer })
	end,
	on_init = function()
		local opts = {
			title = "native LSP",
			icon = "🔧",
			render = "default",
			stages = "slide",
		}

		vim.notify("lua_ls now runs in the background", vim.log.levels.INFO, opts)
	end,
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
}
