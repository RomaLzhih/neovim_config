local overseer = require("overseer")

require("overseer").setup({
	dap = false,
	task_list = {
		max_height = { 40, 0.382 },
		bindings = {
			["<C-k>"] = false,
			["<C-j>"] = false,
			["<C-h>"] = false,
			["<C-l>"] = false,
			["<C-u>"] = "ScrollOutputUp",
			["<C-d>"] = "ScrollOutputDown",
			["L"] = "IncreaseDetail",
			["H"] = "DecreaseDetail",
		},
	},
	template_timeout = 0,
	template_cache_threshold = 0,
	strategy = "jobstart",
})

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
vim.keymap.set(
	"n",
	"<leader>mk",
	":lua run_make_command()<CR>",
	{ noremap = true, silent = true, desc = "overseer run make" }
)
-- vim.keymap.del("n", "<leader>ma")
vim.keymap.set(
	"n",
	"<leader>mt",
	":lua set_make_command_arg()<CR>",
	{ noremap = true, silent = true, desc = "overseer get new make target" }
)

-- NOTE: run the last task
vim.api.nvim_create_user_command("OverseerRestartLast", function()
	local overseer = require("overseer")
	local tasks = overseer.list_tasks({ recent_first = true })
	if vim.tbl_isempty(tasks) then
		vim.notify("No tasks found", vim.log.levels.WARN)
	else
		overseer.run_action(tasks[1], "restart")
	end
end, {})

vim.keymap.set(
	"n",
	"<leader>ol",
	"<cmd> OverseerRestartLast<CR>",
	{ noremap = true, silent = true, desc = "overseer restart last" }
)

vim.keymap.set("n", "<leader>ru", "<cmd> OverseerRun<CR>", { noremap = true, silent = true, desc = "overseer run" })

vim.keymap.set("n", "<leader>op", "<cmd> OverseerOpen<CR>", { noremap = true, silent = true, desc = "overseer open" })

vim.keymap.set(
	"n",
	"<leader>oa",
	"<cmd> OverseerTaskAction<CR>",
	{ noremap = true, silent = true, desc = "overseer open" }
)

-- NOTE: run customized tasks
local args_string = ""
local bin_name = ""

function set_debug_command_arg()
	bin_name = vim.fn.input("Name of the executable: ")
	args_string = vim.fn.input("Arguments: ")
	print("bin_name: " .. bin_name)
	print("args_string: " .. args_string)
end

overseer.register_template(
	-- Template definition (see below)
	{
		-- Required fields
		name = "run target",
		params = {
			cmd = { type = "string", default = "make -C build test && ./build/test", order = 1 },
			args = {
				type = "list",
				subtype = { type = "string" },
				delimiter = " ",
				default = "-p /data/zmen002/kdtree/ss_varden_bigint/1000000000_2/2.in -d 2 -t 0 -q 1 -s 0 -i 0 -r 2 -T 0 -l 3",
				optional = true,
				order = 2,
			},
			cwd = { type = "string", optional = true, default = vim.fn.getcwd(), order = 3 },
			env = {
				type = "list",
				subtype = { type = "string" },
				delimiter = " ",
				optional = true,
				order = 4,
			},
			expand_cmd = {
				desc = "Run expandcmd() on command before execution",
				type = "boolean",
				default = true,
				optional = true,
				order = 5,
			},
		},
		builder = function(params)
			-- This must return an overseer.TaskDefinition
			local cmd = params.expand_cmd and vim.fn.expandcmd(params.cmd) or params.cmd
			return {
				cmd = cmd,
				-- cwd = params.cwd ~= "" and vim.fn.getcwd() .. "/" .. params.cwd .. "/" or nil,
				args = params.args,
				env = params.env, -- the list of components or component aliases to add to the task
				components = {
					{ "open_output", direction = "dock", focus = true, on_result = "always", on_start = "always" },
					"default",
				},
				metadata = {},
			}
		end,
		-- desc = "Optional description of task",
		tags = { overseer.TAG.BUILD },
		priority = 50,
		condition = {
			filetype = { "c", "cpp" },
			callback = function(search)
				print(vim.inspect(search))
				return true
			end,
		},
	}
)
