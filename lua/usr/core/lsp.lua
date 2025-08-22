vim.lsp.enable({
  "bashls",
  "gopls",
  "helm_ls",
  "lua_ls",
  "markdown_oxide",
  "terraform_lsp",
  "ts_ls",
  "yamlls"
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    local builtin = assert(vim.lsp.buf)

    vim.keymap.set("n", "gd", builtin.definition, { remap = false })
    vim.keymap.set("n", "gr", builtin.references, { remap = false })
    vim.keymap.set("n", "gi", builtin.implementation, { remap = false })

    vim.keymap.set("n", "<leader>D", builtin.type_definition, { remap = false })
    vim.keymap.set("n", "<leader>ds", builtin.type_definition, { remap = false })

    vim.keymap.set("n", "K", builtin.hover, { remap = false })
    vim.keymap.set("i", "<C-k>", builtin.signature_help, { remap = false })

    vim.keymap.set("n", "<leader>ca", builtin.code_action, { remap = false })
    vim.keymap.set("n", "<leader>rn", builtin.rename, { remap = false })

    vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float, { remap = false })
  end,
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client and client:supports_method('vim.lsp.protocol.Methods.textDocument_completion') then
--       vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--       vim.keymap.set('i', '<C-Space>', function()
--         vim.lsp.completion.get()
--       end)
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = vim.api.nvim_create_augroup("hightlight.native.lsp", {}),
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        group = vim.api.nvim_create_augroup("unhightlight.native.lsp", {}),
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end

    if client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("formating.native.lsp", { clear = false }),
        buffer = event.buf,
        callback = function()
          vim.lsp.buf.format({
            bufnr = event.buf,
            id = client.id,
            timeout_ms = 1000,
          })
        end
      })
    end
  end,
})

-- vim.diagnostic.config({
--   signs = true,
--   underline = true,
--   update_in_insert = false,
--   severity_sort = true,
--   -- virtual_lines = {
--   --   current_line = true,
--   -- }
-- })

-- Toggle virtual_text off when on the line with the error
vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    local current_line = vim.api.nvim_win_get_cursor(0)[1] - 1
    local diagnostics = vim.diagnostic.get(0, { lnum = current_line })
    vim.diagnostic.config({
      virtual_text = vim.tbl_isempty(diagnostics) and { spacing = 0, prefix = "●" } or false,
    })
  end,
})
