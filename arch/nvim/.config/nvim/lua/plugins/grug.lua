return {
  'MagicDuck/grug-far.nvim',
  cond = not vim.g.vscode,
  config = function()
    require('grug-far').setup {}
    vim.keymap.set('n', '<leader>f', function()
      require('grug-far').open()
    end, { desc = 'open GRUG [F]ar' })
  end,
}
