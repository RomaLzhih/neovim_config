-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Disable mappings
local nomap = vim.keymap.del

-- Enabled mappings
local map = vim.keymap.set

local function pos_leq(a, b)
  if a[1] ~= b[1] then
    return a[1] < b[1]
  end
  return a[2] <= b[2]
end

local function pos_lt(a, b)
  if a[1] ~= b[1] then
    return a[1] < b[1]
  end
  return a[2] < b[2]
end

local function find_closest_bracket_textobj()
  local cur = vim.api.nvim_win_get_cursor(0)
  local cursor_pos = { cur[1], cur[2] + 1 }
  local pairs = {
    { open = "\\V(", close = "\\V)", textobj = "(" },
    { open = "\\V[", close = "\\V]", textobj = "[" },
    { open = "\\V{", close = "\\V}", textobj = "{" },
    { open = "\\V<", close = "\\V>", textobj = "<" },
  }

  local best = nil
  local best_dist = nil

  for _, pair in ipairs(pairs) do
    vim.api.nvim_win_set_cursor(0, cur)
    local open_pos = vim.fn.searchpairpos(pair.open, "", pair.close, "bnW")
    if open_pos[1] > 0 then
      vim.api.nvim_win_set_cursor(0, { open_pos[1], open_pos[2] - 1 })
      local close_pos = vim.fn.searchpairpos(pair.open, "", pair.close, "nW")
      local open_ok = pos_lt(open_pos, cursor_pos)
      local close_ok = pos_leq(cursor_pos, close_pos)
      if close_pos[1] > 0 and open_ok and close_ok then
        local dist = (cursor_pos[1] - open_pos[1]) * 1000000 + (cursor_pos[2] - open_pos[2])
        if not best_dist or dist < best_dist then
          best = pair.textobj
          best_dist = dist
        end
      end
    end
  end

  vim.api.nvim_win_set_cursor(0, cur)
  return best
end

local function select_closest_bracket(kind)
  local best = find_closest_bracket_textobj()
  if not best then
    vim.notify("No surrounding bracket pair found", vim.log.levels.INFO)
    return
  end
  vim.cmd.normal({ args = { "v" .. kind .. best }, bang = true })
end

local function select_inside_closest_bracket()
  select_closest_bracket("i")
end

local function select_around_closest_bracket()
  select_closest_bracket("a")
end

local function operate_inside_closest_bracket(op)
  local best = find_closest_bracket_textobj()
  if not best then
    vim.notify("No surrounding bracket pair found", vim.log.levels.INFO)
    return
  end
  vim.cmd.normal({ args = { op .. "i" .. best }, bang = true })
end

-- NOTE: Command
map({ "n", "v", "x", "i" }, "<F1>", "<nop>", { desc = "remove help page" })
map("n", "<leader>cl", "<cmd> cclose <CR>", { desc = "close quickfix" })
map("n", "<leader>pp", "<cmd> cclose <CR>", { desc = "close quickfix" })
map("n", "<leader>op", "<cmd> bo copen 15 <CR>", { desc = "open quickfix" })
map("n", "<Tab>", "<cmd>bnext <CR>", { desc = "next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious <CR>", { desc = "next buffer" })
-- map("n", "s", "/", { desc = "search" })
map("n", "<C-p>", "g;", { desc = "jump to last edit" })
map(
  "n",
  "<leader>il",
  "<cmd> lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) <CR>",
  { desc = "toggle inlay hints" }
)

-- NOTE: system copy
map("n", "<leader>c", require("osc52").copy_operator, { expr = true })
-- map("n", "<leader>cc", "<leader>c_", { remap = true })
map("v", "<leader>c", require("osc52").copy_visual)

-- NOTE: Motion
map({ "n", "i", "v", "o" }, "<C-e>", "$", { desc = "End of line" })
map({ "n", "i", "v", "o" }, "<C-q>", "^", { desc = "Begining of line" })
map("n", "<A-Up>", "ddkP", { desc = "Move line up" })
map("n", "<A-Down>", "ddp", { desc = "Move line below" })
map("n", "<leader>ib", select_inside_closest_bracket, { desc = "Select inside closest bracket" })
map("n", "<leader>ab", select_around_closest_bracket, { desc = "Select around closest bracket" })
map("n", "<leader>cb", function()
  operate_inside_closest_bracket("c")
end, { desc = "Change inside closest bracket" })
map("n", "<leader>db", function()
  operate_inside_closest_bracket("d")
end, { desc = "Delete inside closest bracket" })
map("n", "<leader>yb", function()
  operate_inside_closest_bracket("y")
end, { desc = "Yank inside closest bracket" })

-- NOTE: edit
map("n", "<leader>hc", "yypk <BAR> <cmd>normal gcc <CR> <BAR> j", { desc = "Copy and Comment line" })
map("n", "<leader>tp", "<cmd>TransparentToggle<cr>", { desc = "toggle transparency" })

-- NOTE: async tasks
map("n", "<leader>ru", "<cmd>AsyncTaskEdit<CR>", { desc = "AsyncTaskEdit" })
map("n", "<leader>ol", "<cmd>AsyncTaskLast<CR>", { desc = "AsyncTaskLast" })
map("n", "<leader>st", "<cmd>AsyncStop<CR>", { desc = "AsyncStop" })
map("n", "<leader>ob", function()
  require("telescope").extensions.asynctasks.all()
end, { desc = "AsyncTasks" })

-- NOTE: Copilot chat
map({ "n", "v" }, "<leader>qc", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "CopilotChat - Quick chat" })
map({ "n", "v" }, "<C-a>", "<cmd>CopilotChatToggle<CR>", { desc = "CopilotChat - toggle" })
map({ "n", "v" }, "<leader>cexp", "<cmd>CopilotChatExplain<CR>", { desc = "CopilotChat - explain" })
map({ "n", "v" }, "<leader>crev", "<cmd>CopilotChatReview<CR>", { desc = "CopilotChat - review" })
map({ "n", "v" }, "<leader>copt", "<cmd>CopilotChatOptimize<CR>", { desc = "CopilotChat - optimize" })
map({ "n", "v" }, "<leader>ctest", "<cmd>CopilotChatTests<CR>", { desc = "CopilotChat - tests" })
map({ "n", "v" }, "<leader>cmt", "<cmd>CopilotChatCommit<CR>", { desc = "CopilotChat - commit" })
map({ "n", "v" }, "<leader>ccm", "<cmd>CopilotChatModels<CR>", { desc = "CopilotChat - models" })

