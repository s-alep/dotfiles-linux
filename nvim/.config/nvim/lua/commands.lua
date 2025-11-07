local term1_id = 0
local term2_id = 0

function sl2dev()
  vim.fn.chansend(term1_id, {"cd sl2_flask\r\n"})
  vim.fn.chansend(term1_id, {"sl2_flask_setup\r\n"})
  vim.fn.chansend(term2_id, {"cd AngularApp\r\n"})
  vim.fn.chansend(term2_id, {"echo 1beer | sudo -S bun run start\r\n"})
end

function first_tab() 
  vim.cmd.terminal()
  term1_id = vim.bo.channel

  vim.cmd.vnew()
  vim.cmd.wincmd("L")
  vim.cmd.terminal()
  term2_id = vim.bo.channel
end

function second_tab()
  vim.cmd.tabnew()
  vim.cmd.tcd("sl2_flask")
end

function third_tab()
  vim.cmd.tabnew()
  vim.cmd.tcd("../AngularApp")
end

function Sl2()
  first_tab()
  second_tab()
  third_tab()

  vim.cmd.tabfirst()
  vim.loop.sleep(500)
  sl2dev()
end


vim.api.nvim_create_user_command("Sl2", function()
  Sl2()
end, {})


-- Notes
Notes = function() 
  Snacks.picker.projects { dev = { '~/Documents/notes' }, patterns = {'*'}, recent = false } 
end
