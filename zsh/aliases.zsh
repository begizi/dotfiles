# Unix
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias ...='../..'
alias l='ls'
alias ll='ls -al'
alias lh='ls -Alh'
alias up='cd ..'
alias desk='cd ~/Desktop'
alias c='clear'

# git
alias g='git'
alias gs='git status -sb'

# gist
alias gist='gist -p -c -s'

# vim
alias v='vim .'

# tmux
alias mux='tmuxinator'
alias mu='tmuxinator start'

# Include custom aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local
