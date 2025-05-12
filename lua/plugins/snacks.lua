return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    input = { enabled = true },
    scroll = {
      enabled = false,
      spamming = 100,
      filter = function(buf)
        return vim.g.snacks_scroll ~= false
          and vim.b[buf].snacks_scroll ~= false
          and vim.bo[buf].buftype ~= "terminal"
          and vim.bo[buf].buftype ~= "prompt"
      end,
    },
    zen = {
      enabled = true,
      win = { style = { width = 90 }, backdrop = { transparent = true, blend = 15 } },
      toggles = { dim = false, diagnostics = true, inlay_hints = false },
    },
    bufdelete = { enabled = true },
    animate = { enabled = false },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    picker = {
      win = {
        input = {
          keys = {
            ["<S-Tab>"] = { "list_up", mode = { "i" } },
            ["<Tab>"] = { "list_down", mode = { "i" } },
            -- ["<S-Tab>"] = { "select_and_prev", mode = { "n" } },
            -- ["<Tab>"] = { "select_and_next", mode = { "n" } },
          },
        },
      },
    },
    indent = { indent = { char = "╏" }, scope = { char = "╏" }, animate = { enabled = true } },
    dashboard = {
      sections = {
        {
          section = "terminal",
          cmd = "pokemon-colorscripts -r --no-title; sleep .1",
          random = 999,
          pane = 1,
          indent = 15,
          height = 20,
        },
        { section = "keys", gap = 1, padding = 1 },
      },
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          {
            action = function()
              vim.api.nvim_input("<cmd> Neorg index <cr>")
            end,
            desc = "Wiki",
            icon = "󱓷 ",
            key = "i",
          },
          {
            action = function()
              require("snacks").lazygit()
            end,
            desc = "Git",
            icon = "󰊢 ",
            key = "g",
          },
          {
            action = function()
              vim.api.nvim_input("<cmd>SessionRestore<cr>")
            end,
            desc = "Restore Session",
            icon = " ",
            key = "p",
          },
          {
            action = function()
              vim.api.nvim_input("<cmd>Lazy update<cr>")
            end,
            desc = "Update plugins",
            icon = " ",
            key = "u",
          },
          {
            action = function()
              vim.api.nvim_input(":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>")
            end,
            desc = "Settings",
            icon = " ",
            key = "s",
          },
          {
            action = function()
              vim.api.nvim_input("<cmd>qa<cr>")
            end,
            desc = "Quit",
            icon = "󰩈 ",
            key = "q",
          },
        },
      },
    },
    image = { enabled = true },
  },
}
