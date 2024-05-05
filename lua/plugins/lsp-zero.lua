return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(
        function(client, bufnr)
          lsp_zero.default_keymaps({buffer = bufnr})
          vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
        end
      )

      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'bashls',
          'clangd',
          'marksman',
          'pyright',
          'rust_analyzer',
        },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end
        }
      })
    end
  },
  {
    'scalameta/nvim-metals',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    ft = { 'scala', 'sbt', 'java' },
    opts = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      local metals_config = require('metals').bare_config()
      metals_config.capabilities = lsp_zero.get_capabilities()
      metals_config.init_options.statusBarProvider = "on"
      metals_config.settings = {
        showImplicitArguments = true,
        showInferredType = true,
        autoImportBuild = "all"
      }

      return metals_config
    end,
    config = function(self, metals_config)
      local metals_augroup = vim.api.nvim_create_augroup('nvim-metals', {clear = true})
      vim.api.nvim_create_autocmd('FileType', {
        group = metals_augroup,
        pattern = self.ft,
        callback = function()
          require('metals').initialize_or_attach(metals_config)
        end

      })
    end
  },


  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        sources = {
          { name = 'buffer' },
        },
        formatting = lsp_zero.cmp_format({details = true}),
        mapping = cmp.mapping.preset.insert({
          ['<C-Tab>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          ['<CR>'] = cmp.mapping.confirm({select = true }), -- Accept currently selected items
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end
  },
}

