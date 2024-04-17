return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	event = "VimEnter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	build = ":TSUpdate",
	opts = {
		treesitter = {
			ensure_installed = {
				"bash",
				"go",
				"javascript",
				"helm",
				"lua",
				"make",
				"markdown",
				"terraform",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			sync_install = true,
			auto_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true, -- set to `false` to disable one of the mappings
				keymaps = {
					init_selection = "<leader>ss",
					node_incremental = "<leader>si",
					scope_incremental = "<leader>sc",
					node_decremental = "<leader>sd",
				},
			},
			indent = {
				enable = true,
			},
		},
		treesitter_context = {
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 20, -- Maximum number of lines to show for a single context
			trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
			zindex = 20, -- The Z-index of the context window
			on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
		},
	},
	config = function(_, opts)
		require("treesitter-context").setup(opts["treesitter_context"])
		require("nvim-treesitter.configs").setup(opts["treesitter"])
	end,
}
