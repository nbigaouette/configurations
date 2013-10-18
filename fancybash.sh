#!/bin/bash

#################################################
## fancybash - by Veit Wahlich <cru@ircnet.de> ##
## A coloured Bash prompt with extra features. ##
#################################################
## Non-Warranty Installation:                  ##
##                                             ##
## Need help? Find a solution at:              ##
## http://ircnet.de/home/cru/fancybash/        ##
##                                             ##
## Color codes:                                ##
## http://www-106.ibm.com/developerworks       ##
## /linux/library/l-tip-prompt/                ##
#################################################


if [ `id -u` -gt 0 ]; then
# normal user
    C1='[1;34m'
    C3='[1;34m'
    C2='[0;34m'
    C4='[0m'
    C5='[1;31m'
else
# root
    C1='[1;31m'
    C2='[1;34m'
    C3='[0;34m'
    C4='[0m'
    C5='[1;34m'
fi

extra=""
if [[ -f /Arch32 ]]; then
    extra=":ARCH32"
elif [[ -f /Arch64 ]]; then
    extra=":ARCH64"
fi

# Add git branch name but skip if on unicron's compute nodes
function fgit_branch() {
    hostname=`hostname`
    git_branch=""
    git_commit=""
    if [[ "${hostname:0:4}" != "node" ]]; then
        git_branch=$(__git_ps1 "%s")
        if [[ -d .git ]]; then
            git_commit=`git rev-parse HEAD`
        fi
    fi
    if [[ "${git_commit}" == "" ]]; then
        echo ""
    else
        echo " (${git_branch},${git_commit})"
    fi
}

PS1='\[${C2}\](\[${C1}\]\u\[${C3}\]@\[${C5}\]\h${extra}\[${C3}\]:\[${C1}\]\l\[${C2}\])\[${C3}\]-\[${C2}\](\[${C1}\]$(ls -1|wc -l|tr -d "[:blank:]") files\[${C3}\]:\[${C1}\]$(ls -sh|head -n 1|sed "s/.*//")\[${C3}\]@\[${C1}\]\W\[${C2}\])\[${C3}\]-\[${C2}\](\[${C1}\]$(date +%H)\[${C3}\]:\[${C1}\]$(date +%M)\[${C2}\])\n\[${C2}\](\[${C1}\]\w\[${C3}\]$(fgit_branch):\[${C1}\]\$\[${C2}\])\[${C3}\]\n ->\[${C4}\] '

export PS1


