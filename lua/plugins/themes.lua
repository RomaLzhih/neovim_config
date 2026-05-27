return {
  {
    "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      disable_hl_args = {
        bold = true,
        italic = true,
      },
    },
  },

  { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" },

  {
    "smit4k/shale.nvim",
  },

  {
    "ember-theme/nvim",
    name = "ember",
    priority = 1000,
    config = function()
      require("ember").setup({
        variant = "ember", -- "ember" | "ember-soft" | "ember-light"
      })
      -- vim.cmd("colorscheme ember")
    end,
  },

  {
    "git@github.com:metalelf0/jellybeans-nvim.git",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = true,
    priority = 1000,
    name = "jellybeans",
  },

  {
    "D0nw0r/dark2026.nvim",
    lazy = true,
    priority = 1000,
  },

  {
    "everviolet/nvim",
    lazy = true,
    config = function()
      require("evergarden").setup({
        style = {
          types = {},
          keyword = {},
          comment = {},
        },
      })
    end,
  },

  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("onedark").setup({
        style = "dark",
        highlights = {
          ["@variable"] = { fg = "#c0c7d6" },
          ["@constructor"] = { fmt = "none" },
          ["@lsp.type.variable"] = { fg = "#c0c7d6" },
          ["@lsp.type.parameter"] = { fg = "#c0c7d6" },
        },
      })
      -- require("onedark").load()
    end,
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
          -- vim.cmd("highlight Function guifg=#d7875f")
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
      highlight_groups = {
        -- Keyword = { fg = "#36809e" },
        -- ["@keyword.import"] = { fg = "#36809e" },
        -- ["@keyword.repeat"] = { fg = "#36809e" },
        -- ["@keyword.return"] = { fg = "#36809e" },
        -- ["@keyword.exception"] = { fg = "#36809e" },
        -- ["@keyword.conditional"] = { fg = "#36809e" },
        -- ["@keyword.conditional.ternary"] = { fg = "#36809e" },
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
          ["@punctuation.bracket"] = { fg = "#fbf1c7" },
          ["@punctuation.bracket"] = { fg = "#fbf1c7" },
          ["@punctuation.bracket"] = { fg = "#fbf1c7" },
          ["@punctuation.bracket"] = { fg = "#fbf1c7" },
          ["@punctuation.bracket"] = { fg = "#fbf1c7" },
          ["@keyword"] = { fg = "#d75f69" },
          ["@keyword.function"] = { fg = "#d75f69" },
          ["@keyword.repeat"] = { fg = "#d75f69" },
          ["@keyword.type"] = { fg = "#d75f69" },
          ["@keyword.conditional"] = { fg = "#d75f69" },
          ["@keyword.modifier"] = { fg = "#d75f69" },
          ["@keyword.return"] = { fg = "#d75f69" },
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

  {
    "shaunsingh/nord.nvim",
    name = "nord",
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.nord_italic = false
      vim.g.nord_bold = false
      -- require("nord").set()
    end,
  },

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
