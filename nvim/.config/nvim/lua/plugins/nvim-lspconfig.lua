return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', opts = {} },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'saghen/blink.cmp',
  },
  config = function()
    -- if vim.g.have_nerd_font then
    --   local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
    --   local diagnostic_signs = {}
    --   for type, icon in pairs(signs) do
    --     diagnostic_signs[vim.diagnostic.severity[type]] = icon
    --   end
    --   vim.diagnostic.config { signs = { text = diagnostic_signs } }
    -- end

    local servers = {
      ts_ls = {},
      phpactor = {},
      lua_ls = {},
      emmet_language_server = {},
      cssls = {}
    }

    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
      'prettier',
      'debugpy',
      'php-debug-adapter',
      'xmlformatter',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
