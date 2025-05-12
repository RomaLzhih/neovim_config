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
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      -- "fang2hou/blink-copilot",
      "giuxtaposition/blink-cmp-copilot",
    },
    opts = {
      completion = {
        ghost_text = { enabled = false },
      },
      sources = {
        default = { "copilot", "lsp", "snippets", "path", "buffer" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
      keymap = {
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-e>"] = { "select_and_accept" },
      },
    },
  },
}
