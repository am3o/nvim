return {
    {
        -- Plugin lsp-zero
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            lazy = true,
            config = false,
        },
        {
            'williamboman/mason.nvim',
            lazy = false,
            config = true,
        },

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            dependencies = {
                { 'L3MON4D3/LuaSnip' },
            },
        },

        -- LSP
        {
            'neovim/nvim-lspconfig',
            cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
            event = { 'BufReadPre', 'BufNewFile' },
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'williamboman/mason-lspconfig.nvim' },
            },
        }
    },
    {
        -- Plugin treesitter
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    {
        -- Plugin dap
        "mfussenegger/nvim-dap",
    },
    {
        -- Plugin dap-ui
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap"
        },
    },
    {
        "leoluz/nvim-dap-go"
    },
    {
        'theHamsta/nvim-dap-virtual-text'
    },
    {
        -- Plugin telescope
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'gbrlsnchs/telescope-lsp-handlers.nvim'
        },
    },
    {
        'nvim-telescope/telescope-dap.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        }
    },
    {
        -- Plugin harpoon
        'theprimeagen/harpoon'
    },
    {
        -- Plugin go
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ":lua require('go.install').update_all_sync()", -- if you need to install/update all binaries
    },
    {
        -- Plugin refactoring
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        },
    },
    {
        -- Plugin Statusline
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            lazy = true
        },
    },
    {
        -- Colorscheme rosé pine
        'rose-pine/neovim',
        name = 'rose-pine',
    },
    {
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
    },
    {
        -- Plugin navigation scrolling
        'karb94/neoscroll.nvim'
    },
    {
        -- Plugin comments
        'tpope/vim-commentary'
    },
    {
        -- Plugin auto-completion quotes, parens, brackets
        'Raimondi/delimitMate'
    },
}
