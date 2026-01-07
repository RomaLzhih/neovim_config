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

local function check_distro(distro_id)
  -- Only run the system check if we are on a Unix-like system
  if vim.fn.has("unix") == 1 then
    -- Read /etc/os-release and convert the output to lowercase
    local os_info = vim.fn.system("cat /etc/os-release 2>/dev/null"):lower()

    -- Check if the distribution ID is present in the file content
    if os_info:find(distro_id) then
      return true
    end
  end
  return false
end

-- 1. Check for Ubuntu
local function is_ubuntu()
  return check_distro("ubuntu")
end

-- 2. Check for Arch Linux
local function is_arch()
  return check_distro("arch")
end

-- 3. Check for Rocky Linux
local function is_rocky()
  return check_distro("rocky")
end

return {
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      stiffness = 0.5,
      trailing_stiffness = 0.5,
      matrix_pixel_threshold = 0.5,
      -- time_interval = 7, -- milliseconds
      legacy_computing_symbols_support = true,
    },
    lazy = false,
  },
  -- NOTE: nvim-bqf
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  {
    "skywind3000/asynctasks.vim",
    dependencies = { "skywind3000/asyncrun.vim" },
    init = function()
      vim.g.asyncrun_open = 15
      vim.g.asynctasks_term_reuse = 1
      vim.g.asynctasks_template = "~/.vim/task_template.ini"
      vim.g.asynctasks_term_pos = "bottom"
    end,
    lazy = false,
  },

  -- NOTE: extend %
  {
    "andymass/vim-matchup",
    init = function()
      -- modify your configuration vars here
      vim.g.matchup_treesitter_stopline = 500

      -- or call the setup function provided as a helper. It defines the
      -- configuration vars for you
      require("match-up").setup({
        treesitter = {
          stopline = 500,
        },
      })
    end,
    -- or use the `opts` mechanism built into `lazy.nvim`. It calls
    -- `require('match-up').setup` under the hood
    ---@type matchup.Config
    opts = {
      treesitter = {
        stopline = 500,
      },
    },
  },

  -- NOTE: disable noice
  {
    "folke/noice.nvim",
    enabled = false,
  },

  -- NOTE: highlight log files
  {
    "fei6409/log-highlight.nvim",
    config = function()
      require("log-highlight").setup({})
    end,
  },

  -- NOTE: auto resize buffer
  {
    "kwkarlwang/bufresize.nvim",
    config = function()
      require("bufresize").setup()
    end,
    lazy = false,
  },

  -- NOTE: transparent
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },

  -- NOTE: show colors
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
    },
    lazy = true,
  },

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

  -- NOTE: leetcode
  {
    "kawre/leetcode.nvim",
    -- build = ":TSInstall html", -- if you have `nvim-treesitter` installed
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
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
    keys = {
      {
        "<A-y>",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<A-u>",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      -- {
      --   "<c-s>",
      --   "<cmd>Yazi toggle<cr>",
      --   desc = "Resume the last yazi session",
      -- },
    },
  },

  {
    -- NOTE: oil
    "stevearc/oil.nvim",
    keys = {
      {
        "<C-s>",
        function()
          require("oil").toggle_float()
        end,
        mode = "n",
        desc = "Toggle oil float",
      },
    },
    opts = {
      float = {
        padding = 2,
        max_width = 82,
        max_height = 30,
        border = "rounded",
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
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    lazy = false,
  },

  -- NOTE: enable nvim copy to system clipboard
  { "ojroques/nvim-osc52", lazy = false },

  -- -- NOTE: treesitter based incremental selection
  -- {
  --   "RRethy/nvim-treesitter-textsubjects",
  --   ft = { "cpp", "c", "python", "lua", "r", "rmd" },
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       textsubjects = {
  --         enable = true,
  --         prev_selection = ",", -- (Optional) keymap to select the previous selection
  --         keymaps = {
  --           ["."] = "textsubjects-smart",
  --           [";"] = "textsubjects-container-outer",
  --           ["i;"] = {
  --             "textsubjects-container-inner",
  --             desc = "Select inside containers (classes, functions, etc.)",
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
  --
  -- -- NOTE: tree sitter context
  { "nvim-treesitter/nvim-treesitter-context", opts = { enable = true }, lazy = false },
  --
  -- -- NOTE: enable treesitter for text object select
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   after = "nvim-treesitter",
  --   requires = "nvim-treesitter/nvim-treesitter",
  --   ft = { "cpp", "c", "python", "lua", "r", "rmd" },
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       textobjects = {
  --         select = {
  --           enable = true,
  --           look = true,
  --           include_surrounding_whitespace = true,
  --           keymaps = {
  --             ["af"] = "@function.outer",
  --             ["if"] = "@function.inner",
  --             ["al"] = "@loop.outer",
  --             ["il"] = "@loop.inner",
  --             ["ac"] = "@conditional.outer",
  --             ["ic"] = "@conditional.inner",
  --           },
  --         },
  --         move = {
  --           enable = true,
  --           set_jumps = true, -- whether to set jumps in the jumplist
  --           goto_next = {
  --             ["]f"] = "@function.outer",
  --             ["]l"] = "@loop.outer",
  --             ["]c"] = "@conditional.outer",
  --           },
  --           goto_previous = {
  --             ["[f"] = "@function.outer",
  --             ["[l"] = "@loop.outer",
  --             ["[c"] = "@conditional.outer",
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },

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
      bypass_save_filetypes = {
        "alpha",
        "OverseerList",
        "toggleterm",
        "dashboard",
        "copilot-chat",
        "Avante",
        "snacks_dashboard",
      }, -- or whatever dashboard you use
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
    "nvim-mini/mini.pairs",
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

  -- NOTE: markdown render
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      render_modes = true,
      file_types = { "markdown", "Avante", "copilot-chat" },
      checkbox = {
        custom = {
          important = {
            raw = "[!]",
            rendered = "󰓎 ",
            highlight = "DiagnosticWarn",
          },
          cancel = {
            raw = "[c]",
            rendered = "󰜺 ",
            scope_highlight = "@markup.strikethrough",
          },
          pending = {
            raw = "[p]",
            rendered = "󱫪 ",
          },
        },
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    config = true,
    ft = { "markdown", "Avante", "copilot-chat" },
  },

  -- NOTE: nvim-obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    enabled = vim.fn.has("mac") == 1 or vim.fn.has("win32") == 1 or is_ubuntu(),
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "ziyang-obsidian",
          path = vim.fn.has("mac") == 1 and "~/Library/CloudStorage/Dropbox/work-flow/obsidian/ziyang-obsidian"
            or "~/Dropbox/work-flow/obsidian/ziyang-obsidian",
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

  -- lazy.nvim:
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<C-n>",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
  -- { "mg979/vim-visual-multi", lazy = false },

  -- NOTE; better comment than buildin
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      pre_hook = function(ctx)
        if vim.bo.filetype == "rmd" then
          return "#%s"
        end
      end
      -- require("Comment").setup()
      -- require("Comment.ft").set("rmd", { "#%s", "#%s" }) -- Both use #
    end,
  },

  -- NOTE; Search and replace
  {
    "nvim-pack/nvim-spectre",
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
      "mason-org/mason.nvim",
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
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "lua-language-server",
        "pyright",
        "pylint",
        "copilot-language-server",
        "autopep8",
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
        copy_sync = {
          enable = false,
        },
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
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "GustavoKatel/telescope-asynctasks.nvim",
      -- build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
      build = "cmake -S. -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
    config = function()
      if vim.fn.has("win32") == 0 then
        require("telescope").load_extension("yank_history")
      end
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<Tab>"] = "move_selection_previous",
              ["<S-Tab>"] = "move_selection_next",
            },
          },
          sorting_strategy = "descending",
          layout_config = {
            horizontal = {
              prompt_position = "bottom",
              width = 0.9,
              height = 0.618,
              preview_width = 0.5,
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
    "nvim-mini/mini.cursorword",
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
        ERROR = { icon = "", color = "error", alt = { "ERR", "Error", "error" } },
        WARN = { alt = { "WARNING", "warning" } },
        PARA = {
          icon = "󰡱",
          color = "info",
        },
        HACK = { icon = " ", color = "warning", alt = { "VITAL" } },
      },
    },
    lazy = false,
  },

  -- NOTE: Nvim-R
  --
  {
    "R-nvim/R.nvim",
    -- Only required if you also set defaults.lazy = true
    lazy = false,
    ft = { "rmd", "r" },
    enabled = vim.fn.has("mac") == 1 or vim.fn.has("win32") == 1 or is_ubuntu(),
    -- R.nvim is still young and we may make some breaking changes from time
    -- to time. For now we recommend pinning to the latest minor version
    -- like so:
    -- version = "~0.1.0",
    -- cond = vim.fn.has("mac") == 0,
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
