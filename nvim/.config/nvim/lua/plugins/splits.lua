return{
    'mrjones2014/smart-splits.nvim',
    lazy = false,
    priority = 1000,
    keys = {
        {'<A-h>', function() require('smart-splits').resize_left() end},
        {'<A-j>', function() require('smart-splits').resize_down() end},
        {'<A-k>', function() require('smart-splits').resize_up() end},
        {'<A-l>', function() require('smart-splits').resize_right() end},
        {'<C-h>', function() require('smart-splits').move_cursor_left() end},
        {'<C-j>', function() require('smart-splits').move_cursor_down() end},
        {'<C-k>', function() require('smart-splits').move_cursor_up() end},
        {'<C-l>', function() require('smart-splits').move_cursor_right() end},
        {'<C-\\>', function() require('smart-splits').move_cursor_previous() end},
        {'<leader>sh', function() require('smart-splits').swap_buf_left() end},
        {'<leader>sj', function() require('smart-splits').swap_buf_down() end},
        {'<leader>sk', function() require('smart-splits').swap_buf_up() end},
        {'<leader>sl', function() require('smart-splits').swap_buf_right() end},
    },
    config = true
}