-- NOTE: side kick
map({ "n" }, "yok", "<cmd>Sidekick nes toggle<CR>", { desc = "SideKick toggle" })

-- NOTE: terminal and buffer
-- map({ "n", "t" }, "<A-w>", "<cmd>ToggleTerm direction=float <CR>", { desc = "Toggle float term" })
map({ "n", "t" }, "<C-g>", "<cmd>ToggleTerm direction=float <CR>", { desc = "Toggle float term" })
map({ "n", "t" }, "<A-x>", "<cmd>ToggleTerm direction=horizontal size=20 <CR>", { desc = "Toggle horizontal term" })
map({ "n", "t" }, "<A-v>", "<cmd>ToggleTerm direction=vertical size=40 <CR>", { desc = "Toggle vertical term" })
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Switch Window left in terminal" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Switch Window right in terminal" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Switch Window down in terminal" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Switch Window up in terminal" })
map("n", "<C-h>", "<cmd>lua require('tmux').move_left()<cr>")
map("n", "<C-j>", "<cmd>lua require('tmux').move_bottom()<cr>")
map("n", "<C-k>", "<cmd>lua require('tmux').move_top()<cr>")
map("n", "<C-l>", "<cmd>lua require('tmux').move_right()<cr>")
map("n", "<A-h>", "<cmd>lua require('tmux').resize_left()<CR>", { desc = "tmux resize_left()" })
map("n", "<A-j>", "<cmd>lua require('tmux').resize_bottom()<CR>", { desc = "tmux resize_bottom()" })
map("n", "<A-k>", "<cmd>lua require('tmux').resize_top()<CR>", { desc = "tmux resize_top()" })
map("n", "<A-l>", "<cmd>lua require('tmux').resize_right()<CR>", { desc = "tmux resize_right()" })
map("i", "<C-h>", "<Left>", { noremap = true, silent = true })
map("i", "<C-j>", "<Down>", { noremap = true, silent = true })
map("i", "<C-k>", "<Up>", { noremap = true, silent = true })
map("i", "<C-l>", "<Right>", { noremap = true, silent = true })
map("i", "<C-f>", "<C-o>b", { noremap = true, silent = true })
map("i", "<C-d>", "<C-o>w", { noremap = true, silent = true })
map("n", "<leader>x", "<cmd>lua Snacks.bufdelete() <CR>", { desc = "Close buffer" })

-- NOTE: file manager
map("n", "<leader>ya", function()
  if vim.fn.has("win32") == 1 then
    require("oil").toggle_float()
  else
    vim.cmd("Yazi")
  end
end, { desc = "file manager toggle" })

map("n", "<C-s>", function()
  if vim.fn.has("win32") == 1 then
    require("oil").toggle_float()
  else
    vim.cmd("Yazi toggle")
  end
end, { desc = "file manager toggle" })

-- NOTE: format
map(
  "n",
  "<leader>fm",
  "<cmd>lua require('conform').format({ async = true, lsp_fallback = true }) <CR>",
  { desc = "conform formatting" }
)

map("n", "<leader>lg", function()
  require("snacks").lazygit()
end, { desc = "Open git window" })

-- NOTE: search and replace
map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

