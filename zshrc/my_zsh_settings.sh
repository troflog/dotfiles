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
  items=("default" "KickStart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
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

#Use tab for autocomplete
bindkey '       ' autosuggest-accept