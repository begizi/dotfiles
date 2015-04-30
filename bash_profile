
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin
export PATH=/Users/begizi/bin/:$PATH
export PATH=/usr/local/Cellar/go/bin/:$PATH
export RABBITMQ_HOME=/usr/local/Cellar/rabbitmq/2.7.1
export HOMEBREW_LIBRARY_PATH=$HOMEBREW_LIBRARY_PATH:$LD_LIBRARY_PATH
export CPLUS_INCLUDE_PATH=/usr/local/include:$CPLUS_INCLUDE_PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:/usr/local/lib/python:$PYTHONPATH
export LDFLAGS=-L/usr/local/Cellar/readline/6.2.2/lib
export CPPFLAGS=-I/usr/local/Cellar/readline/6.2.2/include
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export GOPATH=/usr/local/Cellar/go
eval "$(direnv hook bash)"

source $HOME/.aliases 2> /dev/null


export NVM_DIR="/Users/begizi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
