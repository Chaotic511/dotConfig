# History Configuration
HISTSIZE=5000
SAVEHIST=5000
setopt    appendhistory
setopt    sharehistory
setopt    incappendhistory

setopt autocd
HISTFILE="$XDG_STATE_HOME"/zsh/history
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
zstyle :compinstall filename '~/.zshrc'
autoload -U colors && colors

alias ls='ls -a -X -l -h --color' 
# del, home and end
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line
# ctrl-left and ctrl-right
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
# ctrl-bs and ctrl-del
bindkey "\e[3;5~" kill-word
bindkey "\C-_"    backward-kill-word

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
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
# End of lines added by compinstall

#plugins
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions-master/zsh-autosuggestions.zsh
