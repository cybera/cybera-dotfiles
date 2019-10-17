# ┍——————————————————————————————————————————————————\e[36m✼\e[0m———————————————————————————————————————————————————————┑
# | \e[36mla\e[0m             List Aliases                      | \e[36msystatus\e[0m       System Stats                           |
# | \e[36mports\e[0m          List all tcp/udp open ports       | \e[36msyslog\e[0m         Monitor the Syslog Log File            |
# | \e[36mbye\e[0m            Shutdown Right Now                | \e[36mextract\e[0m        Universal Compressed File Extractor    |
# | \e[36mmyssh\e[0m          Show SSH Aliases                  | \e[36mtodos\e[0m          List TODOs from the Current Project    |
# | \e[36mhwsensors\e[0m      Check Hardware Sensors            | \e[36mmyip\e[0m           Get public IP Address                  |
# | \e[36mhttpd\e[0m          Start Py Web Server Here          | \e[36mupdate\e[0m         Apt Update and Apt Upgrade Now         |
# | \e[36mgenpass\e[0m        Generate Random Password          | \e[36mmessages\e[0m       Monitor /var/log/messages              |
# | \e[36mpydf\e[0m           Fancy df                          | \e[36mmc\e[0m             Midnight Commander                     |
# | \e[36muntar\e[0m          Untar a file                      | \e[36msha\e[0m            Get sha 256 of file                    |
# | \e[36miptlist\e[0m        IP Tables List All                | \e[36miptlistfw\e[0m      IP Tables list Firewall                |
# | \e[36miptin\e[0m          IP Tables IN                      | \e[36miptout\e[0m         IP Tables OUT                          |
# | \e[36mpsmem10\e[0m        Top 10 processes using RAM        | \e[36mpscpu10\e[0m        Top 10 processes using CPU             |
# ┕——————————————————————————————————————————————————\e[36m✼\e[0m———————————————————————————————————————————————————————┙

alias la='clear && echo -e "$(cat ~/.bash_aliases | grep '^#' | cut -c 3-)" && echo -e "\e[38;5;166mThis Is $HOSTNAME\e[0m"'
alias bye='sudo shutdown -h now'
alias systatus='printf "\e[38;5;166m" && landscape-sysinfo --exclude-sysinfo-plugin Network && printf "\n" && pydf && printf "\e[0m"'
alias myssh='cat ~/.ssh/config | grep '^Host' | cut -c 6'
alias hwsensors='watch -tn1 "lscpu | grep MHz; printf '\n\n'; sensors"'
alias httpd='python3 -m http.server 8001'
alias hr='printf $(printf "\e[$(shuf -i 91-97 -n 1);1m%%%ds\e[0m\n" $(tput cols)) | tr " " ='
alias genpass='< /dev/urandom tr -dc ~@#$^%A-Za-z0-9 | head -c${1:-32}'
alias ports='netstat -tulnp'
alias update='sudo apt-get update && sudo apt-get upgrade -y'
alias myip='curl icanhazip.com'
alias todos='grep -irF --exclude-dir=".git" --exclude-dir=".idea" "ToDo" .'
alias syslog='sudo tail -100f /var/log/syslog'
alias messages='sudo tail -100f /var/log/messages'
alias cat='bat'
alias ls='command ls -Fh --color=auto --group-directories-first'
alias df='df -Th --total'
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias ifconfig='ip address'
alias untar='tar -zxvf '
alias sha='shasum -a 256 '
alias bc='bc -lq'
alias diff='colordiff'
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

function extract {
 if [ -z "$1" ]; then
  # display usage if no parameters given
  echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
  return 1
 else
  for n in $@
  do
    if [ -f "$n" ] ; then
      case "${n%,}" in
        *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
          tar xvf "$n"       ;;
        *.lzma)      unlzma ./"$n"      ;;
          *.bz2)       bunzip2 ./"$n"     ;;
          *.rar)       unrar x -ad ./"$n" ;;
          *.gz)        gunzip ./"$n"      ;;
          *.zip)       unzip ./"$n"       ;;
          *.z)         uncompress ./"$n"  ;;
          *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
            7z x ./"$n"        ;;
          *.xz)        unxz ./"$n"        ;;
          *.exe)       cabextract ./"$n"  ;;
          *)
            echo "extract: '$n' - unknown archive method"
            return 1
          ;;
      esac
    else
      echo "'$n' - file does not exist"
      return 1
    fi
  done
 fi
}
echo -e "\e[36m~-~-~-~-~-~-~-~-~-~-~-~-~-     Type 'la' for bash aliases.      ~-~-~-~-~-~-~-~-~-~-~-~-~-\e[0m"

