#!/usr/bin/env bash

# Shawn Ayotte - Cybera 2019
# This script is used to install Shawn Ayotte's environment.

# Make sure we are running elevated
if [ "$EUID" -ne 0 ]
then echo "Please run as root (try 'sudo !!')"
  exit
fi

# Ask The user questions about the setup (Cybera Dotfiles)
# Install Cybera dots?
# Use Joe, Micheal, Shawn, or all for tmux
# Use Vim plugins from Cybera
#

clear
echo -ne '#                         (01%) You are SUDO! You pass the first test!                       \r'
sleep 2
echo -ne '#                         (01%) A few bits tried to escape, but we caught them...            \r'
sleep 2

# Copy dotfiles to proper location
# cp -f home/.bashrc ~/ > /dev/null
# cp -f home/.bash_aliases ~/  > /dev/null
# cp -f home/.tmux.conf ~/  > /dev/null
# cp -f home/.vimrc ~/  > /dev/null
cp -rf home/.tmux-themepack ~/  > /dev/null
cp -ruf home/.vim ~/  > /dev/null
echo -ne '###                       (10%) Checking the gravitational constant in your locale...          \r'
sleep 2

# Copy new MOTD and disable the ones we don't want
cp -f home/update-motd.d/* /etc/update-motd.d/
# rm -f /etc/motd > /dev/null
chmod -x /etc/update-motd.d/51-cloudguest || true
chmod -x /etc/update-motd.d/80-livepatch || true
chmod -x /etc/update-motd.d/10-help-text || true
chmod -x /etc/update-motd.d/50-motd-news || true
echo -ne '####                      (20%) Shovelling coal into the server...                          \r'
sleep 2

# Install all software that is needed
apt-get update  > /dev/null
echo -ne '###########               (50%) Warming up Large Hadron Collider...                          \r'
sleep 2

aptcheck=(lm-sensors unrar unzip cabextract curl netstat pydf mc w3m landscape-common figlet colordiff)
toinstall=""
for i in ${aptcheck[@]}
do
  # echo "${i}"
  package="$(which ${i})"
  if [ -z "$package" ] ; then
    toinstall="$toinstall $i"
  fi
done
echo -ne '##################        (75%) It is pitch black. You are likely to be eaten by a grue.        \r'
sleep 2

# echo " installing ${toinstall}"
if [ -z "$toinstall" ] ; then
  echo -ne '##################        (75%) It is pitch black. You are likely to be eaten by a grue.       \r'
else
  sudo apt-get install ${toinstall} -y  > /dev/null
fi

# cp -f home/bin/notes /bin  > /dev/null
echo -ne '######################### (90%) Testing data on Timmy... ... ... We are going to need another Timmy.         \r'
sleep 2

clear

# Wrap up and tell user to use la
printf "Installation complete. Please use 'source ~/.bashrc' then type 'la' to get started!\n--Shawn Ayotte\n"
