# Source a local file if it exists
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

uname=$(uname)
if [[ "${uname}" == "Linux" ]]; then
  export PATH=~/cybera-dotfiles/bin:/snap/bin:~/.local/bin:$PATH
fi

# Set a basic prompt
if [ $UID -eq 0 ]; then
    PS1="[ \u@\h \w ] # "
else
    PS1="[ \u@\h \w ] $ "
fi

# tmux helpers
alias tmuxmicheal='tmux -S /tmp/mcjones.tmux -f ~/.tmux.conf.mcjones'


# vim aliases
alias avim='vim -u ~/cybera-dotfiles/.ashleyvimrc'

export EDITOR=/usr/bin/vim

# Path tweaks for Puppet 6+
export PATH=$PATH:/opt/puppetlabs/bin

# Path tweaks for Zeek
if [[ -d /opt/zeek/bin ]]; then
  export PATH=/opt/zeek/bin:$PATH
fi

# Ignore duplicate history entries
HISTCONTROL=ignoreboth

# LXC aliases
alias lls="lxc ls"
function la() {
  lxc exec $1 bash
}

# App aliases
alias megacli='/root/bin/Linux/opt/MegaRAID/MegaCli/MegaCli64'

# OpenStack aliases
alias rnova="for i in api conductor novncproxy scheduler; do service nova-\$i restart; done; service apache2 restart;"
alias rswift="for i in account-auditor account account-reaper account-replicator container-auditor container container-replicator container-updater object-auditor object object-replicator object-updater; do service swift-\$i restart; done"
alias rcinder="for i in scheduler ; do service cinder-\$i restart; done; service apache2 restart"
alias rglance="for i in api registry; do service glance-\$i restart; done"
alias rdesignate="for i in api agent central mdns pool-manager sink worker; do service designate-\$i restart; done"
alias rneutron="for i in dhcp-agent l3-agent linuxbridge-agent metadata-agent server; do service neutron-\$i restart; done"
alias st2_lookup="st2 run rac.project_artifacts"
alias cdpuppet="cd /etc/puppetlabs/code/environments/production"
alias cdmaas="cd /var/snap/maas/current/preseeds"
alias maasfiles="cd /var/www/maas_files"


function oscurl() {
  token=$(openstack token issue -c id -f value)
  curl -s -H "X-Auth-Token:$token" $1
}

function forgetnode { puppetserver ca clean --certname $1; puppet node deactivate $1; puppet node clean $1; }
function forgetnode6 { puppetserver ca clean --certname $1; puppet node deactivate $1; puppet node clean $1; }

function newsshhost {
  ssh-keygen -f ~/.ssh/known_hosts -R $1
  ip=$(grep $1 /etc/hosts | awk '{print $1}')
  if [[ -n $ip ]]; then
    ssh-keygen -f ~/.ssh/known_hosts -R $ip
  fi
  ip=$(dig -t a +short $1)
  if [[ -n $ip ]]; then
    ssh-keygen -f ~/.ssh/known_hosts -R $ip
  fi
  ip=$(dig -t aaaa +short $1)
  if [[ -n $ip ]]; then
    ssh-keygen -f ~/.ssh/known_hosts -R $ip
  fi
  ssh-keyscan -t ecdsa $1 >> ~/.ssh/known_hosts
}
