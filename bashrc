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

### Kubernetes 
 alias k="kubectl"
 alias kgc='/usr/local/bin/kubectl config get-contexts'
 alias kuc='/usr/local/bin/kubectl config use-context '

 function kns(){
     kubectl config set-context $(kubectl config current-context) --namespace=$1
 }

### Docker
alias dc="docker-compose"
alias dcup="docker-compose up"
alias dcdown="docker-compose down"
alias dcb="docker-compose build"

### Bash prompt format
function prompt {
  local BLACKBOLD="\[\033[1;30m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"

  export PS1="\t$BLACKBOLD \u$WHITE in $WHITEBOLD\w $RESETCOLOR$ "
}
prompt

  # local BLACK="\[\033[0;30m\]"
  # local RED="\[\033[0;31m\]"
  # local REDBOLD="\[\033[1;31m\]"
  # local GREEN="\[\033[0;32m\]"
  # local GREENBOLD="\[\033[1;32m\]"
  # local YELLOW="\[\033[0;33m\]"
  # local YELLOWBOLD="\[\033[1;33m\]"
  # local BLUE="\[\033[0;34m\]"
  # local BLUEBOLD="\[\033[1;34m\]"
  # local PURPLE="\[\033[0;35m\]"
  # local PURPLEBOLD="\[\033[1;35m\]"
  # local CYAN="\[\033[0;36m\]"
  # local CYANBOLD="\[\033[1;36m\]"