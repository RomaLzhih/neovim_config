local overrides = require("configs.overrides")
local flash_opt = require("configs.flash")
local has_neovide = vim.g.neovide

local plugins = {
	{
		"stevearc/overseer.nvim",
		opts = {},
		config = function()
			require("configs.overseer")
		end,
		lazy = false,
	},

	-- NOTE: fzf-like
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- NOTE: telescope frecency
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},

	-- NOTE: auto store sessions
	{
		"rmagatti/auto-session",
		lazy = false,
		dependencies = {
			"nvim-telescope/telescope.nvim", -- Only needed if you want to use session lens
		},
		opts = {
			auto_restore = false,
			auto_save = true,
			auto_create = true,
			bypass_save_filetypes = { "alpha", "dashboard", "copilot-chat", "Avante" }, -- or whatever dashboard you use
			session_lens = {
				load_on_setup = false,
			},
		},
	},

	-- NOTE: Lua
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			window = {
				width = 90,
				options = {
					relativenumber = true,
					cursorline = true,
					-- number = true,
				},
			},
		},
	},

	-- NOTE: target
	{
		"wellle/targets.vim",
		lazy = false,
	},

	-- NOTE: vim visual multi
	{
		"mg979/vim-visual-multi",
		lazy = false,
	},

	-- NOTE: use mini pair to complete the pair
	{
		"echasnovski/mini.pairs",
		version = "*",
		config = function()
			require("mini.pairs").setup()
			local map_tex = function()
				require("mini.pairs").map_buf(0, "i", "$", { action = "closeopen", pair = "$$" })
			end
			vim.api.nvim_create_autocmd("FileType", { pattern = { "markdown", "tex" }, callback = map_tex })
		end,
		lazy = false,
	},

	-- NOTE: disable auto pair
	{
		"windwp/nvim-autopairs",
		enable = false,
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

	-- NOTE: avante
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = true,
		opts = {
			-- provider = "copilot",
			provider = "gemini",
			-- provider = "claude",
			hints = { enabled = false },
			windows = {
				position = "bottom", -- the position of the sidebar
				width = 100, -- default % based on available width
				height = 50,
			},
		},
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
		},
	},

	-- NOTE: copilot chat
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		enable = function()
			return not vim.fn.has("win32")
		end,
		opts = {
			show_folds = false, -- Shows folds for sections in chat
			show_help = false, -- Shows help message as virtual lines when waiting for user input
			question_header = "󱜸 Question ", -- Header to use for user questions
			answer_header = " Copilot ", -- Header to use for AI answers
			error_header = " Error ", -- Header to use for errors
			window = {
				layout = "horizontal", -- or 'vertical'
				-- relative = "cursor",
				width = 1,
				height = 0.5,
				boarder = "rounded",
				row = 1,
			},
			mappings = {
				reset = {
					normal = "<C-A-l>",
					insert = "<C-A-l>",
				},
			},
		},
		lazy = false,
	},

	--NOTE: Yazi
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
	},

	-- NOTE: markdown render
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			file_types = { "markdown", "Avante", "copilot-chat" },
		},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		config = true,
		ft = { "markdown", "Avante", "copilot-chat" },
	},

	-- NOTE: nvim-obsidian
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- see below for full list of optional dependencies 👇
		},
		opts = {
			workspaces = {
				{
					name = "ziyang-obsidian",
					path = "~/Dropbox/work-flow/obsidian/ziyang-obsidian",
				},
			},
			ui = { enable = false },
		},
	},

	-- NOTE:trouble
	{
		"folke/trouble.nvim",
		opts = {
			auto_close = true,
			focus = true,
		}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		lazy = false,
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
		lazy = false,
	},

	-- NOTE: nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"nvimdev/lspsaga.nvim",
				cmd = "Lspsaga",
				config = function()
					require("lspsaga").setup({
						outline = {
							win_position = "left",
							win_width = 38,
							auto_preview = false,
						},
					})
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
		init = function() end,
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
		enable = false,
	},

	-- NOTE: telescope
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		opts = {
			defaults = {
				sorting_strategy = "descending",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						width = 0.7,
						preview_width = 0.4,
					},
				},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				winblend = 5,
			},
			pickers = {
				find_files = {
					layout_config = {
						horizontal = {
							width = 0.5,
							preview_width = 0,
						},
					},
				},
			},
			extensions = {
				frecency = {
					show_scores = true,
					sort = true,
					layout_config = {
						horizontal = {
							width = 0.5,
							preview_width = 0,
						},
					},
				},
			},
		},
	},

	-- NOTE: indent
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			-- indent = { tab_char = "▎" },
		},
		config = function()
			require("ibl").setup({
				scope = { show_start = false, show_end = false, show_exact_scope = false },
				indent = { char = "╏" },
			})
		end,

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
					max_delta = {
						-- Maximum distance for line movements. Set to `nil` to disable
						-- line = 150, ---@type number?
						-- Maximum distance for column movements. Set to `nil` to disable
						column = 0, ---@type number?
						-- Maximum duration for a movement (in ms). Automatically adjusts the line delay
						-- time = 500, ---@type number
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
		opts = {
			keywords = {
				PARA = {
					icon = "󰡱",
					color = "info",
				},
				HACK = { icon = " ", color = "warning", alt = { "VITAL" } },
			},
		},
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
				{ name = "copilot", priority = 0 },
			},
			mapping = {
				["<CR>"] = require("cmp").mapping({
					i = function(fallback)
						if require("cmp").visible() then
							require("cmp").confirm({ behavior = require("cmp").ConfirmBehavior.Replace, select = false })
						else
							fallback()
						end
					end,
					s = require("cmp").mapping.confirm({ select = true }),
					c = require("cmp").mapping.confirm({
						behavior = require("cmp").ConfirmBehavior.Replace,
						select = true,
					}),
				}),
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
}

return plugins
