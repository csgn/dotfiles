return {
	"mfussenegger/nvim-dap",
	lazy = true,
	keys = {
		{
			"<leader>db",
			function() require("dap").toggle_breakpoint() end,
			desc = "Toggle Breakpoint"
		},

		{
			"<leader>dc",
			function() require("dap").continue() end,
			desc = "Continue"
		},

		{
			"<leader>dC",
			function() require("dap").run_to_cursor() end,
			desc = "Run to Cursor"
		},

		{
			"<leader>dT",
			function() require("dap").terminate() end,
			desc = "Terminate"
		},
	},
	config = function()
		local dap = require("dap")
		dap.adapters.coreclr = {
			type = 'executable',
			command = 'netcoredbg',
			args = { '--interpreter=vscode' }
		}

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "Launch for C# Project",
				request = "launch",
				program = function()
					-- Automatically find dlls in any bin/ directory
					local root = vim.fn.getcwd()
					local dlls = vim.fn.globpath(root, "**/bin/**/*.dll", 0, 1)

					if #dlls == 0 then
						return vim.fn.input('Path to dll: ', root .. '/', 'file')
					elseif #dlls == 1 then
						return dlls[1]
					else
						-- If multiple exist (e.g., net6.0 and net8.0), let you pick
						return vim.fn.input('Select DLL: ', dlls[1], 'file')
					end
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = false,
			},
			{
				type = "coreclr",
				name = "Launch for Godot Game",
				request = "launch",
				program = "/usr/local/bin/godot",
				args = {
					"--path", "${workspaceFolder}",
				},
				cwd = "${workspaceFolder}",
				env = {
					-- This tells the .NET runtime inside Godot to wait for a debugger
					-- to connect on this specific port.
					DOTNET_DebuggerAgent = "transport=dt_socket,address=127.0.0.1:4711,server=y,suspend=n"
				},
				stopAtEntry = false,
			}
		}
	end
}
