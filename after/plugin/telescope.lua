local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>saf', builtin.find_files, { desc = "[S]earch [A]round [F]iles" })
vim.keymap.set('n', '<leader>sif', builtin.live_grep, { desc = "[S]earch [I]nner [F]iles" })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elptags" })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})


telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    }
}

telescope.load_extension('fzf')
telescope.load_extension('lsp_handlers')
