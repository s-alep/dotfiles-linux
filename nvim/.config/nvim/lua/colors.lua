local opaque = 1

local colors = {
  background = '#14161B',
  foreground = '#C4C6CD',
  n_hues = 8,
  saturation = 'mediumhigh'
}

vim.api.nvim_set_hl(0, 'SnacksPickerDir', { link ='SnacksPickerFile' })
vim.cmd.colorscheme('darkplus')
vim.api.nvim_set_hl(0, 'StatusLine', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { link = 'Normal' })
require('lualine').setup {}

local function toggle_opacity()
  local normal = vim.fn.execute 'hi Normal'
  local current_color = vim.api.nvim_exec2('colorscheme', { output = true }).output
  if not string.find(normal, 'guibg') then
    if current_color == 'default' then
      require('mini.hues').setup(colors)
    else
      vim.cmd.colorscheme(current_color)
    end
    vim.api.nvim_set_hl(0, 'StatusLine', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', {link='Normal'})
    vim.api.nvim_set_hl(0, 'NormalNC', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { link ='NormalFloat' })
    vim.api.nvim_set_hl(0, 'SnacksPickerDir', { link ='SnacksPickerFile' })
    vim.api.nvim_set_hl(0, 'Tabline', { link ='Normal' })
    vim.api.nvim_set_hl(0, 'TablineFill', { link ='Normal' })
    vim.api.nvim_set_hl(0, 'TablineSel', { link ='lualine_a_visual' })
    require('lualine').setup {}
  else
    local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = normal_bg })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg =  normal_bg})
    require('lualine').setup {}
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalNC', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { link ='NormalFloat' })
    vim.api.nvim_set_hl(0, 'SnacksPickerDir', { link ='SnacksPickerFile' })
    vim.api.nvim_set_hl(0, 'Tabline', { link ='Normal' })
    vim.api.nvim_set_hl(0, 'TablineFill', { link ='Normal' })
    vim.api.nvim_set_hl(0, 'TablineSel', { link ='lualine_a_visual' })
  end
end

local function toggle_dark_light()
  local background = vim.o.background
  if background == 'light' then
    vim.o.background = 'dark'
  else
    vim.o.background = 'light'
  end
end

vim.keymap.set('n', '<leader>tg', toggle_opacity)
vim.keymap.set('n', '<leader>tl', toggle_dark_light )
if opaque == 1 then
  toggle_opacity()
end

