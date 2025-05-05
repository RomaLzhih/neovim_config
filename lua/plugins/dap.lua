return {

  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    local bin_path = ""
    local args_string = ""
    local bin_name = ""

    function set_debug_command_arg()
      bin_name = vim.fn.input("Name of the executable: ")
      bin_path = vim.fn.getcwd() .. "/build/" .. bin_name
      args_string = vim.fn.input("Arguments: ")
      print("bin_name: " .. bin_name)
      print("bin_path: " .. bin_path)
      print("args_string: " .. args_string)
    end

    dap.configurations.cpp = {
      {
        name = "Launch codelldb",
        type = "codelldb",
        request = "launch",
        program = function()
          if bin_path == "" then
            bin_path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end
          return bin_path
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = function()
          if args_string == "" then
            args_string = vim.fn.input("Arguments: ", "file")
          end
          return vim.split(args_string, " ")
        end,
        preLaunchTask = function()
          if bin_name == "" or args_string == "" or bin_path == "" then
            set_debug_command_arg()
          end
          local build_command = "make -C build " .. bin_name
          vim.fn.system(build_command)
        end,
      },
    }

    vim.keymap.set(
      "n",
      "<leader>da",
      ":lua set_debug_command_arg()<CR>",
      { noremap = true, silent = true, desc = "get new debug target" }
    )
  end,
}
