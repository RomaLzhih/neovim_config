return {
  "folke/flash.nvim",
  opts = {
    modes = {
      char = {
        jump_labels = true,
        multi_line = false,
        highlight = { backdrop = false },
        jump = { autojump = true },
      },
      search = { enabled = true },
    },
    jump = { autojump = true },
    label = { style = "overlay", rainbow = { enable = true } },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
  },
}
