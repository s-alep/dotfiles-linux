return {
  'nvim-orgmode/orgmode',
  dependencies = {
    'nvim-orgmode/org-bullets.nvim',
    'danilshvalov/org-modern.nvim',
    -- 'hamidi-dev/org-list.nvim',
    'tpope/vim-repeat',
    'andreadev-it/orgmode-multi-key',
  },
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmodedanilshvalov/org-modern.nvim
    local Menu = require 'org-modern.menu'
    require('orgmode').setup {
      ui = {
        menu = {
          handler = function(data)
            Menu:new({
              window = {
                margin = { 1, 0, 1, 0 },
                padding = { 0, 1, 0, 1 },
                title_pos = 'center',
                border = 'single',
                zindex = 1000,
              },
              icons = {
                separator = '➜',
              },
            }):open(data)
          end,
        },
      },
      org_id_link_to_org_use_id = true,
      org_agenda_files = '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/agenda/*',
      org_blank_before_new_entry = {
        heading = false,
        plain_list_item = false,
      },
      org_capture_templates = {
        c = {
          description = '[C]alendar',
          template = '* TODO %^{Task Name} %^T\n#+DESCRIPTION:%?',
          target = '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/agenda.org',
        },
        i = {
          description = 'Work [I]ssue',
          template = '* %?\n** Description\n** Plan\n** Documentation',
          target = '/mnt/c/Users/SpyrosAlepakos/code/notes/allweb/%^{filename}.org',
        },
        o = {
          description = '[O]lympiacos',
          template = '** TODO %^T %? %^{VS}',
          target = '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/olympiacos.org',
        },
      },
      org_default_notes_file = '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/agenda.org',
      mappings = {
        org_return_uses_meta_return = true,
        org = {
          org_toggle_checkbox = false,
          org_timestamp_up_day = false,
          org_timestamp_down_day = false,
          org_priority = false,
          org_todo = false,
          org_todo_prev = false,
          org_toggle_heading = false,
          org_insert_link = false,
          -- org_store_link = false,
          org_open_at_point = false,
          org_edit_special = '<leader>oo',
          org_add_note = false,
          org_global_cycle = false,
          org_insert_todo_heading = false,
          org_move_subtree_down = '<leader>j',
          org_move_subtree_up = '<leader>k',
          org_babel_tangle = false,
          org_archive_subtree = false,
          org_toggle_timestamp_type = '<leader>os',
        },
        edit_src = {
          org_edit_src_abort = false,
          org_edit_src_save = false,
          org_edit_src_save_exit = false,
          org_edit_src_show_help = false,
        },
        note = {
          org_note_finalize = false,
          org_note_kill = false,
        },
        text_objects = {
          inner_heading = { 'ih', desc = '[I]nner [H]eading' },
          around_heading = { 'ah', desc = '[A]round [H]eading' },
          inner_heading_from_root = { 'iH', desc = '[I]nner [H]eading from Root' },
          around_heading_from_root = { 'aH', desc = '[A]round [H]eading from Root' },
          inner_subtree = { 'ir', desc = '[I]nner [S]ubtree' },
          around_subtree = { 'ar', desc = '[A]round [S]ubtree' },
          inner_subtree_from_root = { 'iR', desc = '[I]nner [S]ubtree from Root' },
          around_subtree_from_root = { 'aR', desc = '[A]round [S]ubtree from Root' },
        },
      },
      org_custom_exports = {
        g = {
          label = 'Export to Google Calendar CSV',
          action = function(exporter)
            local current_file = vim.api.nvim_buf_get_name(0)
            local target = '/mnt/c/Users/SpyrosAlepakos/my-brain/calendar-exports/' .. vim.fn.fnamemodify(current_file, ':~:.:r') .. '.csv'
            local export_file = '/home/salep/calendar/export.py'
            local command = { 'python3', export_file, current_file, '-o', target }
            local on_success = function(output)
              print 'Success!'
              vim.api.nvim_echo({ { table.concat(output, '\n') } }, true, {})
            end
            local on_error = function(err)
              print 'Error!'
              vim.api.nvim_echo({ { table.concat(err, '\n'), 'ErrorMsg' } }, true, {})
            end
            return exporter(command, target, on_success, on_error)
          end,
        },
      },
    }
    require('orgmode-multi-key').setup()
    require('org-bullets').setup {
      concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
      symbols = {
        list = '•',
        headlines = { '◉', '○', '✸', '✿' },
        checkboxes = {
          half = { '', '@org.checkbox.halfchecked' },
          done = { '✓', '@org.keyword.done' },
          todo = { '˟', '@org.keyword.todo' },
        },
      },
    }
  end,
}
