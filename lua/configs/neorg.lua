local neorg = require("neorg")

neorg.setup({
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.concealer"] = {
			config = {
				icons = {
					code_block = { conceal = true },
				},
			},
		}, -- Adds pretty icons to your documents
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
					keybinds.map("norg", "n", "lg", ":Neorg keybind all core.looking-glass.magnify-code-block")
				end,
			},
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
