return {
    "sschleemilch/slimline.nvim",
    config = function()
        require('slimline').setup {
            style = 'fg',
            spaces = {
                components = '',
                left= '',
                right = ''
            }
        }
    end
}
