return {
  "ibhagwan/fzf-lua",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.icons",
  },

  opts = {
    defaults = {
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
    },
    files = {
      no_ignore = true,
    },
    winopts = {
      preview = {
        vertical = "up:45%",
        layout = "vertical",
      },
    }
  },
  config = function(_, opts)
    local fzf = require("fzf-lua")
    fzf.setup(opts)

    vim.keymap.set("n", "<leader>saf", fzf.files, { desc = "[S]earch [A]round [F]iles" })
    vim.keymap.set("n", "<leader>sif", fzf.live_grep, { desc = "[S]earch [I]nner [F]iles" })
    vim.keymap.set("n", "<leader>sg", fzf.git_files, { desc = "[S]earch [G]it files" })
    vim.keymap.set("n", "<leader>sb", fzf.buffers, { desc = "[S]earch [B]uffers" })
    vim.keymap.set("n", "<leader>sh", fzf.help_tags, { desc = "[S]earch [H]elptags" })
    vim.keymap.set("n", "<leader>sm", fzf.manpages, { desc = "[S]earch [M]an-Pages" })
    vim.keymap.set("n", "<leader>cs", fzf.spell_suggest, { desc = "[C]heck [S]pell" })
    vim.keymap.set("n", "<C-p>", fzf.files, { desc = "Search find in files" })
    vim.keymap.set("n", "<C-r>", fzf.command_history, { desc = "Search command history" })
  end
}
