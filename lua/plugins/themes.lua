return {
  -- NOTE: themes
  { "EdenEast/nightfox.nvim", lazy = true },
  { "savq/melange-nvim", lazy = true },
  { "craftzdog/solarized-osaka.nvim", opts = { transparent = false }, lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "rose-pine/neovim", lazy = true },
  { "sainnhe/gruvbox-material", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = true },
  { "sainnhe/everforest", lazy = true },
  { "Mofiqul/vscode.nvim", lazy = true },
  { "marko-cerovac/material.nvim", lazy = true },
  { "Mofiqul/dracula.nvim", lazy = true },
  { "oxfist/night-owl.nvim", lazy = true },
  { "HoNamDuong/hybrid.nvim", lazy = true },
  { "thesimonho/kanagawa-paper.nvim", lazy = true },
  { "bluz71/vim-moonfly-colors", lazy = true },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {},
    config = function()
      require("gruvbox").setup({
        bold = false,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
        overrides = {
          ["@punctuation.bracket.lua"] = { fg = "#fbf1c7" },
          ["@punctuation.bracket.cpp"] = { fg = "#fbf1c7" },
          ["@punctuation.bracket.python"] = { fg = "#fbf1c7" },
          ["@punctuation.bracket.bash"] = { fg = "#fbf1c7" },
          ["@punctuation.bracket.r"] = { fg = "#fbf1c7" },
          ["@keyword.cpp"] = { fg = "#d75f69" },
          ["@keyword.type.cpp"] = { fg = "#d75f69" },
          ["@keyword.conditional.cpp"] = { fg = "#d75f69" },
          ["@keyword.modifier.cpp"] = { fg = "#d75f69" },
          ["@keyword.return.cpp"] = { fg = "#d75f69" },
          Operator = { fg = "#fbf1c7" },
          Bracket = { fg = "#fbf1c7" },
        },
      })
      vim.cmd("colorscheme gruvbox")
    end,
    lazy = false,
  },
  { "vague2k/vague.nvim", lazy = true },
  { "everviolet/nvim", lazy = true },
  { "maxmx03/solarized.nvim", lazy = true },
  { "fenetikm/falcon", lazy = true },
  { "junegunn/seoul256.vim", lazy = true },
  { "mhartington/oceanic-next", lazy = true },
  { "tomasr/molokai", lazy = true },
  { "cocopon/iceberg.vim", lazy = true },
  { "nanotech/jellybeans.vim", lazy = true },
  { "jnurmine/zenburn", lazy = true },
  { "nordtheme/vim", name = "nord", lazy = true },
  {
    "maxmx03/fluoromachine.nvim",
    lazy = true,

    config = function()
      local fm = require("fluoromachine")
      fm.setup({
        glow = true,
        theme = "retrowave",
        transparent = false,
      })
    end,
  },
}
