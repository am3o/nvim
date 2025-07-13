return {
  {
    "ray-x/go.nvim",
    enabled = true,
    ft = { "go", "gomod" },
    event = { "CmdlineEnter" },
    dependencies = {
      "ray-x/guihua.lua",
      -- "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<leader>gif",
        "<CMD>GoIfErr<cr>",
        { desc = "Generate if condition" },
      },
      {
        "<leader>gfs",
        "<CMD>GoFillStruct<cr>",
        { desc = "Generate struct attributes" },
      },
      {
        "<leader>gat",
        "<CMD>GoAddTag<cr>",
        { desc = "Generate struct tags" },
      },
      {
        "<leader>grg",
        "<CMD>GoRun<cr>",
        { desc = "Go Run" },
      },
    },
    build = function()
      require("go.install").update_all_sync()
    end,
    opts = {},
  },
}
