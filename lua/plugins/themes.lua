return {
  -- NOTE: themes
  { "EdenEast/nightfox.nvim", priority = 1000, lazy = true },
  { "savq/melange-nvim", priority = 1000, lazy = true },
  { "shaunsingh/nord.nvim", priority = 1000, lazy = true },
  { "craftzdog/solarized-osaka.nvim", priority = 1000, lazy = true },
  { "navarasu/onedark.nvim", priority = 1000, lazy = true },
  { "folke/tokyonight.nvim", priority = 1000, lazy = true },
  { "rebelot/kanagawa.nvim", priority = 1000, lazy = true },
  -- { "catppuccin/nvim", priority = 1000, lazy = true },
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
