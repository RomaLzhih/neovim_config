return {
  "stevearc/conform.nvim",
  opts = function()
    local opts = {
      default_format_opts = {
        timeout_ms = 500,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "autopep8", "black" },
        cpp = { "clang-format" },
        bash = { "shfmt" },
        shell = { "shfmt" },
        sh = { "shfmt" },
        -- tex = { "my" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
        my = {
          command = "tex-fmt",
          args = { "-s", "--nowrap" },
        },
        -- # Example of using dprint only when a dprint.json file is present
        -- dprint = {
        --   condition = function(ctx)
        --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
        --
        -- # Example of using shfmt with extra args
      },
    }
    return opts
  end,
}
