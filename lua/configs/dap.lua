local dap = require("dap")
local bin_path = ""
local args_string = ""
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
				args_string = vim.fn.input("Arguments: ")
			end
			return vim.split(args_string, " ")
		end,
		preLaunchTask = function()
			local build_command = "make -C" .. bin_path -- Replace with your build command
			local result = os.execute(build_command)
			if result ~= 0 then
				print("Build failed!")
				return false
			end
			return true
		end,
	},
}

function set_debug_command_arg()
	bin_path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	args_string = vim.fn.input("Arguments: ")
	print("bin_path: " .. bin_path)
	print("args_string: " .. args_string)
end

vim.keymap.set(
	"n",
	"<leader>dt",
	":lua set_debug_command_arg()<CR>",
	{ noremap = true, silent = true, desc = "get new debug target" }
)
