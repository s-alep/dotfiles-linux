[[ $- != *i* ]] && return

bind '"\C-j": ""'

alias v='nvim'
alias V='sudo nvim'
alias src='source ~/.bashrc'
alias edt='nvim ~/.bashrc'
alias ls='ls -g --group-directories-first --color'
alias la='ls -gA --group-directories-first --color'

eval "$(starship init bash)"
eval "$(fzf --bash)"
bind -m emacs-standard '"\ec":""'
bind -m emacs-standard '"\C-f": "\C-u`__fzf_cd__`\r\n"'

export FZF_PREVIEW_COLUMNS=40
export FZF_PREVIEW_LINES=10
export EDITOR='nvim'
export TERM='xterm-256color'
export MANPAGER='nvim +Man!'
