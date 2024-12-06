require("nvchad.options")

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
-- NOTE: terminal colors
vim.o.termguicolors = true

-- NOTE: use trouble to open the cmd
-- vim.api.nvim_create_autocmd("QuickFixCmdPost", {
-- 	callback = function()
-- 		vim.cmd([[Trouble qflist open]])
-- 	end,
-- })

-- NOTE: set the default conceallevel for neorg file
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.norg" },
	command = "set conceallevel=3",
})

-- NOTE: manage the session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- NOTE: vim scroll off
vim.o.scrolloff = 3

-- NOTE: make arg
vim.o.makeprg = "make -C build -j4"

vim.g.VM_maps = {
	["I BS"] = "", -- disable backspace mapping
}

-- NOTE: UFO folding
vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:󰤻,foldsep: ,foldclose:󰡌]]
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "NeogitStatus", "NeogitDiffView", "sagaoutline" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
		vim.opt_local.foldcolumn = "0"
	end,
})

-- NOTE: enable cursoreline
vim.o.cursorlineopt = "number,line"

-- NOTE: set semantic syntax
-- see: https://www.reddit.com/r/neovim/comments/12gvms4/this_is_why_your_higlights_look_different_in_90/
local links = {
	["@lsp.type.namespace"] = "@namespace",
	["@lsp.type.type"] = "@type",
	["@lsp.type.class"] = "@type",
	["@lsp.type.enum"] = "@type",
	["@lsp.type.concept"] = "@macro",
	["@lsp.type.interface"] = "@type",
	["@lsp.type.typeParameter.cpp"] = "@type",
	["@lsp.type.struct"] = "@structure",
	["@lsp.type.parameter"] = "@parameter",
	["@lsp.type.variable"] = "@variable",
	["@lsp.type.property"] = "@property",
	["@lsp.type.enumMember"] = "@constant",
	["@lsp.type.function"] = "@function",
	["@lsp.type.method"] = "@function",
	["@lsp.type.macro"] = "@macro",
	["@lsp.type.decorator"] = "@function",
	["@lsp.typemod.variable.readonly"] = "@constant",
	["@markup.italic.markdown_inline"] = "@function",
	["@markup.strong.markdown_inline"] = "@parameter",
	["@keyword.exception.cpp"] = "@keyword",
}
for newgroup, oldgroup in pairs(links) do
	vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end

-- NOTE: change diagnostic symbols
local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
for name, icon in pairs(symbols) do
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

-- NOTE: auto reload file change
vim.cmd([[
  set autoread
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
	autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])

-- NOTE: limit completion items
vim.opt.pumheight = 10

-- NOTE: relative line number
vim.wo.relativenumber = true

-- NOTE: remap the :w
vim.cmd("command! W write")

-- NOTE: ignore the smartcase
vim.cmd([[
set ignorecase smartcase
]])

vim.cmd([[
autocmd BufWinEnter,WinEnter term://* startinsert
]])

-- NOTE: jump out of the bracket
function EscapePair()
	local closers = { ")", "]", "}", ">", "'", '"', "`", ",", "$" }
	local line = vim.api.nvim_get_current_line()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local after = line:sub(col + 1, -1)
	local closer_col = #after + 1
	local closer_i = nil
	for i, closer in ipairs(closers) do
		local cur_index, _ = after:find(closer)
		if cur_index and (cur_index < closer_col) then
			closer_col = cur_index
			closer_i = i
		end
	end
	if closer_i then
		vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
	else
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
	end
end

vim.api.nvim_set_keymap("i", "<C-d>", "<cmd>lua EscapePair()<CR>", { noremap = true, silent = true })

-- NOTE: neovide
if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	vim.o.guifont = "SauceCodePro Nerd Font:h12"
	-- vim.o.guifont = "JetBrainsMono NF:h12"
	-- vim.o.guifont = "FantasqueSansM Nerd Font:h13"
	-- vim.o.guifont = "Consolas ligaturized v3:h13"
	vim.g.neovide_transparency = 0.95
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_cursor_animation_length = 0.1
	vim.g.neovide_cursor_trail_size = 0.5
	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0
	vim.g.neovide_remember_window_size = true
end
