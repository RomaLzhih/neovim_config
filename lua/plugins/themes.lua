return {
  -- NOTE: themes
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
        },
        variant = "winter",
        on_highlights = function(colors, color)
          --https://github.com/maxmx03/solarized.nvim/blob/c0dfe1cbfabd93b546baf5f1408f5df7e02e2050/lua/solarized/palette/init.lua
          local groups = {
            Type = { fg = colors.yellow },
            -- Keyword = { fg = colors.red },
            Keyword = { fg = "#df4643" },
            Parameter = { fg = colors.base0 },
            Identifier = { fg = colors.base1 },
            Property = { fg = colors.base1 },
          }

          return groups
        end,
      })
    end,
    lazy = false,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        no_italic = true,
      })
    end,
    lazy = false,
  },
  { "EdenEast/nightfox.nvim", lazy = false },
  { "savq/melange-nvim", lazy = false },
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
    lazy = false,
  },
  { "navarasu/onedark.nvim", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },
  { "rebelot/kanagawa.nvim", lazy = false },
  { "rose-pine/neovim", name = "rose-pine", opts = {
    styles = {
      italic = false,
    },
  }, lazy = false },
  { "sainnhe/gruvbox-material", lazy = false },
  { "projekt0n/github-nvim-theme", lazy = false },
  { "sainnhe/everforest", lazy = false },
  { "Mofiqul/vscode.nvim", lazy = false },
  { "marko-cerovac/material.nvim", lazy = false },
  { "Mofiqul/dracula.nvim", lazy = false },
  { "oxfist/night-owl.nvim", lazy = false },
  { "HoNamDuong/hybrid.nvim", lazy = false },
  { "thesimonho/kanagawa-paper.nvim", lazy = false },
  -- { "bluz71/vim-moonfly-colors", lazy = false },
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
  -- { "vague2k/vague.nvim", lazy = false },
  {
    "everviolet/nvim",
    config = function()
      require("evergarden").setup({
        theme = {
          variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
          accent = "green",
        },
        editor = {
          transparent_background = false,
          override_terminal = true,
          sign = { color = "none" },
          float = {
            color = "mantle",
            invert_border = false,
          },
          completion = {
            color = "surface0",
          },
        },
        style = {
          tabline = { "reverse" },
          search = { "italic", "reverse" },
          incsearch = { "italic", "reverse" },
          types = {},
          keyword = {},
          comment = {},
        },
      })
    end,
    lazy = false,
  },
  { "junegunn/seoul256.vim", lazy = false },
  { "mhartington/oceanic-next", lazy = false },
  { "tomasr/molokai", lazy = false },
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
