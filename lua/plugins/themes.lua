return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "smit4k/shale.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "ankushbhagats/pastel.nvim",
    lazy = true, -- disable lazy loading
    priority = 1000, -- load immediately at startup
    opts = {}, -- your configuration comes here
    config = true, -- call setup function with provided opts
  },
  {
    "vague-theme/vague.nvim",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    opts = {
      italic = false,
    },
  },
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      styles = {
        comment = { italic = false },
        keyword = { italic = false },
        type = { italic = false },
        storageclass = { italic = false },
        structure = { italic = false },
        parameter = { italic = false },
        annotation = { italic = false },
        tag_attribute = { italic = false },
      },
      override = function()
        return {
          ["@punctuation.bracket"] = { fg = "#f9ebaf" },
          ["@operator"] = { fg = "#f0ebaf" },
          ["@operator.cpp"] = { fg = "#f0ebaf" },
        }
      end,
    },
  },
  { "yorik1984/newpaper.nvim" },
  {
    "datsfilipe/vesper.nvim",
    opts = {
      italics = {
        -- comments = false, -- Boolean: Italicizes comments
        -- keywords = false, -- Boolean: Italicizes keywords
        -- functions = false, -- Boolean: Italicizes functions
        strings = false, -- Boolean: Italicizes strings
        variables = false, -- Boolean: Italicizes variables
      },
    },
  },

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
  {
    "pappasam/papercolor-theme-slim",
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "PaperColorSlim",
        callback = function()
          vim.cmd("highlight Function guifg=#d7875f")
          vim.cmd("highlight Delimiter guifg=NormalNC")
        end,
      })
    end,
    priority = 1000,
    lazy = true,
  },
  { "embark-theme/vim", name = "embark", priority = 1000, lazy = true },
  {
    "craftzdog/solarized-osaka.nvim",
    opts = {
      styles = {
        keywords = { italic = false },
        parameter = { bold = true },
      },
      on_highlights = function(hl, col)
        hl["@punctuation.bracket"] = { fg = col.base00 }
        hl["@variable.parameter"] = { fg = col.base1 }
        hl["@lsp.type.namespace.cpp"] = { fg = col.cyan }
        hl["@lsp.type.macro.cpp"] = { fg = col.orange }
      end,
      transparent = false,
    },
    priority = 1000,
    lazy = true,
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
  {
    "Mofiqul/vscode.nvim",
    opts = {
      group_overrides = {
        ["@variable.parameter"] = { fg = "#c8c8c8" },
        ["@lsp.type.property.cpp"] = { fg = "#569cd6" },
      },
    },
    priority = 1000,
    lazy = true,
  },
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
      -- vim.cmd("colorscheme rose-pine")
      -- vim.cmd("colorscheme duskfox")
      -- vim.cmd("colorscheme github_dark")
      vim.cmd("colorscheme gruvbox")
    end,
    priority = 1000,
    lazy = false,
  },
  { "mhartington/oceanic-next", priority = 1000, lazy = true },
  -- { "nordtheme/vim", name = "nord", priority = 1000, lazy = true },
  { "gbprod/nord.nvim", name = "nord", priority = 1000, lazy = true },
  { "HoNamDuong/hybrid.nvim", priority = 1000, lazy = true },
  {
    "maxmx03/fluoromachine.nvim",
    priority = 1000,
    lazy = true,

    config = function()
      local fm = require("fluoromachine")
      fm.setup({
        glow = false,
        brightness = 0.02,
        theme = "retrowave",
        transparent = false,
      })
    end,
  },
}
