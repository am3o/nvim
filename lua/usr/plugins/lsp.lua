return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"j-hui/fidget.nvim",
		},
		opts = {
			fidget = {},
			mason = {
				ui = {
					check_outdated_packages_on_open = true,
					border = "rounded",
				},
			},
		},
		config = function(_, opts)
			local cmp = require("cmp")
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())
			local lspconfig = require("lspconfig")

			require("fidget").setup(opts["fidget"])
			require("mason").setup(opts["mason"])
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"lua_ls",
					"dockerls",
					"terraformls",
					"tsserver",
					"yamlls",
				},
				handlers = {
					function(server_name) -- default handler (optional)
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end,
					["lua_ls"] = function()
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim", "it", "describe", "before_each", "after_each" },
									},
								},
							},
						})
					end,
					["yamlls"] = function()
						local yaml_opts = {
							settings = {
								yaml = {
									schemas = {
										kubernetes = "globPattern",
									},
								},
							},
						}
						lspconfig.yamlls.setup(yaml_opts)
					end,
				},
			})

			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<CR>"] = cmp.mapping.confirm({ select = true, remap = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})

			vim.keymap.set("n", "<leader>tm", "<cmd>Mason<cr>", { silent = true })
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, { remap = false })

			vim.keymap.set("n", "gr", function()
				vim.lsp.buf.references()
			end, { remap = false })

			vim.keymap.set("n", "gi", function()
				vim.lsp.buf.implementation()
			end, { remap = false })

			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, { remap = false })

			vim.keymap.set("i", "<C-K>", function()
				vim.lsp.buf.signature_help()
			end, { remap = false })

			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, { remap = false })

			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, { remap = false })

			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, { remap = false })

			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, { remap = false })

			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, { remap = false })

			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, { remap = false })

			vim.diagnostic.config({
				-- update_in_insert = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end,
	},
}
