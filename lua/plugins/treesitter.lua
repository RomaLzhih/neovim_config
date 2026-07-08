return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    -- vimtex provides richer LaTeX highlighting (math conceal, delimiters);
    -- keep the latex parser installed for markdown math injections, but let
    -- vimtex own highlighting in tex buffers
    highlight = { disable = { "latex" } },
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "latex",
      "r",
      "diff",
      "html",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "vim",
      "vimdoc",
    },
    textobjects = {
      select = {
        enable = true,
        look = true,
        include_surrounding_whitespace = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next = {
          ["]f"] = "@function.outer",
          ["]l"] = "@loop.outer",
          ["]c"] = "@conditional.outer",
        },
        goto_previous = {
          ["[f"] = "@function.outer",
          ["[l"] = "@loop.outer",
          ["[c"] = "@conditional.outer",
        },
      },
    },
  },
}
