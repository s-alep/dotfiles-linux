local dap = require('dap')

dap.adapters.php = {
    type = 'executable',
    command = 'php-debug-adapter', -- or full path to it
    args = {},
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003,
        pathMappings = {
            ['/var/www/html'] = '${workspaceFolder}', -- DDEV web root
            ['/var/www/html/web'] = '${workspaceFolder}/web', -- DDEV web root
        },
    },
}
