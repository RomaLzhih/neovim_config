return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "giuxtaposition/blink-cmp-copilot",
    },
  },
  opts = {
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
    },
  },
}
