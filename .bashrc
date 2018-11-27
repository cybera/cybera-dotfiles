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

# tmux helpers
alias tmuxmicheal='tmux -S /tmp/mcjones.tmux -f /root/.tmux.conf.mcjones'
alias tmuxanna='tmux -S /tmp/anna.tmux -f /root/.tmux.conf.anna'

export EDITOR=/usr/bin/vim

# Path tweaks for Puppet 6
export PATH=$PATH:/opt/puppetlabs/bin

# Ignore duplicate history entries
HISTCONTROL=ignoreboth

# LXC aliases
alias lls="lxc-ls --fancy"
alias la="lxc-attach -n $1"

# App aliases
alias megacli='/root/bin/Linux/opt/MegaRAID/MegaCli/MegaCli64'

# OpenStack aliases
alias rnova="for i in api cert conductor consoleauth novncproxy scheduler; do service nova-\$i restart; done"
alias rswift="for i in account-auditor account account-reaper account-replicator container-auditor container container-replicator container-updater object-auditor object object-replicator object-updater; do service swift-\$i restart; done"
alias rcinder="for i in scheduler api; do service cinder-\$i restart; done"
alias rglance="for i in api registry; do service glance-\$i restart; done"
alias rdesignate="for i in api agent central mdns pool-manager sink; do service designate-\$i restart; done"
alias rneutron="for i in dhcp-agent l3-agent linuxbridge-agent metadata-agent server; do service neutron-\$i restart; done"
alias st2_lookup="st2 run rac.project_artifacts"

oscurl() {
  token=$(openstack token issue -c id -f value)
  curl -s -H "X-Auth-Token:$token" $1
}

function forgetnode { puppet cert clean $1; puppet node deactivate $1; puppet node clean $1; }
PATH=$PATH:/root/novac/bin
