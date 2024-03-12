-- local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--

-- NOTE: terminal colors
vim.o.termguicolors = true

-- NOTE: UFO folding
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:󰤻,foldsep: ,foldclose:󰡌]]

-- NOTE: limit completion items
vim.opt.pumheight = 10

-- NOTE: relative line number
vim.wo.relativenumber = true

-- NOTE: remap the :w
vim.cmd "command! W write"

-- NOTE: ignore the smartcase
vim.cmd [[
set ignorecase smartcase
]]

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
  vim.o.guifont = "DankMono Nerd Font:h12"
  vim.g.neovide_transparency = 1
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_cursor_vfx_mode = "Railgun"
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_refresh_rate = 80
end
