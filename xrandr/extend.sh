#/usr/bin/env sh

. ~/rc/xrandr/vars.sh

xrandr --output $IN --auto --primary --output $EXT --auto --right-of $IN
