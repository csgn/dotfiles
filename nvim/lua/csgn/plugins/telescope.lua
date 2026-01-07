return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    keys = {
        {
            "<leader><leader>",
            desc = "Find Files (Telescope)"
        },
        {
            "<leader>gg",
            desc = "Git Files (Telescope)"
        },
        {
            "<leader>gp",
            desc = "Grep String (Telescope)"
        },
    },
    config = function()
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        local grep_args = { '--hidden', '--glob', '!**/.git/*' }

        vim.keymap.set('n', '<leader><leader>', function() builtin.find_files({ hidden = true, no_ignore = false }) end)
        vim.keymap.set('n', '<leader>gg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>gp', function()
            builtin.grep_string({ search = vim.fn.input("[Grep] ") });
        end)
        
        local function normalize_path(path)
	        return path:gsub("\\", "/")
        end

        local function normalize_cwd()
            return normalize_path(vim.loop.cwd()) .. "/"
        end

        local function is_subdirectory(cwd, path)
	        return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
        end

        local function split_filepath(path)
            local normalized_path = normalize_path(path)
            local normalized_cwd = normalize_cwd()
            local filename = normalized_path:match("[^/]+$")

            if is_subdirectory(normalized_cwd, normalized_path) then
                local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
                return stripped_path, filename
            else
                local stripped_path = normalized_path:sub(1, -(#filename + 1))
                return stripped_path, filename
            end
        end

        local function path_display(_, path)
            local stripped_path, filename = split_filepath(path)
            if filename == stripped_path or stripped_path == "" then
                return filename
            end
            return string.format("%s ~ %s", filename, stripped_path)
        end

        local file_ignore_patterns = {
            "node_modules/",
            ".next/",
            ".git/",
            "venv/",
            "build/",
            "dist/",
            "*.lock",
            ".bloop/",
            ".metals/",
            ".idea/",
            "target/",
            ".godot",
            "addons",
        }

        require('telescope').setup({
            defaults = {
                layout_strategy = "horizontal",
                path_display = path_display,
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                },
                file_ignore_patterns = file_ignore_patterns,
                layout_config = {
                    horizontal = {
                        prompt_position = "bottom",
                        width = { padding = 0 },
                        height = { padding = 0 },
                        preview_width = 0,
                    },
                },
            },
            pickers = {
                find_files = {
                    find_command = { 'fd', '--type', 'f', '--hidden', '--exclude', '.git' }
                },
                live_grep = {
                    additional_args = function(opts)
                        return grep_args
                    end
                },
                grep_string = {
                    additional_args = function(opts)
                        return grep_args
                    end
                },
            },
        })
    end,
}