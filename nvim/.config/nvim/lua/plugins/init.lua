return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "gopls", "pyright", 
        "black", "isort", "debugpy",
        "gofumpt", "goimports-reviser", "golines", "delve",
        "jdtls", "java-debug-adapter", "java-test",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap-python",
        "leoluz/nvim-dap-go",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      require("dapui").setup()
      require("dap-go").setup()
      require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "python", "go", "java"
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      -- Labels appear next to matches for quick jumping
      labels = "asdfghjklqwertyuiopzxcvbnm",
      search = {
        -- Search/jump in all windows
        multi_window = true,
        -- Search direction (forward/backward/all)
        forward = true,
        -- Continue search after jumping
        wrap = true,
        -- Use regex patterns for searching
        mode = "exact",
        -- Incremental search: update matches as you type
        incremental = true,
      },
      jump = {
        -- Automatically jump when there's only one match
        autojump = true,
        -- Go to the match position directly
        pos = "start",
        -- Save location to the jumplist
        jumplist = true,
        -- A pattern to exclude from jumping
        nohlsearch = true,
      },
      label = {
        -- Allow uppercase labels to be used
        uppercase = true,
        -- Add padding around labels
        after = true,
        before = false,
        -- Minimum pattern length to show labels
        min_pattern_length = 0,
        -- Use rainbow colors for labels
        rainbow = {
          enabled = true,
          shade = 5,
        },
      },
      highlight = {
        -- Show backdrop to make labels stand out
        backdrop = true,
        -- Highlight matched text
        matches = true,
        -- Priority of flash highlight groups
        priority = 5000,
        groups = {
          match = "FlashMatch",
          current = "FlashCurrent",
          backdrop = "FlashBackdrop",
          label = "FlashLabel",
        },
      },
      modes = {
        -- Options for the `/` and `?` search commands
        search = {
          enabled = true,
          highlight = { backdrop = false },
          jump = { history = true, register = true, nohlsearch = true },
        },
        -- Options for flash when doing character motions (f, F, t, T)
        char = {
          enabled = true,
          -- Show labels for all matches (not just after cursor)
          multi_line = true,
          -- Autohide flash after jumping
          autohide = false,
          -- Repeat jumps with f, F, t, T
          jump_labels = true,
          keys = { "f", "F", "t", "T", ";", "," },
        },
        -- Treesitter integration for smart selection
        treesitter = {
          labels = "abcdefghijklmnopqrstuvwxyz",
          jump = { pos = "range" },
          search = { incremental = false },
          label = { before = true, after = true, style = "inline" },
          highlight = {
            backdrop = false,
            matches = false,
          },
        },
        -- Remote flash for operating on distant text
        remote = {
          remote_op = { restore = true, motion = true },
        },
      },
      -- Prompt settings
      prompt = {
        enabled = true,
        prefix = { { "⚡", "FlashPromptIcon" } },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
