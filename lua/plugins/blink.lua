local kind_icons = {
  -- LLM Provider icons
  claude = "󱚥",
  openai = "󱢆",
  codestral = "󱎥",
  gemini = "",
  Groq = "",
  Openrouter = "󱂇",
  Ollama = "󰳆",
  Copilot = "",
  ["Llama.cpp"] = "󰳆",
  Deepseek = "",
}

local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      -- suggestion = { enabled = false },
      -- panel = { enabled = false },
      filetypes = {
        csv = true,
        help = true,
      },
      -- copilot_model = "gpt-52-copilot",
    },
  },

  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        -- Your configuration options here
        provider = "claude",
        n_completions = 1,
        provider_options = {
          claude = {
            max_tokens = 256,
            -- model = "claude-haiku-4.5",
            stream = true,
            api_key = "ANTHROPIC_API_KEY",
            end_point = "https://api.anthropic.com/v1/messages",
            optional = {},
            transform = {},
          },
        },
      })
    end,
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      "giuxtaposition/blink-cmp-copilot",
    },
    build = "cargo build --release",
    opts = {
      signature = { enabled = true },
      completion = {
        ghost_text = { show_with_menu = false, enabled = false },
        trigger = { prefetch_on_insert = false },
      },
      cmdline = {
        -- keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = false } },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
        kind_icons = kind_icons,
      },
      sources = {
        default = is_windows and { "copilot", "lsp", "snippets", "path", "buffer", "omni" }
          or { "minuet", "lsp", "snippets", "path", "buffer", "omni" },
        providers = {
          copilot = is_windows and {
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
          } or nil,
          minuet = not is_windows and {
            name = "minuet",
            module = "minuet.blink",
            async = true,
            timeout_ms = 3000,
            score_offset = 50,
          } or nil,
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
