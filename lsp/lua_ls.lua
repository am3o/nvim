return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".git",
		".luacheckrc",
		".luarc.json",
		".luarc.jsonc",
		".stylua.toml",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
	},
	on_init = function()
		-- Debuging specific settings of the lsp
	end,
	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
	settings = {
		Lua = {
			runtime = {
				-- Specify LuaJIT for Neovim
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = {
					"vim",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
