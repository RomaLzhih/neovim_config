return {
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
  config = function()
    -- local configs = require("nvchad.configs.lspconfig")
    -- local on_attach = configs.on_attach
    -- local on_init = configs.on_init
    -- local capabilities = configs.capabilities

    local lspconfig = require("lspconfig")
    local servers = { "texlab", "bashls", "pyright", "clangd", "r_language_server", "lua_ls" }

    -- capabilities.textDocument.foldingRange = {
    --   dynamicRegistration = false,
    --   lineFoldingOnly = true,
    -- }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({})
    end

    lspconfig.clangd.setup({
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
        "--inlay-hints",
        "--clang-tidy",
      },
    })

    lspconfig.r_language_server.setup({
      handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          -- Disable virtual_text
          virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
          signs = { severity = { min = vim.diagnostic.severity.ERROR } },
          underline = { severity = { min = vim.diagnostic.severity.ERROR } },
        }),
      },
      settings = {
        r = {
          lsp = {
            diagnostics = false,
          },
        },
      },
    })

    -- Function to detect the operating system
    local function get_os()
      local os_name
      if vim.fn.has("win32") == 1 then
        os_name = "Windows"
      elseif vim.fn.has("unix") == 1 then
        local uname = vim.fn.system("uname -s")
        if uname:match("Linux") then
          local distro = vim.fn.system("cat /etc/os-release | grep ^ID= | cut -d= -f2")
          if distro:match("ubuntu") then
            os_name = "Ubuntu"
          elseif distro:match("arch") then
            os_name = "Arch"
          end
        end
      end
      return os_name
    end

    -- Get the current operating system
    local current_os = get_os()

    -- Conditionally setup ltex based on the operating system
    if current_os == "Ubuntu" or current_os == "Arch" or current_os == "Windows" then
      lspconfig.texlab.setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
        handlers = {
          ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            -- Disable virtual_text
            virtual_text = false,
          }),
        },
      })

      -- https://medium.com/@Erik_Krieg/free-and-open-source-grammar-correction-in-neovim-using-ltex-and-n-grams-dea9d10bc964
      lspconfig.ltex.setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
        filetypes = { "tex", "bib" },
        autostart = false,
        handlers = {
          ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            -- Disable virtual_text
            virtual_text = false,
            underline = { severity = { min = vim.diagnostic.severity.INFO } },
          }),
        },
        settings = {
          ltex = {
            checkFrequency = "save",
            statusBarItem = "true",
          },
        },
      })
    end

    vim.diagnostic.config({ virtual_text = false })
  end, -- Override to setup mason-lspconfig
}
