return {
  -- NOTE: themes
  { "EdenEast/nightfox.nvim", priority = 1000, lazy = true },
  { "savq/melange-nvim", priority = 1000, lazy = true },
  { "shaunsingh/nord.nvim", priority = 1000, lazy = true },
  { "craftzdog/solarized-osaka.nvim", priority = 1000, lazy = true },
  { "navarasu/onedark.nvim", priority = 1000, lazy = true },
  { "folke/tokyonight.nvim", priority = 1000, lazy = true },
  { "rebelot/kanagawa.nvim", priority = 1000, lazy = true },
  { "rose-pine/neovim", priority = 1000, lazy = true },
  { "sainnhe/gruvbox-material", priority = 1000, lazy = true },
  { "projekt0n/github-nvim-theme", priority = 1000, lazy = true },
  { "sainnhe/everforest", priority = 1000, lazy = true },
  { "Mofiqul/vscode.nvim", priority = 1000, lazy = true },
  { "marko-cerovac/material.nvim", priority = 1000, lazy = true },
  { "Mofiqul/dracula.nvim", priority = 1000, lazy = true },
  { "oxfist/night-owl.nvim", priority = 1000, lazy = true },
  { "HoNamDuong/hybrid.nvim", priority = 1000, lazy = true },
  { "thesimonho/kanagawa-paper.nvim", priority = 1000, lazy = true },
  { "bluz71/vim-moonfly-colors", priority = 1000, lazy = true },

  {
    "maxmx03/fluoromachine.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      local fm = require("fluoromachine")
      fm.setup({
        glow = true,
        theme = "retrowave",
        transparent = true,
        -- brightness = 0.02,
      })
    end,
  },
}
