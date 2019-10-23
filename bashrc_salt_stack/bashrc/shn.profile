# $Id$

# Set a default prompt for all users
shn_prompt_command()
{
    if [ "${TERM}" = "linux" ]; then
        PS1='\$ $? \t \u@\H:\w\$ '
    else
        PS1='\[\e]2;\u@\H:\w\a\]\$ $? \t \u@\H:\w\$ '
    fi
}
PROMPT_COMMAND='shn_prompt_command'

EDITOR=vim
export EDITOR
