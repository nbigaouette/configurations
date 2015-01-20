#!/bin/bash

xrandr="xrandr"
xdpyinfo="xdpyinfo"
wmctrl="${HOME}/usr/bin/wmctrl"
xdotool="${HOME}/usr/bin/xdotool"

# Get resolution
#screen_resolution=$(${xrandr} | grep "*" | awk '{print ""$1""}')
# Should be faster then xrandr:
screen_resolution=$(${xdpyinfo} | grep 'dimensions:' | awk '{print ""$2""}')
s_w=${screen_resolution/x*/}
s_h=${screen_resolution/*x/}
s_w_h=$((${s_w} / 2))

w_w=$(xwininfo -id $(${xdotool} getactivewindow) | \
    grep "Width" | awk '{print ""$2""}')
w_h=$(xwininfo -id $(${xdotool} getactivewindow) | \
    grep "Height:" | awk '{print ""$2""}')
w_u_y=$(xwininfo -id $(${xdotool} getactivewindow) | \
    grep "Absolute upper-left Y" | awk '{print ""$4""}')
# Comes from Window decoration?
MAGIC_NUMBER_WM=23
w_u_y=$((${w_u_y} - ${MAGIC_NUMBER_WM}))

text="Resolution: ${screen_resolution}
Width: ${s_w}
Height: ${s_h}
Half Width: ${s_w_h}
Window s_w: ${w_w}
Window s_h: ${w_h}
Window upper Y: ${w_u_y}"

echo ${text}
# zenity  --info --text "${text}"

# Make sure window is not maximized (either vertically or horizontally) as
# placing the window using "-e" option will not work for maximized windows.
cmd="${wmctrl} -r :ACTIVE: -b remove,maximized_vert,maximized_horz"
echo ${cmd}
#zenity  --info --text "${cmd}"
${cmd}

# Move window
#${wmctrl} -r :ACTIVE: -e 1,0,0,${half_width},${height}
cmd="${wmctrl} -r :ACTIVE: -e 1,0,${w_u_y},${s_w_h},${w_h}"
echo ${cmd}
# zenity  --info --text "${cmd}"
${cmd}
