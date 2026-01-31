return {
  'stevearc/oil.nvim',
    lazy=false,
    keys = {
        {'<leader>o', function() require 'oil'.toggle_float() end},
        {'<leader>O', function()
            vim.ui.input({ prompt = 'Oil SSH to:' }, function(input)
                if input and input ~= '' then
                    vim.cmd('Oil oil-ssh://' .. input .. "/")
                end
            end)
        end}
    },
    opts = {
      keymaps = {
        ['q'] = { 'actions.close', mode = 'n' },
      },
      use_default_keymaps = true,
      float = {
        max_width = 0.5,
        max_height = 0.5,
      },
    }
}
