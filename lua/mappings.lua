require("nvchad.mappings")

-- Disable mappings
local nomap = vim.keymap.del
nomap("n", "<C-c>")

-- Enabled mappings
local map = vim.keymap.set
map("n", "<C-a>", "ggVG <CR>", { desc = "Select all" })
map("n", "<A-Up>", "ddkP", { desc = "Move line up" })
map("n", "<A-Down>", "ddp", { desc = "Move line below" })
map("n", "<A-e>", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
map("n", "<leader>pl", "<cmd> set spell! <CR>", { desc = "Toggle spell check" })
map("n", "<leader>bd", "<cmd> Bdelete <CR> <BAR> <cmd> q <CR>", { desc = "Close buffer and split window" })
map("n", "<A-h>", function()
	require("tmux").resize_left()
end, { desc = "tmux resoze_left()" })
map("n", "<C-n>", "<Plug>(vm-find-word)", { desc = "visual-multi-find-word" })

-- NOTE: terminal
map({ "n", "t" }, "<A-w>", function()
	require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm", size = 0.3 })
end, { desc = "Toggle horizontal term" })

-- NOTE: format
map("n", "<leader>fm", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "conform formatting" })

-- NOTE: jump to previous edit
map("n", "<C-f>", function()
	require("before").jump_to_last_edit()
end, { desc = "Jump to last edit" })

map("n", "<C-b>", function()
	require("before").jump_to_next_edit()
end, { desc = "Jump to last edit" })

-- NOTE: lint
map("n", "<leader>tl", function()
	require("lint").linters_by_ft.cpp = { "clang-tidy", "cpplint", "cppcheck" }
	require("lint").try_lint()
end, { desc = "Linting" })

map("n", "<leader>ul", function()
	require("lint").linters_by_ft.cpp = {}
	require("lint").try_lint()
end, { desc = "Un-linting" })

-- NOTE: toggle fold
map("n", "<A-q>", "za", { desc = "Toggle all folding under cursor" })

-- NOTE: lsp saga
map("n", "<leader>ic", "<cmd> Lspsaga incoming_calls <CR>", { desc = "lsp saga incoming calls" })
map("n", "<leader>oc", "<cmd> Lspsaga outgoing_calls <CR>", { desc = "lsp saga outgoing calls" })
map("n", "<leader>ca", "<cmd> Lspsaga code_action <CR>", { desc = "lsp saga code action" })
map("n", "<leader>pd", "<cmd> Lspsaga peek_definition <CR>", { desc = "lsp saga peak definition" })
map("n", "<leader>pt", "<cmd> Lspsaga peek_type_definition <CR>", { desc = "lsp saga peak type definition" })
map("n", "<leader>fd", "<cmd> Lspsaga finder <CR>", { desc = "lsp saga finder" })
map("n", "<leader>ol", "<cmd> Lspsaga outline <CR>", { desc = "lsp saga outline" })
map("n", "<leader>rn", "<cmd> Lspsaga rename <CR>", { desc = "lsp saga rename" })
map("n", "<leader>wd", "<cmd> Lspsaga show_workspace_diagnostics <CR>", { desc = "lsp saga rename" })
map("n", "<leader>sbd", "<cmd> Lspsaga show_buf_diagnostics <CR>", { desc = "lsp saga rename" })

-- NOTE: LSP motion
map("n", "gD", function()
	vim.lsp.buf.declaration()
end, { desc = "LSP declaration" })
map("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "LSP definition" })
map("n", "gi", function()
	vim.lsp.buf.implementation()
end, { desc = "LSP implementation" })
map("n", "<leader>td", function()
	vim.lsp.buf.type_definition()
end, { desc = "LSP definition type" })

-- NOTE: neorg
map("n", "<leader>id", "<cmd> Neorg index <CR>", { desc = "Neorg open index" })
map("n", "<leader>rt", "<cmd> Neorg return <CR>", { desc = "Neorg return to work" })

-- NOTE: telescope
map("n", "<leader>cs", "<cmd> Telescope colorscheme <CR>", { desc = "Telescope colorscheme" })
map("n", "<leader>yk", "<cmd> Telescope neoclip <CR>", { desc = "neclip copy" })

-- NOTE: center buffer
map("n", "<leader>cm", "<cmd> NoNeckPain <CR>", { desc = "center buffer" })

-- NOTE: harpoon
local harpoon = require("harpoon")

map("n", "<leader>ha", function()
	harpoon:list():append()
end, { desc = "harpoon add" })

map("n", "<leader>hm", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "harpoon menu" })

map("n", "<leader>hq", function()
	harpoon:list():select(1)
end, { desc = "harpoon select 1" })

map("n", "<leader>hw", function()
	harpoon:list():select(2)
end, { desc = "harpoon select 2" })

map("n", "<leader>he", function()
	harpoon:list():select(3)
end, { desc = "harpoon select 3" })

map("n", "<leader>hr", function()
	harpoon:list():select(4)
end, { desc = "harpoon select 4" })

map("n", "<C-A-p>", function()
	harpoon:list():prev()
end, { desc = "harpoon previous" })

map("n", "<C-A-n>", function()
	harpoon:list():next()
end, { desc = "harpoon next" })
