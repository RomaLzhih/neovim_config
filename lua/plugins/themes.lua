return {
  -- NOTE: themes
  { "EdenEast/nightfox.nvim", priority = 1000, lazy = false },
  { "savq/melange-nvim", priority = 1000, lazy = false },
  { "craftzdog/solarized-osaka.nvim", priority = 1000, lazy = false },
  { "navarasu/onedark.nvim", priority = 1000, lazy = false },
  { "folke/tokyonight.nvim", priority = 1000, lazy = false },
  { "rebelot/kanagawa.nvim", priority = 1000, lazy = false },
  { "rose-pine/neovim", priority = 1000, lazy = false },
  { "sainnhe/gruvbox-material", priority = 1000, lazy = false },
  { "projekt0n/github-nvim-theme", priority = 1000, lazy = false },
  { "sainnhe/everforest", priority = 1000, lazy = false },
  { "Mofiqul/vscode.nvim", priority = 1000, lazy = false },
  { "marko-cerovac/material.nvim", priority = 1000, lazy = false },
  { "Mofiqul/dracula.nvim", priority = 1000, lazy = false },
  { "oxfist/night-owl.nvim", priority = 1000, lazy = false },
  { "HoNamDuong/hybrid.nvim", priority = 1000, lazy = false },
  { "thesimonho/kanagawa-paper.nvim", priority = 1000, lazy = false },
  { "bluz71/vim-moonfly-colors", priority = 1000, lazy = false },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      overrides = {
        ["@punctuation.bracket.lua"] = { fg = "#fbf1c7" },
        ["@punctuation.bracket.cpp"] = { fg = "#fbf1c7" },
        Operator = { fg = "#fbf1c7" },
        Bracket = { fg = "#fbf1c7" },
      },
    },
    priority = 1000,
    lazy = false,
  },
  { "vague2k/vague.nvim", priority = 1000, lazy = false },
  { "everviolet/nvim", priority = 1000, lazy = false },
  { "maxmx03/solarized.nvim", priority = 1000, lazy = false },
  { "fenetikm/falcon", priority = 1000, lazy = false },
  { "junegunn/seoul256.vim", priority = 1000, lazy = false },
  { "mhartington/oceanic-next", priority = 1000, lazy = false },
  { "tomasr/molokai", priority = 1000, lazy = false },
  { "cocopon/iceberg.vim", priority = 1000, lazy = false },
  { "nanotech/jellybeans.vim", priority = 1000, lazy = false },
  { "jnurmine/zenburn", priority = 1000, lazy = false },
  { "nordtheme/vim", name = "nord", priority = 1000, lazy = false },
  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local fm = require("fluoromachine")
      fm.setup({
        glow = false,
        theme = "retrowave",
        transparent = false,
        -- brightness = 0.02,
      })
    end,
  },
}
