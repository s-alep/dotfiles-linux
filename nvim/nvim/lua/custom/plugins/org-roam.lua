return {
  'chipsenkbeil/org-roam.nvim',
  tag = '0.1.1',
  dependencies = {
    {
      'nvim-orgmode/orgmode',
    },
  },
  config = function()
    require('org-roam').setup {
      org_files = {
        '~/syncthing/my-brain/org-files/journal/**/*',
      },
      extensions = {
        dailies = {
          directory = '~/syncthing/my-brain/org-files/journal/',
        },
      },
    }
  end,
}
