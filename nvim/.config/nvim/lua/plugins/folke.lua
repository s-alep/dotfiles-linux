return {
  {"folke/sidekick.nvim",
      opts = {
        nes = {
          enabled = false
        }
      },
      keys = {
        {"<c-.>", function() require("sidekick.cli").toggle() end, mode = { "n", "t", "i", "x" },},
        {"<leader>ad", function() require("sidekick.cli").close() end,},
        {"<leader>at", function() require("sidekick.cli").send({ msg = "{this}" }) end, mode = { "x", "n" },},
        {"<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end,},
        {"<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, mode = { "x" },},
        {"<leader>ap", function() require("sidekick.cli").prompt() end, mode = { "n", "x" },},
      }
    },
    {'folke/flash.nvim',
        keys = {
            {'gw', function() require 'flash'.jump() end, mode = {'n', 'x', 'o'}}
        }
    }
}
