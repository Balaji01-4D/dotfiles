
require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Insert empty line ABOVE
map("n", "[", "O<Esc>", { desc = "insert empty line above" })

-- Insert empty line BELOW
map("n", "]", "o<Esc>", { desc = "insert empty line below" })

------------------------------------------------
-- gopher.nvim (Go tools)
------------------------------------------------
-- Tags
map("n", "<leader>gt", ":GoTagAdd json<CR>", { desc = "Go: add json tags" })
map("n", "<leader>gr", ":GoTagRm json<CR>", { desc = "Go: remove json tags" })
map("n", "<leader>gT", ":GoTagClear<CR>", { desc = "Go: clear all tags" })

-- if err != nil { ... }
map("n", "<leader>ge", ":GoIfErr<CR>", { desc = "Go: insert if err" })

-- Tests
map("n", "<leader>ga", ":GoTestAdd<CR>", { desc = "Go: add tests for func" })
map("n", "<leader>gA", ":GoTestsAll<CR>", { desc = "Go: generate tests for file" })
map("n", "<leader>gx", ":GoTestsExp<CR>", { desc = "Go: tests for exported" })

-- Misc useful ones (optional)
map("n", "<leader>gm", ":GoMod<CR>", { desc = "Go: run go mod tidy/etc" })
map("n", "<leader>gg", ":GoGenerate<CR>", { desc = "Go: go generate" })
