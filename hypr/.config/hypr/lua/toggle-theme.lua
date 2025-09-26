#!/usr/bin/lua
function execute_command(cmd)
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    handle:close()
    return result:gsub("%s+$", "")
end

function set_light_mode()
    os.execute("gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'")
    print("Light mode activated")
end

function set_dark_mode()
    os.execute("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
    print("Dark mode activated")
end

function toggle_mode()
    local current_scheme = execute_command("gsettings get org.gnome.desktop.interface color-scheme")
    if current_scheme == "'prefer-dark'" then
        set_light_mode()
    else
        set_light_mode()
        set_dark_mode()
    end
end

toggle_mode()
