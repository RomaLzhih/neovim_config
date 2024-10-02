vim.opt_local.conceallevel = 2

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.md",
  command = "silent! RenderMarkdown",
})
