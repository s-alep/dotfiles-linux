return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  config = function()
    local mc = require 'multicursor-nvim'
    mc.setup()

    local set = vim.keymap.set
    set({ 'n', 'x' }, '<C-PageUp>', function()
      mc.lineAddCursor(-1)
    end)
    set({ 'n', 'x' }, '<C-PageDown>', function()
      mc.lineAddCursor(1)
    end)
    set({ 'n', 'x' }, 'tk', function()
      mc.lineSkipCursor(-1)
    end)
    set({ 'n', 'x' }, 'tj', function()
      mc.lineSkipCursor(1)
    end)

    set({ 'n', 'x' }, '<C-f>', function()
      mc.matchAddCursor(1)
    end)
    set({ 'n', 'x' }, '<leader>s', function()
      mc.matchSkipCursor(1)
    end)
    set({ 'n', 'x' }, '<C-b>', function()
      mc.matchAddCursor(-1)
    end)
    set({ 'n', 'x' }, '<leader>S', function()
      mc.matchSkipCursor(-1)
    end)

    set('n', '<c-leftmouse>', mc.handleMouse)
    set('n', '<c-leftdrag>', mc.handleMouseDrag)
    set('n', '<c-leftrelease>', mc.handleMouseRelease)
    set({ 'n', 'x' }, '<c-q>', mc.toggleCursor)
    mc.addKeymapLayer(function(layerSet)
      layerSet({ 'n', 'x' }, 'th', mc.prevCursor)
      layerSet({ 'n', 'x' }, 'tl', mc.nextCursor)
      layerSet({ 'n', 'x' }, '<leader>x', mc.deleteCursor)
      layerSet('n', '<esc>', function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    local hl = vim.api.nvim_set_hl
    hl(0, 'MultiCursorCursor', { link = 'Cursor' })
    hl(0, 'MultiCursorVisual', { link = 'Visual' })
    hl(0, 'MultiCursorSign', { link = 'SignColumn' })
    hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
    hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
  end,
}
