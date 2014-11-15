# Main PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/mysql/bin

# Add home bin to PATH
export PATH=$HOME/bin/:$PATH

# Homebrew
export PATH=/usr/local/Cellar/go/bin/:$PATH
export HOMEBREW_LIBRARY_PATH=$HOMEBREW_LIBRARY_PATH:$LD_LIBRARY_PATH
export LDFLAGS=-L/usr/local/Cellar/readline/6.2.2/lib
export CPPFLAGS=-I/usr/local/Cellar/readline/6.2.2/include

# Rabbit MQ
export RABBITMQ_HOME=/usr/local/Cellar/rabbitmq/2.7.1
export CPLUS_INCLUDE_PATH=/usr/local/include:$CPLUS_INCLUDE_PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:/usr/local/lib/python:$PYTHONPATH

# GOPATH
export GOPATH=/usr/local/Cellar/go

# direnv hook for auto env setup
eval "$(direnv hook zsh)"
