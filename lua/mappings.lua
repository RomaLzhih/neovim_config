require("nvchad.mappings")

-- Enabled mappings
local map = vim.keymap.set
map("n", "<C-a>", "ggVG <CR>", { desc = "Select all" })
map("n", "<A-Up>", "ddkP", { desc = "Move line up" })
map("n", "<A-Down>", "ddp", { desc = "Move line below" })
map("n", "<A-e>", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
map("n", "<leader>pl", "<cmd> set spell! <CR>", { desc = "Toggle spell check" })

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
map("n", "<A-q>", "zA", { desc = "Toggle all folding under cursor" })

-- NOTE: search
map("n", "/", "<Plug>(easymotion-sn)", { desc = "easy motion n char search" })

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

-- NOTE: neorg
map("n", "<leader>id", "<cmd> Neorg index <CR>", { desc = "Neorg open index" })
map("n", "<leader>rt", "<cmd> Neorg return <CR>", { desc = "Neorg return to work" })

-- NOTE: telescope
map("n", "<leader>cs", "<cmd> Telescope colorscheme <CR>", { desc = "Telescope colorscheme" })

-- NOTE: center buffer
map("n", "<leader>cm", "<cmd> NoNeckPain <CR>", { desc = "center buffer" })
-- map("n", "<leader>ci", "<cmd> NoNeckPainWidthUp <CR>", { desc = "Increase center margin" })
-- map("n", "<leader>cd", "<cmd> NoNeckPainWidthDown <CR>", { desc = "Decrease center margin" })

-- Disable mappings
local nomap = vim.keymap.del

nomap("n", "<C-n>")
nomap("n", "<C-c>")
nomap({ "n", "t" }, "<A-h>")
nomap("n", "<leader>fm")
