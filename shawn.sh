#!/usr/bin/env bash

# Shawn Ayotte - Cybera 2019
# This script is used to install Shawn Ayotte's environment.

# Make sure we are running elevated
if [ "$EUID" -ne 0 ]
then echo "Please run as root (try 'sudo !!')"
  exit
fi

# Copy dotfiles to proper location
cp -rf home/.tmux-themepack ~/

if [[ -f /etc/update-motd.d ]]; then
  # Copy new MOTD and disable the ones we don't want
  cp -f home/update-motd.d/* /etc/update-motd.d/
  chmod -x /etc/update-motd.d/51-cloudguest || true
  chmod -x /etc/update-motd.d/80-livepatch || true
  chmod -x /etc/update-motd.d/10-help-text || true
  chmod -x /etc/update-motd.d/50-motd-news || true
fi
