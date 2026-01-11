require "nvchad.mappings"

local map = vim.keymap.set

map("i", "jk", "<ESC>")

map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", {
    desc = "LSP document symbols",
})

map("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", {
    desc = "LSP definitions",
})

map("n", "<leader>lws", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", {
    desc = "LSP definitions",
})

map("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", {
    desc = "LSP definitions",
})
