return {
  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_enable_italic = false
    end,
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        no_italic = true,
      })
    end,
    priority = 1000,
    lazy = true,
  },
  { "EdenEast/nightfox.nvim", priority = 1000, lazy = true },
  { "ishan9299/nvim-solarized-lua", priority = 1000, lazy = true },
  { "pappasam/papercolor-theme-slim", priority = 1000, lazy = true },
  {
    "craftzdog/solarized-osaka.nvim",
    opts = {
      styles = {
        keywords = { italic = false },
      },
      on_highlights = function(hl, col)
        hl["@punctuation.bracket"] = { fg = col.base00 }
      end,
      transparent = false,
    },
    priority = 1000,
    lazy = true,
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = true,
    priority = 1000, -- Ensure it loads first
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
    priority = 1000,
    lazy = false,
  },
  {
    "rebelot/kanagawa.nvim",
    opts = { commentStyle = { italic = false }, functionStyle = {}, keywordStyle = { italic = false } },
    priority = 1000,
    lazy = true,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        italic = false,
      },
    },
    priority = 1000,
    lazy = true,
  },
  { "sainnhe/gruvbox-material", priority = 1000, lazy = true },
  { "projekt0n/github-nvim-theme", priority = 1000, lazy = true },
  { "sainnhe/everforest", priority = 1000, lazy = true },
  { "Mofiqul/vscode.nvim", priority = 1000, lazy = true },
  { "marko-cerovac/material.nvim", priority = 1000, lazy = true },
  { "oxfist/night-owl.nvim", opts = { italics = false }, priority = 1000, lazy = true },
  { "thesimonho/kanagawa-paper.nvim", priority = 1000, lazy = true },
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
      -- vim.cmd("colorscheme catppuccin-macchiato")
      vim.cmd("colorscheme gruvbox")
    end,
    priority = 1000,
    lazy = false,
  },
  { "junegunn/seoul256.vim", priority = 1000, lazy = true },
  { "mhartington/oceanic-next", priority = 1000, lazy = true },
  -- { "nordtheme/vim", name = "nord", priority = 1000, lazy = true },
  { "gbprod/nord.nvim", name = "nord", priority = 1000, lazy = true },
  { "Yazeed1s/oh-lucy.nvim", priority = 1000, lazy = true },
  { "rmehri01/onenord.nvim", priority = 1000, lazy = true },
  { "HoNamDuong/hybrid.nvim", priority = 1000, lazy = true },
  {
    "maxmx03/fluoromachine.nvim",
    priority = 1000,
    lazy = true,

    config = function()
      local fm = require("fluoromachine")
      fm.setup({
        glow = true,
        brightness = 0.02,
        theme = "retrowave",
        transparent = false,
      })
    end,
  },
}
