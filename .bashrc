_prompt_command() {
    local EXIT="$?"

    source /usr/local/etc/bash_completion.d/git-prompt.sh

    PS1=""

    local red="$(tput setaf 1)"
    local green="$(tput setaf 2)"
    local yellow="$(tput setaf 3)"
    local blue="$(tput setaf 4)"
    local purple="$(tput setaf 5)"
    local teal="$(tput setaf 6)"
    local white="$(tput setaf 7)"
    local grey="$(tput setaf 8)"
    local orange="$(tput setaf 9)"
    local reset="$(tput sgr0)"

    local git='$(__git_ps1 " on \[\e[0;33m\]%s\[\e[m\]")'

    local user="\[$teal\]\u\[$reset\]"
    local host="\[$blue\]\h\[$reset\]"
    local workdir=" at \[$purple\]\w\[$reset\]"

    if [[ "$EXIT" != 0 ]]; then
	PS1+="\[$red\]($EXIT)\[$reset\] "
    fi

    PS1+="\n┌─ $user@$host$workdir$git\n└─ \$ "
}

_umbel_proxy_commands() {
    # sshpf $local_port $remote_port $host - create tunnel to remote host proxied through ops
    # Example: sshpf 7000 15672 rabbitmq0  # Now can access rabbit on http://localhost:7000
    sshpf () { ssh -o "ProxyCommand ssh -q ops nc -q0 %h 22" -L$1:127.0.0.1:$2 $3 ; }
    # ssho $host - ssh proxied through ops
    # Example: ssho rabbitmq0
    ssho () { ssh -o "ProxyCommand ssh -q ops nc -q0 %h 22" $1 ; }
    scpo () { scp -o "ProxyCommand ssh -q ops nc -q0 %h 22" $* ; }
}

_stupid_shit() {
    declare SAY_SERVER="10.20.1.30"
    export SAY_PORT="6666"
    yell () { echo $@ | nc $SAY_SERVER $SAY_PORT; }
    holyshit () { yell "[[inpt TUNE]] h {D 100; P 233.08:0 233.08:100} OW {D 200; P 233.08:0 233.08:100} l {D 100; P 220:0 220:100} IY {D 200; P 220:0 220:100} f {D 100; P 233.08:0 233.08:100} AA {D 500; P 233.08:0 233.08:100} k {D 100; P 174.61:0 174.61:100} IY {D 500; P 174.61:0 174.61:100} n {D 50; P 174.61:0 174.61:100} g {D 50; P 174.61:0 174.61:100} S {D 100; P 155.56:0 155.56:100} IH {D 400; P 155.56:0 155.56:100} t {D 100; P 155.56:0 155.56:100} IH {D 200; P 233.08:0 233.08:100} t {D 100; P 233.08:0 233.08:100} s {D 100; P 233.08:0 233.08:100} AA {D 200; P 220:0 220:100} d {D 100; P 233.08:0 233.08:100} AY {D 500; P 233.08:0 233.08:100} n {D 100; P 174.61:0 174.61:100} OW {D 400; P 174.61:0 174.61:100} s {D 200; P 155.56:0 155.56:100} OW {D 500; P 155.56:0 155.56:100} r {D 200; P 155.56:0 155.56:100}"; }
    noice () { yell "[[inpt TUNE]] n {D 3000; P 100:0 300:100 } +OY {D 500; P 400:0 10:100} s {D 200; P 100:0 100:100}"; }
}

_docker_cmds() {
    dprune () {
	docker rmi -f "$(docker images -q -a -f dangling=true)"
    }
}

_set_go_vars() {
    # gopath stuff
    export GOROOT="$HOME/go1.6"
    export GOPATH="$HOME/src/go"
    export GOBIN="$GOPATH/bin"
    export PATH="$PATH:$GOBIN"
}

_set_aliases() {
    # useful aliases
    alias ls="ls -G"
    alias ed='ed -p ":"'
    alias emacs='emacsclient -nw' 
}

_set_vmware_path () {
    # path to include vmware app catalyst
    export PATH="$PATH:/opt/vmware/appcatalyst/bin"
}

_set_bash_history () {
    export HISTFILESIZE=1000000
    export HISTSIZE=1000000
    export HISTCONTROL=ignoredups:erasedups  
    export HISTIGNORE='ls:bg:fg:history'
    export HISTTIMEFORMAT='%F %T '
    shopt -s histappend
    shopt -s cmdhist
    export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
    
}

_setup_virtualenvwrapper () {
    source /usr/local/bin/virtualenvwrapper.sh
}

_set_defaults () {
    export EDITOR='emacsclient -nw'
    export USE_DLITE=1
}

main() {
    _prompt_command
    _umbel_proxy_commands
    _set_go_vars
    _set_aliases
    _docker_cmds
    _set_vmware_path
    _stupid_shit
    _set_bash_history
    _set_defaults
    _setup_virtualenvwrapper
}

main
