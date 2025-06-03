return { -- NOTE: avante
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    build = "make",
    enabled = function()
      return vim.fn.has("win32") == 0
    end,
    opts = {
      provider = "copilot",
      providers = {
        copilot = {
          -- model = "gemini-2.5-pro",
          model = "claude-sonnet-4",
        },
      },
      auto_suggestions_provider = "copilot",
      hints = { enabled = false },
      windows = {
        position = "left", -- the position of the sidebar
        width = 30, -- default % based on available width
        -- height = 50,
      },
    },
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
    },
  },

  -- NOTE: copilot chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "gpt-4o-mini",
      show_folds = false, -- Shows folds for sections in chat
      show_help = false, -- Shows help message as virtual lines when waiting for user input
      question_header = "󱜸 Question ", -- Header to use for user questions
      answer_header = " Copilot ", -- Header to use for AI answers
      error_header = " Error ", -- Header to use for errors
      window = {
        layout = "float",
        width = 0.618,
        height = 0.618,
        boarder = "rounded",
      },
    },
    lazy = false,
  },
}
