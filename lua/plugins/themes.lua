return {
  -- NOTE: themes
  { "EdenEast/nightfox.nvim", lazy = false },
  { "savq/melange-nvim", lazy = false },
  { "craftzdog/solarized-osaka.nvim", opts = { transparent = false }, lazy = false },
  { "navarasu/onedark.nvim", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },
  { "rebelot/kanagawa.nvim", lazy = false },
  { "rose-pine/neovim", lazy = false },
  { "sainnhe/gruvbox-material", lazy = false },
  { "projekt0n/github-nvim-theme", lazy = false },
  { "sainnhe/everforest", lazy = false },
  { "Mofiqul/vscode.nvim", lazy = false },
  { "marko-cerovac/material.nvim", lazy = false },
  { "Mofiqul/dracula.nvim", lazy = false },
  { "oxfist/night-owl.nvim", lazy = false },
  { "HoNamDuong/hybrid.nvim", lazy = false },
  { "thesimonho/kanagawa-paper.nvim", lazy = false },
  { "bluz71/vim-moonfly-colors", lazy = false },
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
          ["@keyword.repeat.cpp"] = { fg = "#d75f69" },
          ["@keyword.type.cpp"] = { fg = "#d75f69" },
          ["@keyword.conditional.cpp"] = { fg = "#d75f69" },
          ["@keyword.modifier.cpp"] = { fg = "#d75f69" },
          ["@keyword.return.cpp"] = { fg = "#d75f69" },
          Operator = { fg = "#fbf1c7" },
          Bracket = { fg = "#fbf1c7" },
        },
      })
      -- vim.cmd("colorscheme gruvbox")
    end,
    lazy = false,
  },
  { "vague2k/vague.nvim", lazy = false },
  { "everviolet/nvim", lazy = false },
  { "shaunsingh/solarized.nvim", lazy = false },
  { "fenetikm/falcon", lazy = false },
  { "junegunn/seoul256.vim", lazy = false },
  { "mhartington/oceanic-next", lazy = false },
  { "tomasr/molokai", lazy = false },
  { "cocopon/iceberg.vim", lazy = false },
  { "nanotech/jellybeans.vim", lazy = false },
  { "jnurmine/zenburn", lazy = false },
  { "nordtheme/vim", name = "nord", lazy = false },
  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,

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
