-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
-- local overrides = require("configs.overrides")
-- local flash_opt = require("configs.flash")
local has_neovide = vim.g.neovide
return {
  {
    "lewis6991/gitsigns.nvim",
    enabled = false,
  },

  -- NOTE: bufferline
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        diagnostics_indicator = false,
      },
    },
  },

  -- NOTE: remember color
  { "raddari/last-color.nvim" },

  -- NOTE: terminal support
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {--[[ things you want to change go here]]
    },
  },

  {
    -- NOTE: oil
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
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ["l"] = "actions.select",
        ["q"] = { "actions.close", mode = "n" },
        ["h"] = { "actions.parent", mode = "n" },
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    lazy = false,
  },

  -- NOTE: snipe
  {
    "leath-dub/snipe.nvim",
    opts = {
      ui = {
        position = "center",
        open_win_override = {
          border = "rounded",
        },
      },
    },
    keys = {
      {
        "<leader>ss",
        function()
          require("snipe").open_buffer_menu()
        end,
        desc = "Open Snipe buffer menu",
      },
    },
    lazy = false,
  },

  -- NOTE: leetcode
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Leet",
    opts = {
      -- configuration goes here
      injector = { ---@type table<lc.lang, lc.inject>
        ["cpp"] = {
          before = { "#include <bits/stdc++.h>", "using namespace std;" },
          after = "int main() { return 0; }",
        },
      },
    },
    lazy = true,
  },

  -- NOTE: last place
  { "farmergreg/vim-lastplace", lazy = false },

  -- --NOTE: Yazi
  -- {
  --   "mikavilpas/yazi.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     open_for_directories = false,
  --     keymaps = {
  --       show_help = "<f1>",
  --     },
  --   },
  -- },

  -- NOTE: enable nvim copy to system clipboard
  { "ojroques/nvim-osc52", lazy = false },

  -- NOTE: treesitter based incremental selection
  {
    "RRethy/nvim-treesitter-textsubjects",
    ft = { "cpp", "c", "python", "lua", "r", "rmd" },
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
  },

  -- NOTE: enable treesitter for text object select
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
    ft = { "cpp", "c", "python", "lua", "r", "rmd" },
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
  },

  -- NOTE: unipaired
  {
    "tummetott/unimpaired.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- NOTE: key-analyzer
  { "meznaric/key-analyzer.nvim", lazy = true, opts = {} },

  -- NOTE: auto store sessions
  {
    "rmagatti/auto-session",
    lazy = false,
    -- dependencies = {
    --   "nvim-telescope/telescope.nvim", -- Only needed if you want to use session lens
    -- },
    opts = {
      auto_restore = false,
      auto_save = true,
      auto_create = true,
      bypass_save_filetypes = { "alpha", "dashboard", "copilot-chat", "Avante", "snacks_dashboard" }, -- or whatever dashboard you use
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

  -- -- NOTE: vim visual multi
  -- {
  -- 	"mg979/vim-visual-multi",
  -- 	lazy = true,
  -- },

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

  -- -- NOTE: copilot
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = { enabled = false, auto_trigger = false, auto_accept = false },
  --       panel = { enabled = false },
  --       filetypes = {
  --         markdown = false,
  --         norg = false,
  --         csv = false,
  --       },
  --     })
  --   end,
  -- },

  -- NOTE: avante
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    build = "make",
    enabled = function()
      return vim.fn.has("win32") == 0
    end,
    opts = {
      provider = "copilot",
      copilot = {
        model = "claude-3.7-sonnet",
      },
      auto_suggestions_provider = "copilot",
      hints = { enabled = false },
      windows = {
        position = "left", -- the position of the sidebar
        width = 30, -- default % based on available width
        -- height = 50,
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
    opts = {
      model = "DeepSeek-V3",
      show_folds = false, -- Shows folds for sections in chat
      show_help = false, -- Shows help message as virtual lines when waiting for user input
      question_header = "󱜸 Question ", -- Header to use for user questions
      answer_header = " Copilot ", -- Header to use for AI answers
      error_header = " Error ", -- Header to use for errors
      window = {
        layout = "float",
        width = 0.618,
        height = 0.618,
        boarder = "rounded",
      },
    },
    lazy = false,
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
      keys = {
        ["<cr>"] = "jump_close",
      },
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

  -- -- NOTE: Multicursor:
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { link = "Cursor" })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
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
      -- {
      --   "folke/neodev.nvim",
      --   opts = {
      --     library = { plugins = { "nvim-dap-ui" }, types = true },
      --   },
      -- },
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

  -- NOTE: detect indent
  {
    "tpope/vim-sleuth",
    lazy = false,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "amongus",
        show_all_diags_on_cursorline = true,
        severity = {
          vim.diagnostic.severity.ERROR,
          vim.diagnostic.severity.WARN,
        },
      })
      vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end,
  },

  -- NOTE: mason
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "pyright",
        "bash-language-server",
        "shfmt",
      },
    },
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
    cond = vim.fn.has("mac") == 0,
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

  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },

  -- NOTE: disabled plusings
  { "MagicDuck/grug-far.nvim", enabled = false },
  { "windwp/nvim-ts-autotag", enabled = false },
  { "folke/persistence.nvim", enabled = false },
}
