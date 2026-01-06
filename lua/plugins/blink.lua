return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      -- suggestion = { enabled = false },
      -- panel = { enabled = false },
      filetypes = {
        markdown = false,
        csv = true,
        help = true,
      },
      copilot_model = "gemini-3-flash",
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      -- "fang2hou/blink-copilot",
      "giuxtaposition/blink-cmp-copilot",
    },
    build = "cargo build --release",
    opts = {
      signature = { enabled = true },
      completion = {
        ghost_text = { enabled = false },
      },
      cmdline = {
        -- keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = false } },
      },
      appearance = {
        kind_icons = {
          Copilot = "",
        },
      },
      sources = {
        default = { "copilot", "lsp", "snippets", "path", "buffer", "omni" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = "Copilot"
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
            -- kind_icon = "",
            -- kind_hl = false,
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
