require("overseer").setup({})

local make_command_arg = ""

-- Command to explicitly set a new make command argument
vim.api.nvim_create_user_command("Make", function(opts)
	make_command_arg = opts.args
	vim.cmd("Make " .. make_command_arg)
end, { nargs = 1 })

vim.api.nvim_create_user_command("Make", function(params)
	-- Insert args at the '$*' in the makeprg
	local cmd, num_subs = vim.o.makeprg:gsub("%$%*", params.args)
	if num_subs == 0 then
		cmd = cmd .. " " .. params.args
		make_command_arg = params.args
	end
	local task = require("overseer").new_task({
		cmd = vim.fn.expandcmd(cmd),
		components = {
			{ "on_output_quickfix", open = false, open_height = 15, close = true, set_diagnostics = true },
			-- { "open_output", focus = true },
			-- { "on_result_diagnostics_quickfix", open = true, close = true },
			-- { "on_result_diagnostics_trouble", close = true },
			"default",
		},
	})
	task:start()
end, {
	desc = "Run your makeprg as an Overseer task",
	nargs = "*",
	bang = true,
})

-- Function to prompt the user for input and store it
function set_make_command_arg()
	vim.ui.input({ prompt = "Enter make command argument: " }, function(input)
		if input then
			make_command_arg = input
			vim.cmd("Make " .. make_command_arg)
		end
	end)
end

-- Function to run the make command with the stored argument
function run_make_command()
	if make_command_arg == "" then
		set_make_command_arg()
	else
		vim.cmd("Make " .. make_command_arg)
	end
	-- vim.cmd([[Trouble qflist open focus=true win={size={height=0.4}}]])
end

-- Key mapping to call the function
vim.keymap.set("n", "<leader>mk", ":lua run_make_command()<CR>", { noremap = true, silent = true, desc = "run make" })
vim.keymap.set(
	"n",
	"<leader>ma",
	":lua set_make_command_arg()<CR>",
	{ noremap = true, silent = true, desc = "run make" }
)
