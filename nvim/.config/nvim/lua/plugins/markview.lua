return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  priority = 49,
  opts = {
    preview = {
      filetypes = { 'codecompanion' },
      ignore_buftypes = {},
    },
    experimental = {
      check_rtp = true,
      check_rtp_message = true,
    },
  },
}
