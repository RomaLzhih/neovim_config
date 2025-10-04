return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = false,
        csv = true,
        help = true,
      },
      copilot_model = "claude-sonnet-4.5",
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      -- "fang2hou/blink-copilot",
      "giuxtaposition/blink-cmp-copilot",
    },
    opts = {
      signature = { enabled = true },
      completion = {
        ghost_text = { enabled = false },
      },
      cmdline = {
        -- keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = false } },
      },
      sources = {
        default = { "copilot", "lsp", "snippets", "path", "buffer", "omni" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
            kind_icon = "",
            kind_hl = false,
          },
        },
      },
      keymap = {
        ["<Tab>"] = {
          "select_next",
          function() -- sidekick next edit suggestion
            return require("sidekick").nes_jump_or_apply()
          end,
          "fallback",
        },
        -- ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-e>"] = { "select_and_accept" },
        ["<C-x>"] = { "hide" },
      },
    },
  },
}
