# Source a local file if it exists
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

# Set a basic prompt
if [ $UID -eq 0 ]; then
    PS1="[ \u@\h \w ] # "
else
    PS1="[ \u@\h \w ] $ "
fi

alias tmuxmicheal='tmux -S /tmp/mcjones.tmux -f /root/.tmux.conf.mcjones'

# Ignore duplicate history entries
HISTCONTROL=ignoreboth

# Hiera YAML shortcuts
function yamlc() { ruby -e "require 'yaml'; YAML.parse(File.open('$1'))"; }
function hierapp() { ruby -e "require 'pp'; pp(eval(ARGF.read))"; }
