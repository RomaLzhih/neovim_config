local neorg = require("neorg")
local indent_value = 2

neorg.setup({
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.concealer"] = {
			config = {
				icons = {
					code_block = { conceal = true },
				},
			},
		},                -- Adds pretty icons to your documents
		["core.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					notes = "~/Dropbox/work-flow/notes",
				},
				default_workspace = "notes",
			},
		},
		["core.completion"] = {
			config = { engine = "nvim-cmp", name = "[Norg]" },
		},
		["core.integrations.nvim-cmp"] = {},
		["core.keybinds"] = {
			-- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
			config = {
				default_keybinds = true,
				hook = function(keybinds)
					keybinds.map(
						"norg",
						"n",
						"<leader>lg",
						"<cmd>Neorg keybind all core.looking-glass.magnify-code-block <CR>"
					)
				end,
			},
		},
		["core.esupports.indent"] = {
			config = {
				indents = {
					_ = { indent = indent_value },
					heading1 = { indent = 0 * indent_value },
					heading2 = { indent = 1 * indent_value },
					heading3 = { indent = 2 * indent_value },
					heading4 = { indent = 3 * indent_value },
					heading5 = { indent = 4 * indent_value },
					heading6 = { indent = 5 * indent_value },
					paragraph_segment = { indent = 2 * indent_value },
					ranged_tag = { indent = 2 * indent_value },
					ranged_tag_content = { indent = 2 * indent_value },
					strong_paragraph_delimiter = { indent = 2 * indent_value },
				},
			},
		},
	},
	["core.integrations.treesitter"] = {
		configure_parsers = true,
		indent = {
			-- Set your preferred indent size (e.g., 4 spaces)
			indent_length = 4,
		},
	},
	["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
	["core.qol.toc"] = {},
	["core.qol.todo_items"] = {},
	["core.looking-glass"] = {},
	["core.presenter"] = { config = { zen_mode = "zen-mode" } },
	["core.export"] = {},
	["core.export.markdown"] = { config = { extensions = "all" } },
	["core.summary"] = {},
	["core.tangle"] = { config = { report_on_empty = false } },
	["core.ui.calendar"] = {},
	["core.journal"] = {
		config = {
			strategy = "flat",
			workspace = "Notes",
		},
	},
})
