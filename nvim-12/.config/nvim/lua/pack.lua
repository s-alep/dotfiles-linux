vim.pack.add({
    "https://github.com/neanias/everforest-nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/stevearc/quicker.nvim",
    "https://github.com/ziglang/zig.vim",
    'https://github.com/mrjones2014/smart-splits.nvim',
})

require('everforest').setup{
  transparent_background_level = 2
}
vim.cmd.colorscheme('everforest')

require('smart-splits').setup()
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)


require('oil').setup {
      keymaps = {
        ['q'] = { 'actions.close', mode = 'n' },
      },
      use_default_keymaps = true,
      float = {
        max_width = 0.5,
        max_height = 0.5,
      },
}

vim.keymap.set('n', '<leader>O', function()
  vim.ui.input({ prompt = 'Oil SSH to:' }, function(input)
    if input and input ~= '' then
      vim.cmd('Oil oil-ssh://' .. input .. "/")
    end
  end)
end, { desc = 'Oil SSH' })

vim.keymap.set('n', '<leader>o', function()
    require('oil').toggle_float()
end)

require('quicker').setup {}

vim.keymap.set('n', '<leader>xq', function()
    require('quicker').toggle()
end)

vim.keymap.set('n', '<leader>xl', function()
    require('quicker').toggle {loclist = true}
end)
