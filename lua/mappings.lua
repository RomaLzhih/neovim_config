require("nvchad.mappings")

-- Disable mappings
local nomap = vim.keymap.del
nomap("n", "<C-c>")
nomap("n", "<leader>h")
nomap("n", "<leader>v")

-- Enabled mappings
local map = vim.keymap.set

-- NOTE: Command
map({ "n", "v", "x", "i" }, "q:", "<nop>", { desc = "remove command history" })
map({ "n", "v", "x", "i" }, "w:", "<nop>", { desc = "remove command history" })
map({ "n", "v", "x", "i" }, "<F1>", "<nop>", { desc = "remove help page" })
map("n", "<leader>cl", "<cmd> cclose <CR>", { desc = "close quickfix" })

-- NOTE: Motion
map({ "n", "i", "v", "o" }, "<C-e>", "<END>", { desc = "End of line" })
map({ "n", "i", "v", "o" }, "<C-q>", "<HOME>", { desc = "Begining of line" })
map("n", "<A-Up>", "ddkP", { desc = "Move line up" })
map("n", "<A-Down>", "ddp", { desc = "Move line below" })

-- NOTE: edit
map("n", "<C-a>", "ggVG <CR>", { desc = "Select all" })
map("n", "<leader>spell", "<cmd> set spell! <CR>", { desc = "Toggle spell check" })
map({ "n", "v" }, "<C-n>", "<cmd>MCstart<cr>", { desc = "vm find word" })
map("n", "<leader>hh", "yypk <BAR> <cmd>normal gcc <CR> <BAR> j", { desc = "Copy and Comment line" })

-- NOTE: Nvim tree
-- map("n", "<A-e>", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })

-- NOTE: Yazi
map("n", "<A-u>", "<cmd>Yazi cwd<CR>", { desc = "Open the file manager in nvim's working directory" })
map("n", "<A-y>", "<cmd>Yazi<CR>", { desc = "Open Yazi at the current file" })
map("n", "<C-w>", "<cmd>Yazi toggle<CR>", { desc = "Resume Last yazi session" })

-- NOTE: Copilot chat
map("n", "<leader>cc", function()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
	end
end, { desc = "CopilotChat - Quick chat" })
map("n", "<A-b>", "<cmd>CopilotChatToggle<CR>", { desc = "CopilotChat - toggle" })
map("n", "<leader>cs", "<cmd>CopilotChatStop<CR>", { desc = "CopilotChat - stop" })
map("n", "<leader>cexp", "<cmd>CopilotChatExplain<CR>", { desc = "CopilotChat - explain" })
map("n", "<leader>crev", "<cmd>CopilotChatReview<CR>", { desc = "CopilotChat - review" })
map("n", "<leader>copt", "<cmd>CopilotChatOptimize<CR>", { desc = "CopilotChat - optimize" })
map("n", "<leader>cdoc", "<cmd>CopilotChatdocs<CR>", { desc = "CopilotChat - docs" })
map("n", "<leader>cfd", "<cmd>CopilotChatFixDiagnostic<CR>", { desc = "CopilotChat - fix diagnostic" })
map("n", "<leader>ctest", "<cmd>CopilotChatTests<CR>", { desc = "CopilotChat - tests" })
map("n", "<leader>cmt", "<cmd>CopilotChatCommit<CR>", { desc = "CopilotChat - commit" })

-- NOTE: Avante
map({ "n", "v" }, "<A-e>", function()
	require("avante.api").ask()
end, { desc = "avante ask" })

map({ "n", "v" }, "<A-r>", function()
	require("avante.api").refresh()
end, { desc = "avante refresh" })

-- NOTE: terminal and buffer
map({ "n", "t" }, "<A-w>", function()
	require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm", size = 0.3 })
end, { desc = "Toggle horizontal term" })
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Switch Window left in terminal" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Switch Window right in terminal" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Switch Window down in terminal" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Switch Window up in terminal" })
map("n", "<A-h>", "<cmd>lua require('tmux').resize_left()<CR>", { desc = "tmux resoze_left()" })
map("n", "<leader>bd", "<cmd> Bdelete <CR> <BAR> <cmd> q <CR>", { desc = "Close buffer and split window" })

-- NOTE: format
map(
	"n",
	"<leader>fm",
	"<cmd>lua require('conform').format({ async = true, lsp_fallback = true }) <CR>",
	{ desc = "conform formatting" }
)

-- NOTE: Neogit
map("n", "<leader>git", "<cmd> Neogit <CR>", { desc = "Open git window" })
map("n", "<leader>diff", "<cmd> Neogit diff <CR>", { desc = "Open diff view" })

-- NOTE: search and replace
map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})

