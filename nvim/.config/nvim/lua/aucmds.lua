vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.html"},
  callback = function()
    vim.bo.filetype = "html"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("active_cursorline", { clear = true }),
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = "active_cursorline",
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
	buffer = event.buf,
	group = highlight_augroup,
	callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
	buffer = event.buf,
	group = highlight_augroup,
	callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
	group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
	callback = function(event2)
	  vim.lsp.buf.clear_references()
	  vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
	end,
      })
    end
  end,
})

_G.fzf_config = function()
    local fzf_lua = require'fzf-lua'
    opts =  {
        cwd = '/home/salepakos/.config',
        prompt = "Configuration> ",
        winopts = {
            fullscreen = true
        },
        actions = {
            ['default'] = function(selected)
                vim.cmd("cd " .. selected[1])
                vim.cmd(":e " .. selected[1])
            end,
            ['q'] = function()
                vim.cmd.quit()
            end

        }
    }
    fzf_lua.fzf_exec("fd -a -td -tl -d 1", opts)
end
vim.cmd([[command! -nargs=* Configuration lua _G.fzf_config()]])
