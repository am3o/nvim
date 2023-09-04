-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use { -- Package manager
        'wbthomason/packer.nvim',
    }

    use { -- Plugin treesitter
        'nvim-treesitter/nvim-treesitter',
        {
            run = ':TSUpdate'
        }
    }

    use { -- Plugin lsp-zero
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.api.nvim_command, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },

            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim' }
        }
    }

    use { -- Plugin dap and ui
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap"
        }
    }
    use 'leoluz/nvim-dap-go'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'

    use { -- Plugin telescope
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    use 'gbrlsnchs/telescope-lsp-handlers.nvim'
    use 'theprimeagen/harpoon'

    use { -- Colorscheme rosé pine
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }

    use 'karb94/neoscroll.nvim'

    use { -- Plugin Statusline
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true
        }
    }

    -- Plugin comments
    use 'tpope/vim-commentary'

    -- Plugin auto-completion quotes, parens, brackets
    use 'Raimondi/delimitMate'
end)
