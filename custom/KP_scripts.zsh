# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kpawelczyk/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kpawelczyk/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kpawelczyk/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kpawelczyk/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

ZSH_THEME="bira-ks"

if [ -n "$ZSH_VERSION" ]; then
# assume Zsh
SOURCE_DIR=${funcsourcetrace[0]%/*}
SCRIPT_EXT=zsh
elif [ -n "$BASH_VERSION" ]; then
# assume Bash
SOURCE_DIR="${BASH_SOURCE%/*}"
SCRIPT_EXT=bash
else
# asume something else
echo "ERROR: Unsupported shell!"
fi

# ROS helpers
[ -f /opt/ros/melodic/setup.${SCRIPT_EXT} ] && alias ros1init='conda activate ROS1 && source /opt/ros/melodic/setup.${SCRIPT_EXT}'
[ -f /opt/ros/dashing/setup.${SCRIPT_EXT} ] && alias ros2init='source /opt/ros/dashing/setup.${SCRIPT_EXT}'
alias wsinit='[ -f $(pwd)/devel/setup.${SCRIPT_EXT} ]  && conda activate ROS1 && source $(pwd)/devel/setup.${SCRIPT_EXT}; [ -f $(pwd)/install/setup.${SCRIPT_EXT} ] && source $(pwd)/install/setup.${SCRIPT_EXT};'
