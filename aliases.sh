#!/bin/bash

alias locate='locate -i'
alias aurbuild="sudo env EDITOR=nano aurbuild"
alias burn_dvd_iso='growisofs -speed=2 -dvd-compat -Z /dev/dvdrw='
#alias grep='grep -n'
alias nano='nano -w'
#alias screen="screen -U -R"
alias df="df -h --print-type"
alias du="du -h --max-depth=1"
alias free='free -m'
alias grpe='grep'
alias top="htop"
alias untar="tar -xvf"
#alias untar="tar -zxvf"
#alias untarj="tar -jxvf"
alias gmplayer="gmplayer -really-quiet"
alias mp="mousepad"
alias pingg="ping -c 3 www.google.com"
alias kw='kwrite'
#alias ku='kate -u'
alias ku='/home/nicolas/fichiers/scripts/open_file_in_active_kate_session.sh'
alias ki='kile '
alias kwp='kate --start PKGBUILDs --new PKGBUILD &'
#alias kwp='kwrite PKGBUILD &'
alias octave='octave --quiet'
alias ipython='ipython -pylab'
function pss() {
    ps aux | grep -i "$@" | grep -v grep
}
alias scpr='rsync --partial --progress'

#alias arch32='dchroot -d bash'
alias arch32='schroot -p -c Arch32'
alias makepkg32='dchroot -d makepkg'
alias to64="sed -e \"s/arch=.*/arch=('i686' 'x86_64')/g\" -i PKGBUILD"
alias c32="schroot -p -c chroot32"
alias c64="schroot -p -c chroot64"

function extract_initrc() {
    gunzip < $1 | cpio -i --make-directories
}

alias dc='cd'
alias sl='ls'
alias sls='ls'
alias l='ls'
alias rm='rm -i'
lsbase='/bin/ls -h --group-directories-first --color=auto'
alias ls="$lsbase -gG"
alias lsg="$lsbase -l"
alias la="$lsbase -la"

fichiers=/home/nicolas/fichiers
doc=$fichiers/documents/universite/doc
PKGBUILDs=$fichiers/programmes/PKGBUILDs
alias cdh='cd $fichiers'
alias cdt='cd $fichiers/downloads'
alias cdd='cd $doc'
alias cdm='cd $doc/our_papers/mapping.git'
alias cddn='cd $doc/notes'
alias cdmd='cd $doc/code/projects/md.git'
alias cdpr='cd $doc/code/projects/PIC3D.svn'
alias cdpi='cd $doc/code/projects/ionization.svn'
alias cdpt='cd $doc/code/projects/treecode.svn'
alias cdpq='cd $doc/code/projects/quantumfdtd.git'
alias cdp='cd $doc/code/projects'
alias cdpk='cd $fichiers/programmes/PKGBUILDs'


# Sudo's
# Command line apps
alias sudo='sudo -E'
#alias su='sudo -i'
#alias su='sudo /bin/bash'
alias su='sudo su -'
alias shutdown="sudo shutdown"
alias halt="sudo halt"
alias nanos='sudo nano'
alias snano='sudo nano'
alias svim='sudo vim'
alias cpufreq-set='sudo cpufreq-set'
alias pac='pacman -Syu'
alias pacman='sudo -E pacman'
alias kismet='sudo kismet'
alias modprobe='sudo modprobe'
alias telinit='sudo telinit'
alias mount='sudo mount'
alias umount='sudo umount'
alias powertop='sudo powertop'

alias yaourt='yaourt --export /home/nicolas/fichiers/programmes/ArchLinux/pkg_cache'


############################
# Functions

