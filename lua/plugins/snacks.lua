return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    input = { enabled = true },
    scroll = {
      enabled = true,
      -- spamming = 100,
      animate = {
        duration = { step = 15, total = 200 },
        easing = "linear",
      },
      -- faster animation when repeating scroll after delay
      animate_repeat = {
        delay = 50, -- delay in ms before using the repeat animation
        duration = { step = 5, total = 50 },
        easing = "linear",
      },
      filter = function(buf)
        return vim.g.snacks_scroll ~= false
          and vim.b[buf].snacks_scroll ~= false
          and vim.bo[buf].buftype ~= "terminal"
          and vim.bo[buf].buftype ~= "prompt"
      end,
    },
    zen = {
      enabled = true,
      win = { style = { width = 95 }, backdrop = { transparent = false, blend = 0 } },
      toggles = { dim = false, diagnostics = true, inlay_hints = false },
    },
    bufdelete = { enabled = true },
    animate = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    picker = {
      matcher = {
        frecency = true, -- frecency bonus
        history_bonus = true, -- give more weight to chronological order
      },
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
    words = { enabled = false },
    indent = { indent = { char = "╏" }, scope = { char = "╏" }, animate = { enabled = false } },
    dashboard = {
      sections = {
        {
          section = "terminal",
          cmd = (vim.loop.os_uname().sysname == "Windows_NT")
              and [[powershell -NoProfile -ExecutionPolicy Bypass -Command "$dir = Join-Path $env:USERPROFILE '.config\wezterm\backdrops'; $img = Get-ChildItem -File -Path $dir | Get-Random; & chafa.exe `"$($img.FullName)`" --format symbols --symbols vhalf --size 60x17 --stretch --probe off; Start-Sleep -Milliseconds 100"]]
            or [[chafa "$HOME/.config/wezterm/backdrops/$(ls $HOME/.config/wezterm/backdrops | shuf -n 1)" --format symbols --symbols vhalf --size 60x17 --stretch --probe off; sleep .1]],
          height = 17,
          padding = 1,
        },
        {
          pane = 2,
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
        -- {
        --   section = "terminal",
        --   cmd = "pokemon-colorscripts -r --no-title; sleep .1",
        --   random = 999,
        --   pane = 1,
        --   indent = 15,
        --   height = 20,
        -- },
        -- { section = "keys", gap = 1, padding = 1 },
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
              vim.api.nvim_input("<cmd> ObsidianSearch <cr>")
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
              vim.api.nvim_input("<cmd>AutoSession restore<cr>")
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
