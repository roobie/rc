#!/bin/sh

################################################################################
## WARNING, will nuke files in your $HOME directory.
################################################################################
MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$MY_PATH" ] ; then
    # error; for some reason, the path is not accessible
    # to the script (e.g. permissions re-evaled after suid)
    exit 1  # fail
fi
echo "Working from [$MY_PATH]"

cd $HOME

function link {
    rm $1 > /dev/null 2>&1
    ln -s "rc/.zprofile"
}

link .zprofile
link .spacemacs
link .gitconfig

HOME_CONFIG="$HOME/.config"
MY_CONFIG="$MY_PATH/.config"

cd $HOME_CONFIG
function linkconfig {
    if [ ! -e "$HOME_CONFIG/$1" ]
    then
        ln -s "$MY_CONFIG/$1"
    else
        echo "Link $1 exists"
    fi
}
linkconfig kitty
linkconfig fish
