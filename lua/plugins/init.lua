local overrides = require("configs.overrides")
local flash_opt = require("configs.flash")
local has_neovide = vim.g.neovide

return {
	-- NOTE: last place
	{ "farmergreg/vim-lastplace", lazy = false },

	-- NOTE: snackes.nvim
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			input = { enabled = true },
			scroll = {
				enabled = true,
				filter = function(buf)
					return vim.g.snacks_scroll ~= false
						and vim.b[buf].snacks_scroll ~= false
						and vim.bo[buf].buftype ~= "terminal"
						and vim.bo[buf].buftype ~= "prompt"
				end,
			},
			zen = {
				enabled = true,
				win = { style = { width = 90 } },
				toggles = { dim = false, diagnostics = true, inlay_hints = true },
			},
			bufdelete = { enabled = true },
			animate = { enabled = true },
		},
	},

	-- NOTE: oil
	{
		"stevearc/oil.nvim",
		opts = {
			float = {
				padding = 2,
				max_width = 82,
				max_height = 30,
				override = function(conf)
					return conf
				end,
			},
			keymaps = {
				["l"] = "actions.select",
				["q"] = { "actions.close", mode = "n" },
				["h"] = { "actions.parent", mode = "n" },
			},
		},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		lazy = false,
	},

	-- NOTE: enable nvim copy to system clipboard
	{ "ojroques/nvim-osc52", lazy = false },

	-- NOTE: treesitter based incremental selection
	{
		"RRethy/nvim-treesitter-textsubjects",
		config = function()
			require("nvim-treesitter.configs").setup({
				textsubjects = {
					enable = true,
					prev_selection = ",", -- (Optional) keymap to select the previous selection
					keymaps = {
						["."] = "textsubjects-smart",
						[";"] = "textsubjects-container-outer",
						["i;"] = {
							"textsubjects-container-inner",
							desc = "Select inside containers (classes, functions, etc.)",
						},
					},
				},
			})
		end,
		lazy = false,
	},

	-- NOTE: enable treesitter for text object select
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						look = true,
						include_surrounding_whitespace = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["ac"] = "@conditional.outer",
							["ic"] = "@conditional.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next = {
							["]f"] = "@function.outer",
							["]l"] = "@loop.outer",
							["]c"] = "@conditional.outer",
						},
						goto_previous = {
							["[f"] = "@function.outer",
							["[l"] = "@loop.outer",
							["[c"] = "@conditional.outer",
						},
					},
				},
			})
		end,
		lazy = false,
	},

	-- NOTE: unipaired
	{
		"tummetott/unimpaired.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- NOTE: key-analyzer
	{ "meznaric/key-analyzer.nvim", lazy = true, opts = {} },

	-- NOTE: overseer
	{
		"stevearc/overseer.nvim",
		opts = {},
		config = function()
			require("configs.overseer")
		end,
		lazy = false,
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

	-- NOTE: target
	{
		"wellle/targets.vim",
		lazy = false,
	},

	-- NOTE: vim visual multi
	{
		"mg979/vim-visual-multi",
		lazy = true,
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
		enabled = false,
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
		lazy = false,
		build = "make BUILD_FROM_SOURCE=true",
		enabled = function()
			return vim.fn.has("win32") == 0
		end,
		opts = {
			-- provider = "gemini",
			provider = "copilot",
			-- copilot = {
			-- 	model = "claude-3-5-sonnet-20241022",
			-- },
			auto_suggestions_provider = "copilot",
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
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		-- enabled = function()
		-- 	return vim.fn.has("win32") == 0
		-- end,
		model = "claude-3.5-sonnet",
		opts = {
			show_folds = false, -- Shows folds for sections in chat
			show_help = false, -- Shows help message as virtual lines when waiting for user input
			question_header = "󱜸 Question ", -- Header to use for user questions
			answer_header = " Copilot ", -- Header to use for AI answers
			error_header = " Error ", -- Header to use for errors
			window = {
				layout = "float",
				width = 0.618,
				height = 0.618,
				-- layout = "horizontal", -- or 'vertical'
				-- relative = "cursor",
				-- width = 1,
				-- height = 0.5,
				boarder = "rounded",
				-- row = 1,
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
			auto_jump = true,
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
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			{
				"folke/neodev.nvim",
				opts = {
					library = { plugins = { "nvim-dap-ui" }, types = true },
				},
			},
		},
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
						-- stages = "static",
						minimum_width = 30,
						timeout = 3000,
					})
				end,
			},
		},
		config = function()
			require("configs.noice")
		end,
	},

	{
		"gbprod/yanky.nvim",
		dependencies = {
			{ "kkharji/sqlite.lua" },
		},
		opts = {
			ring = { storage = "sqlite" },
		},
		keys = {
			{
				"<leader>yk",
				function()
					require("telescope").extensions.yank_history.yank_history({})
				end,
				desc = "Open Yank History",
			},
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
			{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
			{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
		},
		enabled = function()
			return vim.fn.has("win32") == 0
		end,
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

	-- NOTE: nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"nvimdev/lspsaga.nvim",
				cmd = "Lspsaga",
				config = function()
					require("lspsaga").setup({
						definition = {
							width = 0.95,
							height = 0.5,
						},
						outline = {
							win_position = "left",
							win_width = 38,
							auto_preview = false,
						},
						lightbulb = {
							enabled = false,
						},
					})
				end,
			},
		},
		opts = {
			inlay_hints = {
				enable = true,
			},
			settings = {
				clangd = {
					hint = { enable = true },
					InlayHints = {
						Designators = true,
						Enabled = true,
						ParameterNames = true,
						DeducedTypes = true,
					},
					fallbackFlags = { "-std=c++20" },
				},
			},
		},
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
			-- vim.diagnostic.config({ virtual_text = false })
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
					cycle_navigation = false,
					redirect_to_clipboard = true,
					sync_clipboard = false,
					enable_default_keybindings = false,
				},
			})
		end,
		init = function() end,
		lazy = false,
	},

	-- NOTE: nvim-treesitter
	{
		run = ":TSUpdate",
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	-- NOTE: nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
		enabled = false,
	},

	-- NOTE: telescope
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		config = function()
			if vim.fn.has("win32") == 0 then
				require("telescope").load_extension("yank_history")
			end
			require("telescope").setup({
				defaults = {
					sorting_strategy = "descending",
					layout_config = {
						horizontal = {
							prompt_position = "bottom",
							width = 0.7,
							preview_width = 0.4,
						},
					},
					file_ignore_patterns = {
						".git/",
						".cache",
						"%.o",
						"%.a",
						"%.out",
						"%.class",
						"%.pdf",
						"%.mkv",
						"%.mp4",
						"%.zip",
					},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					winblend = 5,
				},
				pickers = {
					find_files = {
						layout_config = {
							horizontal = {
								width = { 0.382, max = 80, min = 60 }, -- width = 0.382,
								preview_width = 0,
							},
						},
					},
					recent_files = {
						layout_config = {
							horizontal = {
								width = { 0.382, max = 80, min = 60 }, -- width = 0.382,
								preview_width = 0,
							},
						},
					},
					buffers = {
						layout_config = {
							horizontal = {
								width = { 0.382, max = 80, min = 60 }, -- width = 0.382,
								preview_width = 0,
							},
						},
					},
				},
			})
		end,
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
			-- {
			-- 	"luukvbaal/statuscol.nvim",
			-- 	config = function()
			-- 		local builtin = require("statuscol.builtin")
			-- 		require("statuscol").setup({
			-- 			relculright = true,
			-- 			segments = {
			-- 				{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
			-- 				{ text = { "%s" }, click = "v:lua.ScSa" },
			-- 				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
			-- 			},
			-- 		})
			-- 	end,
			-- },
			-- {
			-- 	"yaocccc/nvim-foldsign",
			-- 	event = "CursorHold",
			-- 	lazy = false,
			-- 	config = function()
			-- 		require("nvim-foldsign").setup({
			-- 			offset = -2,
			-- 			foldsigns = {
			-- 				open = "󰤻", -- mark the beginning of a fold
			-- 				close = "󰡌", -- show a closed fold
			-- 				-- open = "",
			-- 				-- close = "",
			-- 				seps = { "" }, -- open fold middle marker
			-- 			},
			-- 		})
			-- 	end,
			-- },
		},
		event = "BufReadPost",
		config = function()
			require("configs.ufo")
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
	--
	{
		"R-nvim/R.nvim",
		-- Only required if you also set defaults.lazy = true
		lazy = false,
		ft = { "rmd", "r" },
		-- R.nvim is still young and we may make some breaking changes from time
		-- to time. For now we recommend pinning to the latest minor version
		-- like so:
		version = "~0.1.0",
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
			"zbirenbaum/copilot-cmp",
			config = function()
				require("copilot_cmp").setup()
			end,
		},
		opts = {
			sources = {
				{ name = "nvim_lsp", priority = 11 },
				{ name = "copilot", priority = 10 },
				-- { name = "nvim_lsp_signature_help", priority = 9 },
				{ name = "luasnip", priority = 9 },
				{ name = "buffer", priority = 8 },
				{ name = "nvim_lua", priority = 7 },
				{ name = "path", priority = 6 },
				{ name = "nvim_lsp_document_symbol", priority = 0 },
			},
			mapping = require("cmp").mapping({
				["<C-e>"] = require("cmp").mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
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
