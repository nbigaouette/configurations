#!/bin/bash

# Copyright 2010 Nicolas Bigaouette <nbigaouette @t gmail com>
# This file is part of configurations.git.
# http://github.com/nbigaouette/configurations
#
# configurations.git is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# configurations.git is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with configurations.git. If not, see <http://www.gnu.org/licenses/>.


# http://forums.gentoo.org/viewtopic-p-6351393.html#6351393
# Make sure we are not already in a tmux session
if [[ -z "$TMUX" ]]; then
    timeout=2
    echo "Press any key to cancel tmux launch (${timeout} seconds timeout)."
    if read -s -n 1 -t ${timeout}; then
        echo "tmux launch/attach canceled!"
    else
        tmux_nb=`tmux ls | wc -l`
        if [[ "$tmux_nb" == "0" ]]; then
            #echo "Launching tmux..."
            tmux
        else
            #echo "tmux already started, attaching..."
            # Session is is date and time to prevent conflict
            session_id=`date +%Y%m%d%H%M%S`
            # Create a new session (without attaching it) and link to session id 0 (to share windows)
            tmux new-session -d -t 0 -s $session_id
            # Create a new window in that session
            tmux new-window
            # Attach to the new session
            tmux attach-session -t $session_id
            # When we detach from it, kill the session
            tmux kill-session -t $session_id
        fi
    fi
fi
