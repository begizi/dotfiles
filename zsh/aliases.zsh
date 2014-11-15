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

# vim
alias v='vim .'

# Include custom aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local
