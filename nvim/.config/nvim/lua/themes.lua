require('everforest').setup{
    transparent_background_level = 2
}
require('tokyonight').setup{
    transparent = true,
    style= 'night'
}
require('hybrid').setup {
    transparent = true,
}
require('kanagawa').setup {
    theme ='dragon',
    background ={
        dark ='dragon',
        light = 'lotus'
    },
    transparent = true,
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    },
    overrides = function(colors)
        local theme = colors.theme
        return {
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
        }
    end,
}

vim.cmd.colorscheme('terafox')
