#!/bin/sh

# apt
echo "Updating apt and installing: git curl tmux fail2ban htop lynx wakeonlan watchdog"
sudo apt-get update && sudo apt-get install git curl tmux fail2ban htop lynx wakeonlan watchdog

# Link repo files to ~
echo "Linking config files to ~"
ln -sf ~/pi-dotfiles/.bashrc ~/.bashrc
ln -sf ~/pi-dotfiles/.tmux.conf ~/.tmux.conf

# Refresh bash settings
echo "Refreshing bash"
source ~/.bashrc
