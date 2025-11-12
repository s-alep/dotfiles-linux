return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      'f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = 'x',
      desc = '[F]ormat buffer',
    },
    {
      '<leader>=',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = 'n',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = false,
    formatters_by_ft = {
      lua = { 'stylua' },
      elixir = { 'elixirls' },
      json = { 'prettier' },
      xml = { 'xmlformatter' },
      html = { 'prettier' },
      php = { 'pretty-php' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      twig = { 'djlint' },
    },
  },
}
