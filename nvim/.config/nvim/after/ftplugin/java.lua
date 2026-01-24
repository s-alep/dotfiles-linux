local dap = require 'dap'


dap.adapters.java = function(callback)
    callback({
        type = 'server';
        host = '127.0.0.1';
        port = 5005;
    })
end

dap.configurations.java = {
    {
        classPaths = {},
        projectName = "Hello",
        javaExec = "/usr/bin/java",
        mainClass = "Hello",
        modulePaths = {},
        name = "Launch Hello",
        request = "launch",
        type = "java"
    },

}
