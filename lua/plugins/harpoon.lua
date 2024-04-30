return {
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            local harpoon = require('harpoon')

            harpoon:setup()

            local conf = require('telescope.config').values

            local function toggle_telescope(harpoon_files)
                local make_finder = function()
                    local paths = {}
                    for _, item in ipairs(harpoon_files.items) do
                        table.insert(paths, item.value)
                    end

                    return require("telescope.finders").new_table({
                        results = paths
                    })
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = make_finder(),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                    attach_mappings = function(prompt_buffer_number, map)
                        map(
                            "i",
                            "<C-d>", -- your mapping here
                            function()
                                local state = require("telescope.actions.state")
                                local selected_entry = state.get_selected_entry()

                                -- there's a bug here with removing things
                                -- where we end up removing all the entries.
                                -- fix it.

                                harpoon:list():remove_at(selected_entry.index)

                                local current_picker = state.get_current_picker(prompt_buffer_number)
                                current_picker:delete_selection(function() end)
                                current_picker:refresh(make_finder())
                            end
                        )
                        return true
                    end
                }):find()
            end

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, {desc = "Open harpoon window" })

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
        end
    }
}
