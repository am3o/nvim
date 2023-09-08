return {
        -- Plugin telescope
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'gbrlsnchs/telescope-lsp-handlers.nvim'
        },
        config = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>saf', builtin.find_files, { desc = "[S]earch [A]round [F]iles" })
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})

            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elptags" })

            require('telescope').setup()

            require('telescope').load_extension('lsp_handlers')
        end
    }