function aur() {
    cd $fichiers/programmes/PKGBUILDs/aur
    url=${1}
    tarball=${url##http*/}
    wget ${url}
    untar ${tarball}
    rm -f ${tarball}
    cd ${tarball/.tar.gz/}
    echo "--------------------------"
    echo "Start 'makepkg'? [Y/n]"
    read -s answer
    if [[ "$answer" == "" || "$answer" == "Y" || "$answer" == "y" || "$answer" == "yes" || "$answer" == "oui" || "$answer" == "o" ]]; then
        makepkg
    fi
}

biggest() {
	if [[ $1 -gt $2 ]]; then
		return $1
	else return $2
	fi
}

killp () {
    pss $1 | awk '{print ""$2""}' | xargs kill -9
}

function sdiff() {

    #svn diff $1 | meld -o -
    svn diff $1 | kompare -o -
    #svn diff $1 | beediff -o -
}
alias svnd='sdiff &'
alias sd='sdiff &'
#alias sd='meld . &'
alias sc='svn commit'
alias st='svn status'
alias sup='svn update'
alias sl='svn log --stop-on-copy'

function ss() {
    grep -irn "$@" src/*  | grep -v svn | sed "s|\(.*\):\(.*\):\(.*\)|\1 l\2 : \3|g"
}
function ssi() {
    grep -rn "$@" src/*  | grep -v svn | sed "s|\(.*\):\(.*\):\(.*\)|\1 l\2 : \3|g"
}

alias gl='git log --pretty=oneline --graph'
alias gt='git status'
alias gs='git status'
alias gc='git commit'
alias gca='git commit -a -m'
#alias gd='git diff $* | kompare - &'
alias gd='meld . &'
alias gg='gitg &'
alias gu='git gui'
alias gk='gitk --all &'
alias gps='git push --all'
alias gpl='git pull'
function gpull() {
    current_branch=`git symbolic-ref HEAD | sed "s|refs/heads/||g"`
    remote=${1-origin}
    git fetch
    git rebase ${remote}/${current_branch} ${current_branch}
}

alias git_clone_qf='git clone ssh://op/git/nicolas/quantumfdtd.git $1'
alias git_clone_md='git clone ssh://op/git/nicolas/md.git $1'

alias git_sharcnet='git archive --format=tar HEAD | ssh -C sn "cat > /home/nbiga058/code/${gitCODE}/${gitCODE}.tar && cd /home/nbiga058/code/${gitCODE} && tar -xvf /home/nbiga058/code/${gitCODE}/${gitCODE}.tar"'
alias git_xenakis='git archive --format=tar HEAD | ssh -C xenakis "cat > /home/hpc1994/code/${gitCODE}/${gitCODE}.tar && cd /home/hpc1994/code/${gitCODE} && tar -xvf /home/hpc1994/code/${gitCODE}/${gitCODE}.tar"'
alias git_hpcvl='git archive --format=tar HEAD | ssh -C hpcvl "cat > /home/hpc1994/code/${gitCODE}/${gitCODE}.tar && cd /home/hpc1994/code/${gitCODE} && tar -xvf /home/hpc1994/code/${gitCODE}/${gitCODE}.tar"'
alias git_lonestar='git archive --format=tar HEAD | ssh -C lonestar "cat > /home/01184/lramunno/code/${gitCODE}/${gitCODE}.tar && cd /home/01184/lramunno/code/${gitCODE} && tar -xvf /home/01184/lramunno/code/${gitCODE}/${gitCODE}.tar"'
alias git_discovery='git archive --format=tar HEAD | ssh -C discovery "cat > /home/lramunno/code/${gitCODE}/${gitCODE}.tar && cd /home/lramunno/code/${gitCODE} && tar -xvf /home/lramunno/code/${gitCODE}/${gitCODE}.tar"'

function grb_track() {
    RemoteBranch="${@}"
    git fetch origin
    git branch --track $RemoteBranch origin/$RemoteBranch
    git checkout $RemoteBranch
    git branch -a
}

function grb_create() {
    RemoteBranch="${@}"
    git push origin implicit:refs/heads/$RemoteBranch
    git fetch origin
    git branch --track $RemoteBranch origin/$RemoteBranch
    git checkout $RemoteBranch
    git branch -a
}

function rsync_unicron() {
    # rsync --progress -aze ssh u:/raid/nicolas/output/md_production_Ar/ output/
    if [[ "x${1}" == "x" ]]; then
        echo "Usage:"
        echo "rsync_unicron /full/path/on/unicron/ local/folder/"
        echo "Will transfer everything using rsync"
        return
    fi
    rsync --progress -aze ssh u:${1} ${2}
}

function check_memory() {
    while [ 1 ]; do pmap -d `pidof $1` | grep writeable | sed "s|K||g" | awk '{print ""$4" KiB    "$4/1024" MiB    "$4/1024/1024" GiB"}' ; sleep 0.1 ;done 2> /dev/null
}
alias cm=check_memory

alias ssync='while [ 1 ]; do echo -n "Syncing..." && date && sync && sleep 3; done'
