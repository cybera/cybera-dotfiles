# Source a local file if it exists
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

export PATH=/snap/bin:$PATH

# Set a basic prompt
if [ $UID -eq 0 ]; then
    PS1="[ \u@\h \w ] # "
else
    PS1="[ \u@\h \w ] $ "
fi

alias tmuxmicheal='tmux -S /tmp/mcjones.tmux -f /root/.tmux.conf.mcjones'

export EDITOR=/usr/bin/vim

# Ignore duplicate history entries
HISTCONTROL=ignoreboth

# LXC aliases
alias lls="lxc-ls --fancy"
alias la="lxc-attach -n $1"

# OpenStack aliases
alias rnova="for i in api cert conductor consoleauth novncproxy objectstore scheduler; do service nova-\$i restart; done"
alias rswift="for i in account-auditor account account-reaper account-replicator container-auditor container container-replicator container-updater object-auditor object object-replicator object-updater; do service swift-\$i restart; done"
alias rcinder="for i in scheduler api; do service cinder-\$i restart; done"
alias rcompute="for i in nova-compute nova-network nova-api-metadata cinder-volume; do service \$i restart; done"
alias rglance="for i in api registry; do service glance-\$i restart; done"
alias rdesignate="for i in api agent central mdns pool-manager sink; do service designate-\$i restart; done"

oscurl() {
  token=$(openstack token issue -c id -f value)
  curl -s -H "X-Auth-Token:$token" $1
}

function forgetnode { puppet cert clean $1; puppet node deactivate $1; puppet node clean $1; }
PATH=$PATH:/root/novac/bin
