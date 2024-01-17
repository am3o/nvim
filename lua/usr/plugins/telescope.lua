return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-tree/nvim-web-devicons',
            'debugloop/telescope-undo.nvim',
        },
        opts = {
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                },
                undo = {
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.8,
                    },
                    use_delta = true,
                    diff_context_lines = vim.o.scrolloff,
                    entry_format = "#$ID, $TIME",
                    saved_only = true,
                }
            },
        },
        config = function(_, opts)
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>saf', builtin.find_files, { desc = "[S]earch [A]round [F]iles" })
            vim.keymap.set('n', '<leader>sif', builtin.live_grep, { desc = "[S]earch [I]nner [F]iles" })
            vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = "[S]earch [B]uffers" })
            vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = "[S]earch [B]uffers" })
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elptags" })

            vim.keymap.set('n', '<leader>u', function() telescope.extensions.undo.undo({ side_by_side = true }) end,
                { desc = "[U]ndo" })
            vim.keymap.set('n', '<C-p>', builtin.find_files, {})

            telescope.setup(opts)

            local extensions = {
                "undo",
                "fzf"
            }

            for _, extension in ipairs(extensions) do
                telescope.load_extension(extension)
            end

            -- telescope.load_extension('lsp_handlers')
            -- telescope.load_extension("noice")
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },
    {
        'nvim-telescope/telescope-dap.nvim',
        dependencies = {
            'mfussenegger/nvim-dap',
            'leoluz/nvim-dap-go',
            'theHamsta/nvim-dap-virtual-text',
            'nvim-telescope/telescope.nvim',
        }
    }
}