-- NOTE: lsp saga
map("n", "<leader>ic", "<cmd> Lspsaga incoming_calls <CR>", { desc = "lsp saga incoming calls" })
map("n", "<leader>oc", "<cmd> Lspsaga outgoing_calls <CR>", { desc = "lsp saga outgoing calls" })
map("n", "<leader>ca", "<cmd> Lspsaga code_action <CR>", { desc = "lsp saga code action" })
map("n", "<leader>pd", "<cmd> Lspsaga peek_definition <CR>", { desc = "lsp saga peak definition" })
map("n", "<leader>pt", "<cmd> Lspsaga peek_type_definition <CR>", { desc = "lsp saga peak type definition" })
map("n", "<leader>fd", "<cmd> Lspsaga finder <CR>", { desc = "lsp saga finder" })
map("n", "<leader>ol", "<cmd> Lspsaga outline <CR>", { desc = "lsp saga outline" })
map("n", "<leader>rn", "<cmd> Lspsaga rename <CR>", { desc = "lsp saga rename" })
map(
	"n",
	"<leader>sw",
	"<cmd> Lspsaga show_workspace_diagnostics <CR>",
	{ desc = "lsp saga show workspace diagnostics" }
)
-- map("n", "<leader>sb", "<cmd> Lspsaga show_buf_diagnostics <CR>", { desc = "lsp saga show buffer diagnostics" })
map("n", "<leader>sl", "<cmd> Lspsaga show_line_diagnostics <CR>", { desc = "lsp saga show line diagnostics" })
map("n", "K", "<cmd> Lspsaga hover_doc <CR>", { desc = "lsp hover doc" })

-- NOTE: LSP motion
map("n", "gD", "<cmd> Trouble lsp_declarations <CR>", { desc = "LSP declaration" })
map("n", "gd", "<cmd> Trouble lsp_definitions <CR>", { desc = "LSP definitions" })
map("n", "gr", "<cmd> Trouble lsp_references <CR>", { desc = "LSP references" })
map("n", "gt", "<cmd> Trouble lsp_type_definitions <CR>", { desc = "LSP type definitions" })
map("n", "gi", "<cmd> Trouble lsp_implementations <CR>", { desc = "LSP implementations" })

--NOTE: diagnostics
map("n", "<leader>xx", "<cmd>Trouble diagnotics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>sb", "<cmd>Trouble diagnotics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
map("n", "<leader>xs", "<cmd>Trouble symbol toggle focus=true<cr>", { desc = "Trouble Symbols (Trouble)" })

-- NOTE: summarize all todos
map("n", "<leader>todo", "<cmd> Trouble todo filter = {tag={TODO}}<cr>", { desc = "Show all TODOs" })

-- NOTE: neorg
map("n", "<leader>id", "<cmd> Neorg index <CR>", { desc = "Neorg open index" })
map("n", "<leader>rt", "<cmd> Neorg return <CR>", { desc = "Neorg return to work" })

-- NOTE: telescope
map("n", "<leader>yk", "<cmd> Telescope neoclip <CR>", { desc = "neclip copy" })

-- NOTE: center buffer
map("n", "<leader>cb", "<cmd> NoNeckPain <CR>", { desc = "center buffer" })
map("n", "<leader>cn", function()
	local number = vim.fn.input("Enter the buffer width: ")
	if tonumber(number) then
		require("no-neck-pain").resize(number)
	else
		print("Invalid input. Please enter a valid number.")
	end
end, { desc = "center buffer" })

-- NOTE: harpoon
local harpoon = require("harpoon")

map("n", "<leader>ha", function()
	harpoon:list():add()
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

map("n", "<leader>ht", function()
	harpoon:list():select(5)
end, { desc = "harpoon select 5" })

map("n", "<C-A-p>", function()
	harpoon:list():prev()
end, { desc = "harpoon previous" })

map("n", "<C-A-n>", function()
	harpoon:list():next()
end, { desc = "harpoon next" })

-- NOTE: debug
map("n", "<leader>B", function()
	require("dap").toggle_breakpoint()
end, { desc = "debug: toggle breakpoint" })

map("n", "<leader>go", function()
	require("dap").continue()
end, { desc = "debug: launch debugging sesstion" })

map("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "debug: step over" })

map("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "debug: step into" })

map("n", "<leader>dl", function()
	require("dap").run_last()
end, { desc = "debug: run last" })

map("n", "<leader>dh", function()
	require("dap").hover()
end, { desc = "debug: hover" })

map("n", "<leader>dp", function()
	require("dap").preview()
end, { desc = "debug: preview" })

map("n", "<leader>dt", function()
	require("dapui").close()
end, { desc = "dap ui toggle" })

map(
	"n",
	"<leader>dc",
	'<cmd>lua require("dap").terminate() <CR> <BAR> <cmd>lua require("dapui").close() <CR>',
	{ desc = "debug: terminate and close" }
)
