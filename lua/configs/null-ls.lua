local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
