source $HOME/.profile
# if [ -a "$HOME/.profile" ]
# then
#     source $HOME/.profile
# fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]
then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]
then
    PATH="$HOME/.local/bin:$PATH"
fi


# if ps -p $SSH_AGENT_PID > /dev/null
# then
# else
#     eval "$(ssh-agent -s)" > /dev/null
# fi

if [ -z $SSH_AGENT_PID ] ; then
    if [ ps -p $SSH_AGENT_PID > /dev/null ] ; then
    else
        eval "$(ssh-agent -s)"
    fi
fi
