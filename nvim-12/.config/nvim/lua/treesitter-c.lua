vim.pack.add({
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        version='main'
    },
})

require('nvim-treesitter.configs').setup {}

vim.pack.add({
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
        version='main'
    }
})
