#!/bin/bash

current_desktop=`wmctrl -d | grep "*" | awk '{print $1}'`
#echo "current_desktop = ${current_desktop}"

pid=`wmctrl -l -p | grep Kate | sed "s|.*  ${current_desktop} \([0-9]*\) .*|\1|g" | grep -v 0x`
#echo "Kate on current desktop has PID ${pid}"

if [[ "x${pid}" == "x" ]]; then
    kate ${@}
else
    kate --pid ${pid} ${@}
fi
