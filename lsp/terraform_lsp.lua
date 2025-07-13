---@brief
---
--- https://github.com/juliosueiras/terraform-lsp
---
--- Terraform language server
--- Download a released binary from
--- https://github.com/juliosueiras/terraform-lsp/releases.
---
--- From https://github.com/hashicorp/terraform-ls#terraform-ls-vs-terraform-lsp:

---@type vim.lsp.Config
return {
  cmd = { "terraform-lsp" },
  filetypes = { "terraform", "hcl" },
  root_markers = { ".terraform", ".git" },
}
