return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPre", "BufNewFile" },
        build = ':TSUpdate',
        dependencies = {
          "windwp/nvim-ts-autotag",
        },
        config = function()
            require('nvim-treesitter.configs').setup({
                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },

                indent = { enable = true },

                -- enable autotagging using windwp/nvim-ts-autotag
                autotag = { enable = true },
                ensure_installed = {
                  "c",
                  "python",
                  "scala",
                  "lua",
                  "vim",
                  "json",
                  "markdown",
                  "markdown_inline",
                  "json",
                  "yaml",
                  "gitignore",
                  "query",
                  "vimdoc",
                  "bash",
                  "dockerfile"
                },

                incremental_selection = {
                  enable = true,
                  keymaps = {
                    init_selection = "gnn",
                    node_incremental = "gnn",
                    scope_incremental = false,
                    node_decremental = "grm",
                  }
                },

                sync_install = false,
                auto_install = true,
            })
        end
    }
}
