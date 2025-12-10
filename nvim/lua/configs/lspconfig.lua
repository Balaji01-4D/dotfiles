-- NVChad default LSP setup
require("nvchad.configs.lspconfig").defaults()

---------------------------------------------------------------------
-- Enable LSP servers
---------------------------------------------------------------------
vim.lsp.enable({
  "gopls",
  "pyright",
  "html",
  "cssls",
})

---------------------------------------------------------------------
-- GO (gopls) configuration
---------------------------------------------------------------------
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
        nilness = true,
      },
    },
  },
})

---------------------------------------------------------------------
-- PYTHON (pyright) configuration
---------------------------------------------------------------------
vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
      },
    },
  },
})

---------------------------------------------------------------------
-- FORMATTERS (conform.nvim)
---------------------------------------------------------------------
local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.setup({
    formatters_by_ft = {
      python = { "black" },
      go = { "gofumpt" },
    },
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
  })
end

