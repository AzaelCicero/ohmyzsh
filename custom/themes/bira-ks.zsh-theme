# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local time='%{$fg[yellow]%}%D{%Y-%m-%d %H:%M:%S}%{$reset_color%}'
local user_host='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}'
#local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[magenta]%}%~%{$reset_color%}'
#local rvm_ruby=''
#if which rvm-prompt &> /dev/null; then
#  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
#else
#  if which rbenv &> /dev/null; then
#    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
#  fi
#fi

function conda_prompt_info() {
    if [ -v CONDA_DEFAULT_ENV ]; then
        echo "${ZSH_THEME_CONDA_PROMPT_PREFIX}$CONDA_DEFAULT_ENV${ZSH_THEME_CONDA_PROMPT_SUFFIX}"
    fi
}

function ros_prompt_info() {
    if [ -v ROS_DISTRO ]; then
        echo "${ZSH_THEME_ROS_PROMPT_PREFIX}${ROS_DISTRO}${ZSH_THEME_ROS_PROMPT_SUFFIX}"
    fi
}

local git_branch='$(git_prompt_info)'
local conda_env='$(conda_prompt_info)'
local ros_env='$(ros_prompt_info)'

PROMPT="╭─${time} ${user_host} ${current_dir} ${ros_env}${conda_env}${git_branch}%{$reset_color%}
╰─%B$%b "
RPS1="${return_code}"

ZSH_THEME_CONDA_PROMPT_PREFIX="%{$fg[cyan]%}🐍:"
ZSH_THEME_CONDA_PROMPT_SUFFIX=" %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_ROS_PROMPT_PREFIX="%{$fg[cyan]%}🤖:"
ZSH_THEME_ROS_PROMPT_SUFFIX=" %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}◒ "