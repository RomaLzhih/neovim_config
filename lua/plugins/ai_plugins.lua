return {
  -- NOTE: sidekick
  {
    "folke/sidekick.nvim",
    lazy = false,
    opts = {
      -- add any options here
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
        },
      },
    },
    keys = {
      {
        "<c-m>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<c-m>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<leader>aa",
        mode = { "n" },
        function()
          require("sidekick.cli").toggle({ filter = { installed = true } })
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ filter = { installed = true }, msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").send({ filter = { installed = true }, msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      {
        "<c-.>",
        function()
          require("sidekick.cli").focus()
        end,
        mode = { "n", "x", "i", "t" },
        desc = "Sidekick Switch Focus",
      },
      -- Example of a keybinding to open cli directly
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "opencode", focus = true })
        end,
        desc = "Sidekick Toggle Opencode",
      },
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
      model = "claude-sonnet-4.5",
      show_folds = false, -- Shows folds for sections in chat
      show_help = true, -- Shows help message as virtual lines when waiting for user input
      auto_insert_mode = false,
      question_header = "󱜸 Question ", -- Header to use for user questions
      answer_header = " Copilot ", -- Header to use for AI answers
      error_header = " Error ", -- Header to use for errors
      window = {
        layout = "float",
        width = 0.618,
        height = 0.80,
        boarder = "rounded",
      },
      -- Use visual selection, fallback to current line
      selection = function(source)
        return require("CopilotChat.select").visual(source) or require("CopilotChat.select").line(source)
      end,
    },
    lazy = false,
  },

  -- NOTE: avante
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    -- build = "make",
    enabled = false,
    build = function()
      -- conditionally use the correct build system for the current OS
      if vim.fn.has("win32") == 1 then
        return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      else
        return "make"
      end
    end,
    opts = {
      -- mode = "legacy",
      selection = { enabled = false },
      provider = "copilot",
      providers = {
        copilot = {
          model = "grok-code-fast-1",
        },
      },
      auto_suggestions_provider = "copilot",
      hints = { enabled = false },
      windows = {
        position = "left", -- the position of the sidebar
        width = 25, -- default % based on available width
        -- height = 50,
      },
    },
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "folke/snacks.nvim", -- for input provider snacks
      "zbirenbaum/copilot.lua", -- for providers='copilot'
    },
  },
}
