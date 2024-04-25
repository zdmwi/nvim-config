return {
    {
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({})

            vim.cmd('colorscheme github_dark_dimmed')

            --[[
            local is_ok, _ = pcall(vim.cmd, 'colorscheme github_dark_dimmed')
            if not is_ok then
                vim.notify('colorscheme github_dark_dimmed not found')
                return
            end
            ]]--
        end
    }
}
