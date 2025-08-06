---@brief
---
--- https://github.com/luals/lua-language-server
---
--- Lua language server.
---
--- `lua-language-server` can be installed by following the instructions [here](https://luals.github.io/#neovim-install).
---
--- See `lua-language-server`'s [documentation](https://luals.github.io/wiki/settings/) for an explanation of the above fields:
--- * [Lua.runtime.path](https://luals.github.io/wiki/settings/#runtimepath)
--- * [Lua.workspace.library](https://luals.github.io/wiki/settings/#workspacelibrary)

---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".git",
    ".luacheckrc",
    ".luarc.json",
    ".luarc.jsonc",
    ".stylua.toml",
    "selene.toml",
    "selene.yml",
    "stylua.toml",
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
  settings = {
    Lua = {
      runtime = {
        -- Specify LuaJIT for Neovim
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = {
          "vim",
          "require",
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
