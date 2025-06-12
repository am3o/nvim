vim.lsp.enable({
  "bashls",
  "gopls",
  "helm_ls",
  "lua_ls",
  "terraform_lsp",
  "ts_ls",
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("keymap.native.lsp", {}),
  callback = function()
    local builtin = assert(require("telescope.builtin"))

    vim.keymap.set("n", "gd", builtin.lsp_definitions, { remap = false })
    vim.keymap.set("n", "gr", builtin.lsp_references, { remap = false })
    vim.keymap.set("n", "gi", builtin.lsp_implementations, { remap = false })
    vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, { remap = false })
    vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { remap = false })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { remap = false })
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { remap = false })

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { remap = false })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { remap = false })

    vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float, { remap = false })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("native.lsp", {}),
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
          local opts = {
            title  = "native LSP",
            render = "compact",
            stages = "slide",
          }

          vim.notify("auto-format... ", vim.log.levels.INFO, opts)
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

vim.diagnostic.config({
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Toggle virtual_text off when on the line with the error
-- vim.api.nvim_create_autocmd("CursorMoved", {
-- 	callback = function()
-- 		local current_line = vim.api.nvim_win_get_cursor(0)[1] - 1
-- 		local diagnostics = vim.diagnostic.get(0, { lnum = current_line })
-- 		vim.diagnostic.config({
-- 			virtual_text = vim.tbl_isempty(diagnostics) and { spacing = 0, prefix = "●" } or false,
-- 		})
-- 	end,
-- })
