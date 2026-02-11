require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Debugger Toggle Breakpoint" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Debugger Start/Continue" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
