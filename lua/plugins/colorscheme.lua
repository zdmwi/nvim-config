return {
    {
        'projekt0n/github-nvim-theme',
        lazy = false,
        priority = 1000,
        config = function() 
          local palettes = {
            github_dark_dimmed = {
              fg0 = "#98a3ad",
              fg1 = "#98a3ad",
              fg2 = "#98a3ad",
              fg3 = "#98a3ad",
            }
          }

          require('github-theme').setup({
            palettes = palettes,
            options = {
              transparent = true,
            }
          })
          vim.cmd[[colorscheme github_dark_dimmed]]
        end
    }
}
