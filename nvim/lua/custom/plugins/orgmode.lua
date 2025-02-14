return {
  'nvim-orgmode/orgmode',
  dependencies = {
    'nvim-orgmode/org-bullets.nvim',
    -- 'lukas-reineke/headlines.nvim',
  },
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup {
      org_agenda_files = '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/**/*',
      org_blank_before_new_entry = {
        heading = false,
        plain_list_item = false,
      },
      org_capture_templates = {
        c = {
          description = 'Agenda Task',
          template = '* TODO %^{Task Name} %^T\n#+DESCRIPTION:%?',
          target = '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/agenda.org',
        },
        o = {
          description = 'Olympiacos',
          template = '** TODO %^T %? %^{VS }',
          target = '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/olympiacos.org',
        },
      },
      org_default_notes_file = '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/agenda.org',
      mappings = {
        org_return_uses_meta_return = true,
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

    -- require('headlines').setup()
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
