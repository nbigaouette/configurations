#!/bin/bash

function generate_ssh_key()
{
    key_type=${1}

    if [[ ! -f ${HOME}/.ssh/id_${key_type} ]]; then
        ssh-keygen -t ${key_type} -f ${HOME}/.ssh/id_${key_type} -N ''
    fi
}

generate_ssh_key rsa
# generate_ssh_key dsa
generate_ssh_key ecdsa
