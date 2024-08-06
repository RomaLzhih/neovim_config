local overrides = require("configs.overrides")
local flash_opt = require("configs.flash")
local has_neovide = vim.g.neovide

local plugins = {

	-- NOTE: better f/t jump
	{
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
				dim = true,
			})
		end,
		lazy = false,
	},

	-- NOTE:trouble
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		lazy = false,
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	-- NOTE: which key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			triggers = {
				{ "<leader>", mode = { "n", "v" } },
				{ "<localleader>", mode = { "n", "v" } },
			},
		},
		keys = { "<leader>", "<localleader>" },
	},
	-- NOTE: Multicursor:
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvimtools/hydra.nvim",
		},
		opts = {},
		cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
		lazy = false,
	},

	-- NOTE: Neogit
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
		lazy = false,
	},

	-- NOTE: better comment than buildin
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},

	-- NOTE: Search and replace
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup()
		end,
	},

	-- NOTE: better escape
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				default_mappings = false,
				mappings = {
					i = {
						j = {
							k = "<Esc>",
							j = "<Esc>",
						},
					},
					c = {
						j = {
							k = "<Esc>",
							j = "<Esc>",
						},
					},
					v = {
						j = {
							k = "<Esc>",
						},
					},
					s = {
						j = {
							k = "<Esc>",
						},
					},
				},
			})
		end,
		lazy = false,
	},

	-- NOTE: nvim-dap-ui
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	-- NOTE: mason-dap-ui
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},

	-- NOTE: dap
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("configs.dap")
		end,
	},

	-- NOTE: delete a buffer and close the window
	{
		"famiu/bufdelete.nvim",
		lazy = false,
	},

	-- NOTE: flash
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = flash_opt.opts,
		keys = flash_opt.keys,
	},

	-- NOTE: noice.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				config = function()
					require("notify").setup({
						render = "default",
						stages = "static",
					})
				end,
			},
		},
		config = function()
			require("configs.noice")
		end,
	},

	-- NOTE: nvim-neoclip
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("neoclip").setup({
				history = 100,
				content_spec_column = true,
				default_register = { '"', "+", "*" },
			})
		end,
		lazy = false,
	},

	-- NOTE: harpoon
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			require("configs.harpoon")
		end,
	},

	-- NOTE: before.nvim
	{
		"bloznelis/before.nvim",
		cmd = "Before",
		config = function()
			local before = require("before")
			before.setup()
		end,
		lazy = false,
	},

	-- NOTE: detect indent
	{
		"tpope/vim-sleuth",
		lazy = false,
	},

	-- NOTE: center buffer
	{
		"shortcuts/no-neck-pain.nvim",
		cmd = "NoNeckPain",
		config = function()
			require("no-neck-pain").setup()
		end,
		version = "*",
		lazy = true,
	},

	-- NOTE: nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"nvimdev/lspsaga.nvim",
				cmd = "Lspsaga",
				config = function()
					require("lspsaga").setup({})
				end,
			},
		},
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- NOTE: mason
	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	-- NOTE: tmux.nvim
	{
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup({
				navigation = {
					enable_default_keybindings = false,
				},
			})
		end,
		init = function()
			vim.keymap.set("n", "<C-A-h>", [[<cmd>lua require("tmux").move_left()<cr>]])
			vim.keymap.set("n", "<C-A-j>", [[<cmd>lua require("tmux").move_bottom()<cr>]])
			vim.keymap.set("n", "<C-A-k>", [[<cmd>lua require("tmux").move_top()<cr>]])
			vim.keymap.set("n", "<C-A-l>", [[<cmd>lua require("tmux").move_right()<cr>]])
		end,
		lazy = false,
	},

	-- NOTE: nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	-- NOTE: nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- NOTE: telescope
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
	},

	-- NOTE: indent
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			scope = { show_start = false, show_end = false, show_exact_scope = false },
			indent = { tab_char = "▎" },
		},

		lazy = false,
	},

	-- NOTE: neoscroll.nvim
	{
		"declancm/cinnamon.nvim",
		config = function()
			require("cinnamon").setup({
				keymaps = {
					-- Enable the provided 'basic' keymaps
					basic = true,
					-- Enable the provided 'extra' keymaps
					extra = true,
				},
				---@class ScrollOptions
				options = {
					-- Post-movement callback
					callback = nil, ---@type function?
					-- Delay between each movement step (in ms)
					delay = 7,
					max_delta = {
						-- Maximum distance for line movements. Set to `nil` to disable
						line = 150, ---@type number?
						-- Maximum distance for column movements. Set to `nil` to disable
						column = 0, ---@type number?
						-- Maximum duration for a movement (in ms). Automatically adjusts the line delay
						time = 500, ---@type number
					},
				},
			})
		end,
		lazy = has_neovide ~= nil,
	},

	-- NOTE: alpha-nvim
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.alpha-nvim")
		end,
		lazy = false,
	},

	-- NOTE: mini.cursorword
	{
		"echasnovski/mini.cursorword",
		version = "*",
		config = function()
			require("mini.cursorword").setup()
		end,
		lazy = false,
	},

	-- NOTE: todo-comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		lazy = false,
	},

	-- NOTE: nvim-ufo
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						relculright = true,
						segments = {
							{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
							{ text = { "%s" }, click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						},
					})
				end,
			},
		},
		event = "BufReadPost",
		config = function()
			require("ufo").setup()
		end,

		init = function()
			vim.keymap.set("n", "zR", function()
				require("ufo").openAllFolds()
			end)
			vim.keymap.set("n", "zM", function()
				require("ufo").closeAllFolds()
			end)
		end,
	},

	-- NOTE: conform
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "black" },
					cpp = { "clang-format" },
					bash = { "beautysh" },
					shell = { "shfmt" },
					sh = { "shfmt" },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
		lazy = false,
	},

	-- NOTE: Nvim-lint
	{
		"mfussenegger/nvim-lint",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
		config = function()
			require("configs.nvim-lint")
		end,
	},

	-- NOTE: nvim-bqf
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},

	-- NOTE: Nvim-R
	{
		"jalvesaq/Nvim-R",
		ft = { "rmd", "r" },
		config = function()
			R_assign = false
		end,
	},

	-- NOTE: vim latex
	{
		"lervag/vimtex",
		ft = { "tex", "bib" },
		init = function()
			require("configs.vimtex")
		end,
		lazy = false,
	},

	-- NOTE: surrounds
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- NOTE: mark
	{
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({})
		end,
		lazy = false,
	},

	-- NOTE: rainbow_csv
	{
		ft = { "csv" },
		"mechatroner/rainbow_csv",
	},

	-- NOTE: copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
				filetypes = {
					markdown = false,
					norg = false,
					csv = false,
				},
			})
		end,
	},

	-- NOTE: Codium
	{
		"Exafunction/codeium.nvim",
		cmd = "Codeium",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
		enable = function()
			return not vim.fn.has("win32")
		end,
		lazy = function()
			return vim.fn.has("win32")
		end,
	},

	-- NOTE: configure cmp with copilot
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
		opts = {
			sources = {
				{ name = "nvim_lsp", priority = 10 },
				{ name = "luasnip", priority = 9 },
				{ name = "buffer", priority = 9 },
				{ name = "nvim_lua", priority = 9 },
				{ name = "path", priority = 8 },
				{ name = "codeium", priority = 0 },
				{ name = "copilot", priority = 0 },
			},
		},
	},

	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- We'd like this plugin to load first out of the rest
		config = true, -- This automatically runs `require("luarocks-nvim").setup()`
	},

	-- NOTE: neorg
	{
		"nvim-neorg/neorg",
		cmd = "Neorg",
		-- build = ":Neorg sync-parsers",
		version = "*",
		dependencies = {
			"luarocks.nvim",
		},
		config = function()
			require("configs.neorg")
		end,
	},

	-- NOTE: Themes
	{
		"morhetz/gruvbox",
		config = function()
			vim.g.gruvbox_contrast_dark = "medium"
			-- vim.cmd.colorscheme "gruvbox"
		end,
	},

	{
		"rebelot/kanagawa.nvim",
	},

	{
		"nordtheme/vim",
		propritery = 1000,
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {},
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
	},

	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}

return plugins
