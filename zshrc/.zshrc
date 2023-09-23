neofetch


### PATH - DONT COPY MY PATH - COPY YOUR OWNSDF
export PATH=$HOME/bin:/usr/local/bin:/snap/bin:/opt/bin:$PATH

### ZSH HOME
export ZSH=$HOME/.zsh # Keep 1000 lines of history within the shell and save it to ~/.zsh_history:

## ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS

# Use modern completion system
autoload -Uz compinit
compinit

#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true
#
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#---Alias---

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lg='ls -lG --color --group-directories-first -A -v'
alias ds='du -sk * | sort -nr'
#-----Plugins------








#-------------------------------#
#    MY CUSTOM CHANGES    ------#
#-------------------------------#

## source ~/miniconda3/etc/profile.d/conda.sh  # commented out by conda initialize
#if [[ -z ${CONDA_PREFIX+x} ]]; then
#    export PATH="~/conda/bin:$PATH"
#fi
##Setup miniconda
## source ~/miniconda3/etc/profile.d/conda.sh  # commented out by conda initialize
#if [[ -z ${CONDA_PREFIX+x} ]]; then
#    export PATH="~/conda/bin:$PATH"
#fi
#CONDA_ROOT=~/miniconda3
#if [[ -r $CONDA_ROOT/etc/profile.d/bash_completion.sh ]]; then
#    source $CONDA_ROOT/etc/profile.d/bash_completion.sh
#fi


alias pys="conda activate pys"
alias pysout="conda deactivate"
alias pcupdate="sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt autoclean && neopysup"
alias pcupdate="sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y && pysup"
alias pysup="pys && conda update -y --all && pysout"
alias neopysup="conda activate neovim && conda update -y --all && conda deactivate && conda activate neovim3 && conda update -y --all && conda deactivate"

alias vim="nvim"
alias ipys="pys && ipython"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/home/tbf/.local/bin:$PATH"        
export PATH="/home/tbf/lua-language-server/bin:$PATH"        

alias luamake=/home/tbf/ubuntu-setup/lua-language-server/3rd/luamake/luamake
alias vim="nvim"
alias vi="nvim"

#----------------------------------#
#    NEOVIM CONFIG PICKER          #
#----------------------------------#
function nvims() {
  items=("default" "kickstart" "lazyvim" "astrovim") 
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}
bindkey -s ^a "nvims\n"

#Autojump
if [ -f "/usr/share/autojump/autojump.sh" ]; then
	. /usr/share/autojump/autojump.sh
elif [ -f "/usr/share/autojump/autojump.bash" ]; then
	. /usr/share/autojump/autojump.bash
else
	echo "can't found the autojump script"
fi

#Starship
eval "$(starship init zsh)"
