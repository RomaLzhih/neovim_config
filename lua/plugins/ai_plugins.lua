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
        mode = { "i", "x", "n" },
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
}
