# Cybera Dotfiles

Repository of dotfiles used by Cybera on the various servers.

## Install
Uses create.sh to symlink the files.

.gitconfig
.gitignore
.gitmodules
.bashrc
.bash_profile
.tmux.conf
.tmux.conf.mcjones
.vimrc

## Configure
There are 4 alias files that are included, once for Cybera, and one each for Joe, Micheal and Shawn. To load your aliases simply type your name.

If you would like your alias file loaded by default add these lines to your .ssh/config:

```
Host thishost
  Hostname thishost.is.mine
  User root
  IdentityFile ~/.ssh/[yourcert].pem
  RemoteCommand bash -ic [name];exec bash

```

Then run `ssh thishost`

## Notes
Based on Joe's pre-existing files with some modifications by Micheal and Shawn.
