local dbg  = require "dap"

require('dap-python').setup 'python3'

dbg.configurations.python = {
    {
        name = 'Python Attach to container',
        type = 'python',
        request = 'attach',
        port = 5678,
        host = 'localhost',
        pathMappings = {
            {
                localRoot = '${workspaceFolder}',
                remoteRoot = '/workspace',
            },
        },
    },
    {
        name = 'Python FastAPI',
        type = 'python',
        request = 'launch',
        module = 'fastapi',
        args = {
            'dev',
            'main.py',
        },
        jinja = 'true',
    },
    {
        name = 'Python Flask',
        type = 'python',
        request = 'launch',
        module = 'flask',
        args = {
            'run',
        },
        jinja = 'true',
    },
    {
        name = 'Uvicorn',
        type = 'python',
        request = 'launch',
        module = 'uvicorn',
        args = {
            'app.main:app', -- Adjust if needed
            '--host',
            '0.0.0.0',
            '--port',
            '8000',
            '--reload',
        },
    },
}
