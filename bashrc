alias code\.='code .'
alias cd\.\.='cd ..'

port() {
    echo -e "\033ECommand you ran: \033[1mlsof -i:$1\033[m\033E"
    lsof -i:$1
    echo
}

### Git stuff
alias gist='echo && git status'
checkback() {  
  echo -e "\033[1m"
  msg=$(git checkout -)
  msg=${msg//"M"/"\033[mm"}
  msg=${msg//"Your"/"\033[mYour"}
  echo -e "\033E\033[m$msg\033E"
}
### AWS
export AWS_PROFILE=something

### Kubernetes 
  alias k="kubectl"
  alias kgc='/usr/local/bin/kubectl config get-contexts'
  alias kuc='/usr/local/bin/kubectl config use-context '
  function kns(){
    kubectl config set-context $(kubectl config current-context) --namespace=$1
  }
  function kbash(){
    CONTAINER=""
    if [ $# -ge 2 ]
    then
      CONTAINER="-c $2"
    fi
    kubectl exec -it $1 $CONTAINER bash
  }
  function wsgilogs(){
    kubectl logs -f $1 -c uwsgi-backend
  }

### Docker
alias dc="docker-compose"
alias dcup="docker-compose up"
alias dcdown="docker-compose down"
alias dcbash="dbash"
# open a bash prompt for $container; only works in the folder with the compose files.
function dbash(){
  CONTAINER=""
  if [ $# -ge 2 ]
  then
    CONTAINER="-c $2"
  fi
  if [ ! -f docker-compose.yml ]; then 
    printf "No docker-compose in this folder.\n"
    # exit 0
  else
    docker-compose exec $1 bash
  fi
}

### Bash history
  export HISTSIZE=1000
  export HISTCONTROL=ignoreboth


# python versioning
eval "$(pyenv init -)"

# autocorrect for bash
eval "$(thefuck --alias)"
eval "$(thefuck --alias FUCK)"

### Bash prompt format
function prompt {
  local C_BLACKBOLD="\[\033[1;30m\]"
  local C_WHITE="\[\033[0;37m\]"
  local C_WHITEBOLD="\[\033[1;37m\]"
  local C_RESETCOLOR="\[\e[00m\]"

  export PS1="\t$C_BLACKBOLD \u$C_WHITE in $C_WHITEBOLD\w $C_RESETCOLOR$ "
}
prompt

# demo the colors
function colors {
  echo -e "\033[0;37mWHITE\t \033[1;37mBRIGHT_WHITE"
  echo -e "\033[0;30mBLACK\t \033[1;30mLIGHT_BLACK"
  echo -e "\033[0;34mBLUE\t \033[1;34mLIGHT_BLUE"
  echo -e "\033[0;32mGREEN\t \033[1;32mLIGHT_GREEN"
  echo -e "\033[0;36mCYAN\t \033[1;36mLIGHT_CYAN"
  echo -e "\033[0;31mRED\t \033[1;31mLIGHT_RED"
  echo -e "\033[0;35mPURPLE\t \033[1;35mLIGHT_PURPLE"
  echo -e "\033[0;33mYELLOW\t \033[1;33mLIGHT_YELLOW"
  echo -e "\033[0mNC (No color)"
  echo -e 
}

# all the pretty colors
# C_BLACK="\[\033[0;30m\]"
# C_RED="\[\033[0;31m\]"
# C_REDBOLD="\[\033[1;31m\]"
# C_GREEN="\[\033[0;32m\]"
# C_GREENBOLD="\[\033[1;32m\]"
# C_YELLOW="\[\033[0;33m\]"
# C_YELLOWBOLD="\[\033[1;33m\]"
# C_BLUE="\[\033[0;34m\]"
# C_BLUEBOLD="\[\033[1;34m\]"
# C_PURPLE="\[\033[0;35m\]"
# C_PURPLEBOLD="\[\033[1;35m\]"
# C_CYAN="\[\033[0;36m\]"
# C_CYANBOLD="\[\033[1;36m\]"