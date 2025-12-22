return {
  'saghen/blink.cmp',
  enabled = true,
  version = '1.*',

  opts = {
    keymap = {
      preset = 'enter',
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      menu = {
        scrollbar = false,
      },
      documentation = {
        auto_show = true,
      },
    },
    sources = {
      default = {
        'lsp',
        'path',
        'buffer',
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = {
        "score",
        "sort_text",
      }
    },
  },
  opts_extend = { "sources.default" },
}
