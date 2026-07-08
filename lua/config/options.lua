-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- LazyVim disables clipboard sync over SSH (it sets clipboard = "" when
-- $SSH_CONNECTION is set). Re-enable it: nvim >= 0.10 copies via OSC 52,
-- which tunnels through SSH/tmux (needs tmux `set -s set-clipboard on`).
vim.opt.clipboard = "unnamedplus"

-- Copy via OSC 52, but paste from nvim's own register instead of querying
-- the terminal (OSC 52 reads are often blocked/slow; tmux would answer
-- with its buffer anyway). To paste text copied outside nvim, use the
-- terminal's paste (cmd/ctrl+v).
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = function()
      return vim.split(vim.fn.getreg('"'), "\n")
    end,
    ["*"] = function()
      return vim.split(vim.fn.getreg('"'), "\n")
    end,
  },
}
