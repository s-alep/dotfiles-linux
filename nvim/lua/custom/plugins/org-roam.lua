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
      directory = '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/notes/',
      org_files = {
        '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/music-notes/',
        '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/journal/',
      },
      extensions = {
        dailies = {
          directory = '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/journal/',
        },
      },
      templates = {
        i = {
          description = 'Issue',
          template = '\n* Description\n%?\n* Subtasks\n** Think\n* Documentation',
          target = '/mnt/c/Users/SpyrosAlepakos/my-brain/org-files/notes/%<%Y%m%d%H%M%S>-%[slug].org',
        },
      },
    }
  end,
}
