local overrides = require("configs.overrides")

local plugins = {
	-- NOTE: nvim-neoclip
	{
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
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
		opts = {},
		lazy = false,
	},

	-- NOTE: neoscroll.nvim
	{
		"declancm/cinnamon.nvim",
		config = function()
			require("cinnamon").setup({
				extra_keymaps = true,
				override_keymaps = true,
				max_length = 500,
				-- scroll_limit = -1,
			})
		end,
		lazy = false,
	},

	-- NOTE: alpha-nvim
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
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

	-- NOTE: vim-easymotion
	{
		"easymotion/vim-easymotion",
		lazy = false,
	},

	-- NOTE: vim-visual-multi
	{
		"mg979/vim-visual-multi",
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
			-- local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- capabilities.textDocument.foldingRange = {
			-- 	dynamicRegistration = false,
			-- 	lineFoldingOnly = true,
			-- }
			-- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
			-- for _, ls in ipairs(language_servers) do
			-- 	require("lspconfig")[ls].setup({
			-- 		capabilities = capabilities,
			-- 		-- you can add other fields for setting up lsp server in this table
			-- 	})
			-- end
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
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "pylint" },
				cpp = { "clangtidy", "cpplint", "cppcheck" },
				bash = { "shellcheck" },
			}

			lint.linters.clangtidy.args = {
				"-extra-arg=-std=c++20",
			}

			-- lint.linters.cppcheck.args = {
			-- 	"--std=c++20",
			-- 	"--check-level=exhaustive",
			-- }

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			local ns = require("lint").get_namespace("my_linter_name")
			vim.diagnostic.config({ virtual_text = true }, ns)
		end,
	},

	-- NOTE: nvim-bqf
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},

	-- NOTE: hop
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			require("hop").setup({})
		end,
		init = function()
			-- place this in one of your configuration file(s)
			local hop = require("hop")
			local directions = require("hop.hint").HintDirection
			vim.keymap.set("", "f", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "F", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "t", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, hint_offset = -1, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "T", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, hint_offset = 1, current_line_only = true })
			end, { remap = true })
		end,
		lazy = true,
	},

	-- NOTE: Nvim-R
	{
		"jalvesaq/Nvim-R",
		config = function()
			R_assign = false
		end,
		lazy = false,
	},

	-- NOTE: vim latex
	{
		"lervag/vimtex",
		init = function()
			-- vim.g.vimtex_view_general_viewer = "sioyek"
			-- vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
			vim.g.vimtex_view_method = "sioyek"
			vim.g.vimtex_quickfix_open_on_warning = 0
			-- vim.cmd "let g:vimtex_compiler_latexmk = {'continuous':'0'}"
			vim.g.tex_use_latexmk = 0
			vim.api.nvim_exec(
				[[
        let s:pdflatex = 'pdflatex -file-line-error -interaction=nonstopmode ' .
              \ '-halt-on-error -synctex=1 -output-directory=%:h %'
        let s:latexmk = 'latexmk -pdf -output-directory=%:h %'
        
        function! s:TexToggleLatexmk() abort
          if g:tex_use_latexmk  
            let g:tex_use_latexmk = 0
          else  
            let g:tex_use_latexmk = 1
          endif
          call s:TexSetMakePrg()  
        endfunction
        
        function! s:TexSetMakePrg() abort
          if g:tex_use_latexmk
            let &l:makeprg = expand(s:latexmk)
          else
            let &l:makeprg = expand(s:pdflatex)
          endif
        endfunction
        
        nmap <localleader>tl <Plug>TexToggleLatexmk
        nnoremap <script> <Plug>TexToggleLatexmk <SID>TexToggleLatexmk
        nnoremap <SID>TexToggleLatexmk :call <SID>TexToggleLatexmk()<CR>
        ]],
				false
			)
			-- vim.g.vimtex_compiler_method = "pdflatex"
		end,
		lazy = false,
	},

	-- NOTE: surrounds
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
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
		lazy = false,
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
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "copilot" },
				{ name = "codeium" },
			},
		},
	},

	-- NOTE: neorg
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		cmd = "Neorg",
		-- tag = "*",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-cmp",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
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
}

return plugins
