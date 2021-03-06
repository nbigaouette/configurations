#!/bin/bash

# enable bash completion in interactive shells
[[ -f /etc/bash_completion ]] && source /etc/bash_completion

export EDITOR="vim"

export BASH_CONFIG_FOLDER="${HOME}/.configurations.git"

[[ -f ${BASH_CONFIG_FOLDER}/fuzzy_searches.sh ]]    && source ${BASH_CONFIG_FOLDER}/fuzzy_searches.sh
[[ -f ${BASH_CONFIG_FOLDER}/ssh-agent.sh ]]         && source ${BASH_CONFIG_FOLDER}/ssh-agent.sh
[[ -f ${BASH_CONFIG_FOLDER}/tmux_launch.sh ]]       && source ${BASH_CONFIG_FOLDER}/tmux_launch.sh
# [[ -f ${BASH_CONFIG_FOLDER}/cgroups_cpu_scheduling.sh ]] && source ${BASH_CONFIG_FOLDER}/cgroups_cpu_scheduling.sh
[[ -f ${BASH_CONFIG_FOLDER}/fancybash.sh ]]         && source ${BASH_CONFIG_FOLDER}/fancybash.sh
[[ -f ${BASH_CONFIG_FOLDER}/up_down_arrows.sh ]]    && source ${BASH_CONFIG_FOLDER}/up_down_arrows.sh
[[ -f ${BASH_CONFIG_FOLDER}/aliases.sh ]]           && source ${BASH_CONFIG_FOLDER}/aliases.sh
[[ -f ${BASH_CONFIG_FOLDER}/sudo_autocomplete.sh ]] && source ${BASH_CONFIG_FOLDER}/sudo_autocomplete.sh
#[[ -f ${BASH_CONFIG_FOLDER}/bash_insensitive.sh ]]  && source ${BASH_CONFIG_FOLDER}/bash_insensitive.sh
#[[ -f ${BASH_CONFIG_FOLDER}/max_mem.sh ]]           && source ${BASH_CONFIG_FOLDER}/max_mem.sh

# [[ -f ${BASH_CONFIG_FOLDER}/generate_ssh_keys.sh ]] && source ${BASH_CONFIG_FOLDER}/generate_ssh_keys.sh
# [[ -f ${BASH_CONFIG_FOLDER}/ssh-login.sh ]]         && source ${BASH_CONFIG_FOLDER}/ssh-login.sh
