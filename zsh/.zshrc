# History Configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt    appendhistory
setopt    sharehistory
setopt    incappendhistory

setopt autocd
zstyle :compinstall filename '~/.zshrc'
autoload -U colors && colors
alias ls='ls --color' 
#----------------------------script for current location------------------------------
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' ('$branch')'
  fi
}

setopt PROMPT_SUBST

# Allow exported PS1 variable to override default prompt.
if ! env | grep -q '^PS1='; then
  PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[cyan]%}>>%~% %{$fg_bold[green]%}$(git_branch_name) %'
fi
#--------------------------------------------------------------------------------------

autoload -Uz compinit
compinit
# End of lines added by compinstall

#plugins
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions-master/zsh-autosuggestions.zsh

