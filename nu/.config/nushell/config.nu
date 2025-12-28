$env.EDITOR = 'nvim'
$env.TERM = 'xterm-256color'
$env.MANPAGER = 'nvim +Man!'
$env.SSH_AUTH_SOCK = ''

$env.config.show_banner = false
$env.config.table.header_on_separator = true
$env.config.buffer_editor = "nvim"

alias lid = ~/.config/hypr/lua/lid.lua 0

alias v = nvim
alias V = sudo nvim
alias z = zed
alias Z = sudo zed
alias la = ls -a
alias cat = bat
alias x = xdg-open
alias lg = lazygit
alias ld = lazydocker
alias dpod = devpod up --devcontainer-path .devpod/devcontainer.json .
alias cr = ddev drush cr
alias today = nvim ~/Documents/Thanks/$"(date now | format date '%Y-%m-%d').md"

def docls [] {
    ^docker kill ...( ^docker ps -q | lines)
}

def dps [] {
    docker ps | from ssv | select NAMES PORTS
}

def conf [] {
    fd -d 1 -td -L . ~/.config | fzf --height=30% --border=rounded | xargs -r nvim
}

def --env d [] {
        ^fd --absolute-path -t d -d 2 . $"($env.HOME)/Documents/dev"
        | fzf
        | str trim
        | str substring 0..-2
        | cd $in
}

def paruf [] {
    paru -Slq | fzf --multi --preview 'paru -Sii {1}' --preview-window=down:75% | xargs -ro paru -S
}

def paruq [] {
    paru -Q | fzf --multi --preview 'paru -Sii {1}' --preview-window=down:75% | xargs -ro paru -Rns
}

def ddap [container_name : string = '0'] {
    mut container = $container_name 
    if $container == '0' {
        let lines = (^docker ps | lines | length | into int)
        if $lines > 0 {
            $container = ^docker ps --format "{{.Names}}"  | fzf
        } 
    }
    docker exec -it $container python -m debugpy --listen 0.0.0.0:5678 -m flask run
}

def dsh [container_name : string = '0'] {
    mut container = $container_name 
    if $container == '0' {
        let lines = (^docker ps | lines | length | into int)
        if $lines > 0 {
            $container = ^docker ps --format "{{.Names}}"  | fzf
        } 
    }
    docker exec -it $container /bin/bash
}

def nam [] {
    let entry =  man -k . | fzf
        | str replace "(" ""
        | str replace ")" ""
        | split column ' '
        | get column1
    let section = $entry | find -r '([0-9]\+)'
    if section != "" {
        man ...($section) ...($entry)
        return
    }
    man ...($entry)

}

def flask [] {
    let lines = (^docker ps | lines | length | into int)
    if $lines > 1 { 
        ^docker kill ...( ^docker ps -q | lines)
        print "All containers are killed."
    }
    devpod up .
    let running_containers = docker ps --format "{{.Names}}" | lines
    let container = $running_containers | where ($it =~ 'flask') | get 0
    docker exec -it $container python -m debugpy --listen 0.0.0.0:5678 -m flask run
}

$env.CARGO = '/home/salepakos/.cargo/bin'
$env.LOCAL = '/home/salepakos/.local/bin'
$env.BUN = '/home/salepakos/bun/bin'

$env.PATH = ($env.PATH | append $env.CARGO | append $env.LOCAL | append $env.BUN)
