local alpha = require("alpha")
require("alpha.term")
local dashboard = require("alpha.themes.dashboard")
local fortune = require("alpha.fortune")

-- Set header
dashboard.section.header.val = {
	"████████╗██╗  ██╗███████╗    ███████╗██╗    ██╗ █████╗ ███╗   ██╗",
	"╚══██╔══╝██║  ██║██╔════╝    ██╔════╝██║    ██║██╔══██╗████╗  ██║",
	"   ██║   ███████║█████╗      ███████╗██║ █╗ ██║███████║██╔██╗ ██ ",
	"   ██║   ██╔══██║██╔══╝      ╚════██║██║███╗██║██╔══██║██║╚██╗██║",
	"   ██║   ██║  ██║███████╗    ███████║╚███╔███╔╝██║  ██║██║ ╚████║",
	"   ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═══╝",
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
	button("g", "󰊢  > Git", "<cmd> Neogit <CR>"),
	button("c", "  > Copilot", function()
		require("CopilotChat").open({
			window = {
				layout = "replace",
				title = "Copilot Chat",
			},
		})
	end),
	button("p", "  > Last session", "<cmd> SessionRestore <CR>"),
	button("u", "  > Update plugins", "<cmd> Lazy update<CR>"),
	button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>"),
	button("q", "󰩈  > Quit NVIM", "<cmd> qa<CR>"),
}

dashboard.section.footer.val = fortune()

dashboard.section.header.opts.hl = "italic"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "italic"

-- ┌──────────────────────────────────────────────────────────┐
-- │                  /                                       │
-- │    header_padding                                        │
-- │                  \  ┌──────────────┐ ____                │
-- │                     │    header    │     \               │
-- │                  /  └──────────────┘      \              │
-- │ head_butt_padding                          \             │
-- │                  \                          occu_        │
-- │                  ┌────────────────────┐     height       │
-- │                  │       button       │    /             │
-- │                  │       button       │   /              │
-- │                  │       button       │  /               │
-- │                  └────────────────────┘‾‾                │
-- │                  /                                       │
-- │ foot_butt_padding                                        │
-- │                  \  ┌──────────────┐                     │
-- │                     │    footer    │                     │
-- │                     └──────────────┘                     │
-- │                                                          │
-- └──────────────────────────────────────────────────────────┘

local head_butt_padding = 5
local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.35))
local foot_butt_padding_ub = vim.o.lines - header_padding - occu_height - #dashboard.section.footer.val - 3
local foot_butt_padding = math.floor((vim.fn.winheight("$") - 1 * header_padding - occu_height))
foot_butt_padding = math.max(
	0,
	math.max(math.min(0, foot_butt_padding), math.min(math.max(0, foot_butt_padding), foot_butt_padding_ub))
)

dashboard.config.layout = {
	{ type = "padding", val = header_padding },
	dashboard.section.header,
	{ type = "padding", val = head_butt_padding },
	dashboard.section.buttons,
	{ type = "padding", val = foot_butt_padding },
	dashboard.section.footer,
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
