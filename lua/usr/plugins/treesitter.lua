return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    treesitter = {
      ensure_installed = {
        "bash",
        "go",
        "helm",
        "javascript",
        "lua",
        "make",
        "markdown",
        "rust",
        "terraform",
        "toml",
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
        enable = true,
        keymaps = {
          init_selection = "<C-n>",
          node_incremental = "<C-n>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      indent = {
        enable = true,
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").
        setup(opts["treesitter"])
  end,
}
