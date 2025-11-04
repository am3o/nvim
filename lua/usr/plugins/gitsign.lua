return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  event = "BufReadPost",
  keys = {
    {
      "<leader>gb",
      function()
        if vim.fn.isdirectory(".git") == 1 then
          require("gitsigns").toggle_current_line_blame()
        end
      end,
      desc = "[G]it [B]lame",
    },
    {
      "<leader>gd",
      function()
        if vim.fn.isdirectory(".git") == 1 then
          require("gitsigns").diffthis()
        end
      end,
      desc = "[G]it [D]iff",
    },
  },
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "right_align",
      delay = 100,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = " <author_time:%Y-%m-%d>, <author> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  },
}
