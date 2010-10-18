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


# Up and down arrows search history
# http://www.geocities.com/h2428/petar/bash_hist.htm
# Don't run if not in interactive shell
case "$-" in
*i*)
    bind '"\e[A"':history-search-backward
    bind '"\e[B"':history-search-forward
    bind '"\M-w"':"\"\C-k\C-ahistory | grep '^ *[0-9]* *\C-e.'\C-m\""
esac