-- NOTE: lsp saga
map("n", "<leader>ic", "<cmd> Lspsaga incoming_calls <CR>", { desc = "lsp saga incoming calls" })
map("n", "<leader>oc", "<cmd> Lspsaga outgoing_calls <CR>", { desc = "lsp saga outgoing calls" })
-- map("n", "<leader>ca", "<cmd> lua vim.lsp.buf.code_action <CR>", { desc = "code action" })
map("n", "<leader>pd", "<cmd> Lspsaga peek_definition <CR>", { desc = "lsp saga peak definition" })
map("n", "<leader>pt", "<cmd> Lspsaga peek_type_definition <CR>", { desc = "lsp saga peak type definition" })
map("n", "<leader>fd", "<cmd> Lspsaga finder <CR>", { desc = "lsp saga finder" })
-- map("n", "<A-q>", "<cmd> Lspsaga outline <CR>", { desc = "lsp saga outline" })
map("n", "<leader>rn", "<cmd> Lspsaga rename <CR>", { desc = "lsp saga rename" })
map(
  "n",
  "<leader>wd",
  "<cmd> Lspsaga show_workspace_diagnostics <CR>",
  { desc = "lsp saga show workspace diagnostics" }
)
map("n", "<leader>sl", "<cmd> Lspsaga show_line_diagnostics <CR>", { desc = "lsp saga show line diagnostics" })
map("n", "K", function()
  require("pretty_hover").hover()
end, { desc = "lsp hover doc" })

-- NOTE: code action
map("n", "<leader>ca", function()
  require("tiny-code-action").code_action()
end, { desc = "lsp saga code action" })

-- NOTE: outline
map("n", "<A-q>", "<cmd> Outline <CR>", { desc = "lsp saga outline" })
map("n", "<A-e>", "<cmd> OutlineFocus <CR>", { desc = "lsp saga outline" })

-- NOTE: LSP motion
map("n", "gD", "<cmd> Trouble lsp_declarations <CR>", { desc = "LSP declaration" })
map("n", "gd", "<cmd> Trouble lsp_definitions <CR>", { desc = "LSP definitions" })
map("n", "gr", "<cmd> Trouble lsp_references <CR>", { desc = "LSP references" })
map("n", "gt", "<cmd> Trouble lsp_type_definitions <CR>", { desc = "LSP type definitions" })
map("n", "gi", "<cmd> Trouble lsp_implementations <CR>", { desc = "LSP implementations" })

--NOTE: diagnostics
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map(
  "n",
  "<leader>sb",
  "<cmd>Trouble diagnostics toggle filter.buf=0 auto_close=true<cr>",
  { desc = "Buffer Diagnostics (Trouble)" }
)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map(
  "n",
  "<leader>cc",
  "<cmd>Trouble quickfix toggle focus=true group=false win={size={height=0.3}}<cr>",
  { desc = "Quickfix List (Trouble)" }
)
-- map("n", "<leader>xs", "<cmd>Trouble symbol toggle focus=true<cr>", { desc = "Trouble Symbols (Trouble)" })

-- NOTE: summarize all todos
map(
  "n",
  "<leader>todo",
  "<cmd> Trouble todo filter = { tag={TODO}, ['not'] = { dirname = '.git'} }<cr>",
  { desc = "Show all TODOs" }
)

-- NOTE: wiki search
map("n", "<leader>id", "<cmd> ObsidianSearch <CR>", { desc = "Obsidian search" })

-- NOTE: finder
map("n", "<leader>fw", function()
  Snacks.picker.grep()
end, { desc = "grep" })

map("n", "<leader>bb", function()
  Snacks.picker.buffers()
end, { desc = "buffers" })

map("n", "<C-f>", function()
  Snacks.picker.git_files()
end, { desc = "files" })

map("n", "<A-w>", "<cmd>Telescope frecency workspace=CWD<cr>", { desc = "files" })

map("n", "<leader>his", function()
  Snacks.picker.notifications()
end, { desc = "notify history" })

map("n", "<leader>th", function()
  Snacks.picker.colorschemes({ preview = "" })
end, { desc = "colorschemes" })

map("n", "?", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "current buffer fuzzy" })

map("n", "<leader>gw", function()
  require("telescope.builtin").grep_string()
end, { desc = "Grep word under string" })

map("n", "<leader>fu", function()
  require("telescope.builtin").treesitter()
end, { desc = "live grep current buffer" })

-- NOTE: session
map("n", "<leader>wrs", "<cmd>SessionSearch<CR>", { desc = "Session search" })
map("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session" })

-- NOTE: zen mode
map("n", "<leader>cb", "<cmd>lua Snacks.zen.zen({width=90}) <CR>", { desc = "zen mode" })

-- NOTE: harpoon
local harpoon = require("harpoon")

map("n", "<leader>ha", function()
  harpoon:list():add()
end, { desc = "harpoon add" })

map("n", "<leader>hh", function()
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

map("n", "<C-[>", function()
  harpoon:list():prev()
end, { desc = "harpoon previous" })

map("n", "<C-]>", function()
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
