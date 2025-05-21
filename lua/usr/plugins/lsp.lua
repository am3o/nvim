return {
	"mason-org/mason.nvim",
	enabled = true,
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		{
			"j-hui/fidget.nvim",
			enabled = true,
			opts = {
				notification = {
					window = {
						windblend = 0,
					},
				},
			},
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			enabled = true,
			opts = {
				auto_update = false,
				ensured_installed = {
					"lua-language-server",
					"vim-language-server",
					{
						"gopls",
						condition = function()
							return not os.execute("go version")
						end,
					},
				},
				run_on_start = true,
				start_delay = 500,
			},
			config = function(_, opts)
				require("mason-tool-installer").setup(opts)

				vim.api.nvim_create_autocmd("User", {
					pattern = "MasonToolsStartingInstall",
					callback = function()
						vim.schedule(function()
							print("mason-tool-installer is starting")
						end)
					end,
				})
			end,
		},
		{
			"mason-org/mason-lspconfig.nvim",
			dependencies = {
				"neovim/nvim-lspconfig",
			},
			opts = {
				ensure_installed = {},
				automatic_enable = {
					"lua_ls",
					"vimls",
				},
				-- handlers = {
				-- 	function(name)
				-- 		local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), "")
				-- 	end,
				-- },
			},
		},
	},
	keys = {
		{
			"<leader>tm",
			function()
				require("mason.ui").open()
			end,
			desc = "[A]dd to harpoon",
		},
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})

		vim.lsp.enable({
			"lua_ls",
		})

		vim.diagnostic.config({
			underline = true,
			update_in_insert = true,
			signs = true,
			virtual_text = true,
		})
	end,
}
