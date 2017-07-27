#!/bin/bash

alias now="date +%Y%m%d_%Hh%M"

alias a="atom ."
alias aa="atom -a ."

alias n="nvim"
alias nv="nvim"

alias tma="tmux a"

function fa() {
	find . -name ${1} -exec atom {} \;
}

alias uofo="while [[ 0 ]]; do sleep 5 && ssh uofo; done"
alias primus="while [[ 0 ]]; do sleep 5 && ssh primus; done"

function cdnow()
{
    current_date=`now`
    mkdir -p ${current_date}
    cd ${current_date}
}

function less()
{
    # Requires GNU Source-highlight (http://www.gnu.org/software/src-highlite/)
    # Gentoo: dev-util/source-highlight
    # ArchLinux: extra/source-highlight
    less_bin=`which less`
    if [[ "`which src-hilite-lesspipe.sh 2> /dev/null`" == "" ]]; then
        ${less_bin} ${@}
    else
        src-hilite-lesspipe.sh ${@} | ${less_bin}
    fi
}

# Gentoo
alias emerge_update_all="sudo emerge --ask --quiet --verbose --update --deep --newuse --tree --keep-going world"
alias resource="source /etc/profile && source ~/.bashrc"

# Call "tail -f" on a file and put timestamp at the begining of each lines.
function tailtime() {
    tail -f ${1} | awk '{now=strftime("%F %T%z\t");sub(/^/, now);print}'
}

alias locate='locate -i'
#alias grep='grep -n'
alias nano='nano -w'
#alias screen="screen -U -R"
alias df="df -h --print-type"
alias du="du -h -d 1"
alias free='free -m'
alias grpe='grep'
alias top="htop"
alias untar="tar -xvf"
#alias untar="tar -zxvf"
#alias untarj="tar -jxvf"
alias pingg="ping -c 3 www.google.com"
alias octave='octave --quiet'
alias ipython='ipython --pylab'
alias ipython2='ipython2 --pylab'
function pss() {
	ps auxf | grep -i "$@" | grep -v grep | grep --color=auto -i "$@"
}
alias pstree="ps axjf | less"
alias scpr='rsync --partial --progress'

alias dc='cd'
alias sl='ls'
alias sls='ls'
alias l='ls'
alias rm='rm -i'
lsbase='/bin/ls -h --group-directories-first --color=auto'
alias ls="$lsbase -l"
alias la="$lsbase -la"

alias cdt='cd ~/Downloads'


# Sudo's
# Command line apps
#alias sudo='sudo -E'
#alias su='sudo -i'
#alias su='sudo /bin/bash'
alias su='sudo su -'
alias snano='sudo nano'
alias svim='sudo vim'
alias powertop='sudo powertop'


############################
# Functions

function aur() {
    cd ${HOME}/aur
    package=${1}
    git clone https://aur.archlinux.org/${package}.git
    cd ${package}
    echo "--------------------------"
    echo "Start 'makepkg'? [Y/n]"
    read -s answer
    if [[ "$answer" == "" || "$answer" == "Y" || "$answer" == "y" || "$answer" == "yes" || "$answer" == "oui" || "$answer" == "o" ]]; then
        makepkg
    fi
}

killp () {
    pss $1 | awk '{print ""$2""}' | xargs kill -9
}

function ss() {
    grep -irn "$@" src/*  | sed "s|\(.*\):\([0-9]\+\):\(.*\)|\1  Line \2  \3|g"
}
function ssi() {
    grep -rn "$@" src/*  | sed "s|\(.*\):\([0-9]\+\):\(.*\)|\1  Line \2  \3|g"
}

alias sup="svn update"

alias gl='git log --pretty=format:"%Cgreen%h %Creset %s %Cblueby %an (%ar) %Cred %d" --graph'
alias gla='git log --all --pretty=format:"%Cgreen%h %Creset %Cred%d%Creset %s %Cblueby %an (%ar)" --graph'
alias glm='gl --first-parent master'


#alias gd='git diff $* | kompare - &'
alias gg='gitg 2> /dev/null &'
alias gu='git gui &'
alias gk='gitk --all &'
alias gps='git push'
alias gpl='git pull'
function gpull() {
    current_branch=`git symbolic-ref HEAD | sed "s|refs/heads/||g"`
    remote=${1-origin}
    git fetch
    git rebase ${remote}/${current_branch} ${current_branch}
}
alias gitignorefurther='git update-index --assume-unchanged'

# http://www.catonmat.net/blog/git-aliases/
alias ga='git add'
alias gp='git push'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch --all --verbose'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'


function check_memory() {
    while [ 1 ]; do pmap -d `pidof $1` | grep writeable | sed "s|K||g" | awk '{print ""$4" KiB    "$4/1024" MiB    "$4/1024/1024" GiB"}' ; sleep 0.1 ;done 2> /dev/null
}
alias cm=check_memory


alias qmlscene55lgpl="~/Qt/LGPL/5.5/gcc_64/bin/qmlscene"
alias qmlscene56lgpl="~/Qt/LGPL/5.6/gcc_64/bin/qmlscene"
alias qmlscene551debug="~/opt/Qt/5.5.1/debug/bin/qmlscene"
alias qmlscene551release="~/opt/Qt/5.5.1/release/bin/qmlscene"
