-- Create symmetrical `$$` pair only in Tex files
local map_tex = function()
	MiniPairs.map_buf(0, "i", "$", { action = "closeopen", pair = "$$" })
end
vim.api.nvim_create_autocmd("FileType", { pattern = "tex", callback = map_tex })
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", callback = map_tex })
