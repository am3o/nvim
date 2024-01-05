return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'gbrlsnchs/telescope-lsp-handlers.nvim',
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
        config = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>saf', builtin.find_files, { desc = "[S]earch [A]round [F]iles" })
            vim.keymap.set('n', '<leader>sif', builtin.live_grep, { desc = "[S]earch [I]nner [F]iles" })
            vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = "[S]earch [B]uffers" })
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elptags" })
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})

            -- telescope.load_extension('lsp_handlers')
            telescope.setup() 
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        config = function()
            require('telescope').load_extension('fzf')
        end
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
