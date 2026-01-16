vim.pack.add {
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        data = { run = function(_) vim.cmd 'TSUpdate' end, },
    },
    "https://github.com/Mofiqul/vscode.nvim",
    "https://github.com/Shatur/neovim-ayu",
    "https://github.com/nvim-mini/mini.extra",
    "https://github.com/nvim-mini/mini.ai",
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/nvim-mini/mini.diff",
    "https://github.com/nvim-mini/mini.splitjoin",
    "https://github.com/nvim-mini/mini.surround",
    "https://github.com/nvim-mini/mini.pairs",
    "https://github.com/nvim-mini/mini.cmdline",
    "https://github.com/nvim-mini/mini.statusline",
    "https://github.com/folke/flash.nvim",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/ziglang/zig.vim",
    "https://github.com/sschleemilch/slimline.nvim",
    'https://github.com/mrjones2014/smart-splits.nvim',
    'https://github.com/shortcuts/no-neck-pain.nvim',
}

require('no-neck-pain').setup {
    width = 150
}

require("slimline").setup({
    style = "fg",
    spaces = {
        components = '',
        left = '',
        right = ''
    }
})

vim.cmd.colorscheme('vscode')

vim.keymap.set({'n', 'x', 'o'}, "gw", function()
    require('flash').jump()
end)

require('flash').toggle()

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
