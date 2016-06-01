# docker
function docker-up () {
  eval "$(docker-machine env default)"
}

# Log commands profile log folder for future use
precmd() { eval 'echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history | tail -n1 | sed "s/^[ ]*[0-9]\+[ ]*//" )" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log'}
