-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'lua_ls',
    'pyright'
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

local metals_lsp = lsp.build_options('metals', {})
local metals_config = require('metals').bare_config()

metals_config.capabilities = metals_lsp.capabilities
metals_config.init_options.statusBarProvider = 'on' 

local metals_augroup = vim.api.nvim_create_augroup('nvim-metals', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
    group = metals_augroup,
    pattern = {'scala', 'sbt', 'java'},
    callback = function()
        require('metals').initialize_or_attach(metals_config)
    end
})
