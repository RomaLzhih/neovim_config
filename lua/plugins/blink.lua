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
      "onsails/lspkind.nvim",
    },
    opts = {
      signature = { enabled = true },
      completion = {
        ghost_text = { enabled = false },
        menu = {
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local mini_icon, _ = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                    if mini_icon then
                      return mini_icon .. ctx.icon_gap
                    end
                  end

                  local icon = require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from mini.icons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local mini_icon, mini_hl = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                    if mini_icon then
                      return mini_hl
                    end
                  end
                  return ctx.kind_hl
                end,
              },
              kind = {
                -- Optional, use highlights from mini.icons
                highlight = function(ctx)
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local mini_icon, mini_hl = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                    if mini_icon then
                      return mini_hl
                    end
                  end
                  return ctx.kind_hl
                end,
              },
            },
          },
        },
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
          },
        },
      },
      keymap = {
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-e>"] = { "select_and_accept" },
        ["<C-x>"] = { "hide" },
      },
    },
  },
}
