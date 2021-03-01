#!/usr/bin/env sh

## Inspired by:
## https://raw.github.com/kaihendry/Kai-s--HOME/master/.xinitrc

## If using integrated graphics with radeon discrete GPU
## xrandr --setprovideroffloadsink 1 0


## start the ssh-agent
eval $(/usr/bin/ssh-agent)

## merge the xresources
xrdb ~/rc/Xresources

## configure the keyboard
setxkbmap -layout us -option ctrl:nocaps

## Set the background wall paper to something nice.
## feh --bg-scale ~/img/wall1.jpg

## Opt out of telemetry
DOTNET_CLI_TELEMETRY_OPTOUT=1; export DOTNET_CLI_TELEMETRY_OPTOUT;

## =============================================================================
## start the WM
exec i3
#startxfce4
#exec startlxqt
#/home/bjorn/devel/stumpwm/stumpwm
