return {
  -- NOTE: themes
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("NeoSolarized").setup({
        transparent = false,
        enable_italics = false,
        styles = {
          -- Style to be applied to different syntax groups
          comments = { italic = false },
          keywords = { italic = false },
          functions = { bold = true },
          variables = {},
          string = { italic = false },
          TSNameSpace = { italic = false },
          underline = true, -- true/false; for global underline
          undercurl = true, -- true/false; for global undercurl
        },
      })
    end,
  },

  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_enable_italic = false
    end,
    lazy = true,
  },

  {
    "maxmx03/solarized.nvim",
    config = function()
      require("solarized").setup({
        styles = {
          enabled = true,
          comments = { italic = false, bold = false },
          functions = { italic = false },
          variables = { italic = false },
          parameters = { italic = false, bold = true },
          keywords = { italic = false, bold = false },
        },
        variant = "winter",
        on_highlights = function(colors, color)
          --https://github.com/maxmx03/solarized.nvim/blob/c0dfe1cbfabd93b546baf5f1408f5df7e02e2050/lua/solarized/palette/init.lua
          local groups = {
            Type = { fg = colors.yellow },
            Keyword = { fg = "#859900" },
            Parameter = { fg = colors.base0 },
            Identifier = { fg = colors.base1 },
            Property = { fg = colors.base1 },
          }

          return groups
        end,
      })
    end,
    priority = 1000,
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
  { "navarasu/onedark.nvim", priority = 1000, lazy = true },
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
  { "nordtheme/vim", name = "nord", priority = 1000, lazy = true },
  {
    "maxmx03/fluoromachine.nvim",
    priority = 1000,
    lazy = true,

    config = function()
      local fm = require("fluoromachine")
      fm.setup({
        glow = true,
        brightness = 0.03,
        theme = "retrowave",
        transparent = false,
      })
    end,
  },
}
