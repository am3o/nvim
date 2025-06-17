return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "folke/trouble.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      theme = "catppuccin",
      component_separators = "|",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          separator = {
            left = "",
            right = "",
          },
        },
      },
      lualine_b = { "filename", "branch", "diagnostics" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
        {
          "location",
          separator = {
            left = "",
            right = "",
          },
        },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
  },
  config = function(_, opts)
    local symbols = require("trouble").statusline({
      mode = "lsp_document_symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
      hl_group = "lualine_c",
    })

    table.insert(opts.sections.lualine_c, {
      symbols.get,
      cond = symbols.has,
    })

    local lsp_status = function()
      local clients     = assert(vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() }))

      local _, devicons = assert(pcall(require, 'nvim-web-devicons'))
      local icon, _     = devicons.get_icon(vim.fn.expand('%:t'))
      if not icon then
        icon, _ = devicons.get_icon_by_filetype(vim.bo.filetype, { default = true })
      end

      local color = (#clients > 0) and "DiagnosticOk" or "Comment"

      return string.format("%%#%s#%s %%*", color, icon)
    end

    table.insert(opts.sections.lualine_y, {
      lsp_status,
      separator = {
        -- left = "",
      },
    })

    require("lualine").setup(opts)
  end,
}
