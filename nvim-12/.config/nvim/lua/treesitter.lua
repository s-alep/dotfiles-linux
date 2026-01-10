local treesitter = require('nvim-treesitter')
treesitter.setup {}
treesitter.install {
    'zig', 'lua'
}


local ts_parsers = {'python', 'lua', 'vim', 'vimdoc', 'c', 'query'}
local ts = vim.treesitter
local ts_installed = require('nvim-treesitter').get_installed()

local ts_filetypes = vim.iter(ts_parsers)
  :map(ts.language.get_filetypes)
  :flatten()
  :fold({}, function(tbl, v)
    tbl[v] = vim.tbl_contains(ts_installed, v)
    return tbl
  end)

local ts_enable = function(buffer, lang)
  local ok, hl = pcall(ts.query.get, lang, 'highlights')
  if ok and hl then
    ts.start(buffer, lang)
  end
end

vim.api.nvim_create_autocmd('FileType', {
  desc = 'enable treesitter',
  callback = function(event)
    local ft = event.match
    local available = ts_filetypes[ft]
    if available == nil then
      return
    end

    local lang = ts.language.get_lang(ft)
    local buffer = event.buf

    if available then
      ts_enable(buffer, lang)
      return
    end

    require('nvim-treesitter').install(lang):await(function()
      ts_filetypes[ft] = true
      ts_enable(buffer, lang)
    end)
  end,
})
