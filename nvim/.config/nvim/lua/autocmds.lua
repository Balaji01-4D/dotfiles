require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

-- Show diagnostic float on cursor hold
autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
