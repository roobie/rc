#!/usr/bin/env sh

## Inspired by:
## https://raw.github.com/kaihendry/Kai-s--HOME/master/.xinitrc


## =============================================================================
## If this is a vbox guest, and the utils are installed, uncomment this
## to enable them at X11 start.
VBOX_ALL=/usr/bin/VBoxClient-all
[[ -f $VBOX_ALL ]] && $VBOX_ALL


## =============================================================================
## start the ssh-agent
eval `/usr/bin/ssh-agent`

## configure the askpass path
SSH_ASKPASS=/usr/bin/qt4-ssh-askpass ssh-add < /dev/null


## =============================================================================
## merge the xresources
xrdb ~/rc/Xresources


## =============================================================================
## configure the keyboard
setxkbmap -layout us -option ctrl:nocaps


## =============================================================================
## start the rxvt-unicode daemon.
urxvtd -q -o -f


## =============================================================================
## the status bar
while true
do
	  VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
	  LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
	  IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1)

	  if acpi -a | grep off-line > /dev/null
	  then
		    BAT="Bat. $(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
		    xsetroot -name "$IP $BAT $VOL $LOCALTIME"
	  else
		    xsetroot -name "$IP $VOL $LOCALTIME"
	  fi
	  sleep 9s
done &


## =============================================================================
## Set the background wall paper to something nice.
feh --bg-scale ~/img/wall1.jpg

## =============================================================================
## start the WM
exec dwm
#exec startlxqt
#/home/bjorn/devel/stumpwm/stumpwm
