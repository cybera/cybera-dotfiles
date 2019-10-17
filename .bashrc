# Source a local file if it exists
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

uname=$(uname)
if [[ "${uname}" == "Linux" ]]; then
  export PATH=~/cybera-dotfiles/bin:/snap/bin:$PATH
fi

# Set a basic prompt
if [ $UID -eq 0 ]; then
    PS1="[ \u@\h \w ] # "
else
    PS1="[ \u@\h \w ] $ "
fi

# tmux helpers (moving this to setup script)
# alias tmuxmicheal='tmux -S /tmp/mcjones.tmux -f /root/.tmux.conf.mcjones'
if [[ -f /etc/update-motd.d ]]; then
  run-parts --lsbsysinit /etc/update-motd.d
fi

# Include aliases
function shawn {
  if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases_shawn
  fi
}

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases_cybera
fi

function micheal {
  if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases_micheal
  fi
}

function joe {
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases_joe
fi
}

