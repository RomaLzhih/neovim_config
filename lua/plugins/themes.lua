return {
  -- NOTE: themes
  { "EdenEast/nightfox.nvim", priority = 1000, lazy = false },
  { "savq/melange-nvim", priority = 1000, lazy = false },
  { "shaunsingh/nord.nvim", priority = 1000, lazy = false },
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
