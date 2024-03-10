return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- local cmp = require("cmp")
				-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
				-- cmp.setup({
				-- 	snippet = {
				-- 		expand = function(args)
				-- 			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				-- 		end,
				-- 	},
				-- 	mapping = cmp.mapping.preset.insert({
				-- 		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				-- 		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				-- 	}),
				-- 	sources = cmp.config.sources({
				-- 		{ name = "nvim_lsp" },
				-- 		{ name = "luasnip" },
				-- 	}, {
				-- 		{ name = "buffer" },
				-- 	}),
				-- })
				-- For an understanding of why these mappings were
				-- chosen, you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true, remap = false }),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "j-hui/fidget.nvim", opts = {} },
		},
		opts = {
			fidget = {},
			mason = {
				ui = {
					check_outdated_packages_on_open = true,
					border = "rounded",
				},
			},
			mason_lspconfig = {
				ensure_installed = {
					"gopls",
					"lua_ls",
					"dockerls",
					"terraformls",
					"tsserver",
					"yamlls",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities()),
						})
					end,
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities()),
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
						local opts = {
							capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities()),
							settings = {
								yaml = {
									schemas = {
										kubernetes = "globPattern",
									},
								},
							},
						}
						require("lspconfig").yamlls.setup(opts)
					end,
				},
			},
		},
		config = function(_, opts)
			require("fidget").setup(opts["fidget"])
			require("mason").setup(opts["mason"])
			require("mason-lspconfig").setup(opts["mason_lspconfig"])

			vim.keymap.set("n", "<leader>tm", "<cmd>Mason<cr>", { desc = "[T]oggle [M]ason", silent = true })
			vim.api.nvim_create_autocmd("LspAttach", {
				-- group = vim.api.nvim_create_autogroup("foo-lsp-attach", { clear = true }),
				callback = function(event)
					local builtin = require("telescope.builtin")

					vim.keymap.set("n", "gd", builtin.lsp_definitions, { remap = false })
					vim.keymap.set("n", "gr", builtin.lsp_references, { remap = false })
					vim.keymap.set("n", "gi", builtin.lsp_implementations, { remap = false })
					vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, { remap = false })
					vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { remap = false })

					vim.keymap.set("n", "K", vim.lsp.buf.hover, { remap = false })
					vim.keymap.set("i", "<C-K>", vim.lsp.buf.signature_help, { remap = false })

					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { remap = false })
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { remap = false })

					vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float, { remap = false })

					vim.keymap.set("n", "[d", function()
						vim.diagnostic.goto_next()
					end, { remap = false })

					vim.keymap.set("n", "]d", function()
						vim.diagnostic.goto_prev()
					end, { remap = false })

					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
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
		end,
	},
}
