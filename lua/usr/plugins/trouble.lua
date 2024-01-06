return {
    'folke/trouble.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local trouble = require("trouble")
        trouble.setup({
            position = "bottom",         -- position of the list can be: bottom, top, left, right
            icons = true,                -- use devicons for filenames
            cycle_results = true,        -- cycle item list when reaching beginning or end of list
            auto_close = true,           -- automatically close the list when you have no diagnostics
            auto_preview = true,         -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
            auto_fold = true,            -- automatically fold a file trouble list at creation
            use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
        })

        vim.keymap.set("n", "<leader>tt", function() trouble.toggle() end)
        vim.keymap.set("n", "<leader>tn", function() trouble.next({ skip_groups = true, jump = true }) end)
        vim.keymap.set("n", "<leader>tp", function() trouble.previous({ skip_groups = true, jump = true }) end)
    end,
}
