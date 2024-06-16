return {
	{
		"hrsh7th/nvim-cmp",
		enabled = true,
		event = "VeryLazy",
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
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
					},
				},
			},
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
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
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				completion = { completeopt = "menu,menuone,noinsert" },
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
					{ name = "lazydev", group_index = 0 },
					{ name = "path" },
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("fidget").setup({
				notification = {
					window = {
						winblend = 0,
					},
				},
			})

			require("mason").setup({
				ui = {
					check_outdated_packages_on_open = true,
					border = "rounded",
				},
			})

			local lspconfig = require("lspconfig")
			require("lspconfig.ui.windows").default_options.border = "rounded"
			require("mason-lspconfig").setup({
				ensure_installed = {
					"dockerls",
					"gopls",
					"lua_ls",
					"rust_analyzer",
					"helm_ls",
					"terraformls",
					"tsserver",
				},
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities()),
						})
					end,
					["helm_ls"] = function()
						lspconfig.helm_ls.setup({
							capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities()),
							settings = {
								["helm-ls"] = {
									yamlls = {
										path = "yaml-language-server",
									},
								},
							},
						})
					end,
					["rust_analyzer"] = function()
						lspconfig.rust_analyzer.setup({
							cmd = { "rust-analyzer" },
							settings = {
								["rust_analyzer"] = {},
							},
						})
					end,
				},
			})

			vim.keymap.set("n", "<leader>tm", "<cmd>Mason<cr>", { desc = "[T]oggle [M]ason", silent = true })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("-lsp-attach", { clear = true }),
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

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = false,
			})
		end,
	},
}
