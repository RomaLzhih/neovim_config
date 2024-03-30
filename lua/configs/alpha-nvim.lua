local alpha = require("alpha")
require("alpha.term")
local dashboard = require("alpha.themes.dashboard")
local fortune = require("alpha.fortune")

-- Set header
dashboard.section.header.val = {

	"██╗  ██╗███████╗██╗     ██╗      ██████╗        ██╗    ██╗ ██████╗ ██████╗ ██╗     ██████╗",
	"██║  ██║██╔════╝██║     ██║     ██╔═══██╗       ██║    ██║██╔═══██╗██╔══██╗██║     ██╔══██╗",
	"███████║█████╗  ██║     ██║     ██║   ██║       ██║ █╗ ██║██║   ██║██████╔╝██║     ██║  ██║",
	"██╔══██║██╔══╝  ██║     ██║     ██║   ██║       ██║███╗██║██║   ██║██╔══██╗██║     ██║  ██║",
	"██║  ██║███████╗███████╗███████╗╚██████╔╝▄█╗    ╚███╔███╔╝╚██████╔╝██║  ██║███████╗██████╔╝",
	"╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝",
}

local function button(sc, txt, keybind, keybind_opts)
	local b = dashboard.button(sc, txt, keybind, keybind_opts)
	b.opts.hl = "AlphaButtons"
	b.opts.hl_shortcut = "italic"
	return b
end

-- Set menu
dashboard.section.buttons.val = {
	button("f", "󰮗  > Find file", "<cmd> Telescope find_files<CR>"),
	button("r", "  > Recent", "<cmd> Telescope oldfiles<CR>"),
	button("i", "󱓷  > Wiki", "<cmd> Neorg index<CR>"),
	button("u", "  > Update plugins", "<cmd> Lazy update<CR>"),
	button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
	button("q", "󰩈  > Quit NVIM", "<cmd> qa<CR>"),
}

dashboard.section.footer.val = fortune()

dashboard.section.header.opts.hl = "italic"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "italic"

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
