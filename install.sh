#!/bin/sh

# Super
sudo -v

# Essentials
export ESSENTIALS="git curl tmux fail2ban btop lynx wakeonlan watchdog toilet neofetch"
echo "Updating apt and installing: $ESSENTIALS"
sudo apt-get update && sudo apt-get install $ESSENTIALS

# MOTD Preparation
sudo rm /etc/motd
sudo chmod -x /etc/update-motd.d/*

# Link repo files
echo "Linking config files..."
ln -sf $PWD/.bashrc $HOME/.bashrc
ln -sf $PWD/.tmux.conf $HOME/.tmux.conf
ln -sf $PWD/neofetch/config $HOME/.config/neofetch/config.conf
sudo ln -sf $PWD/motd.sh /etc/profile.d/motd.sh
sudo chmod 755 /etc/profile.d/motd.sh


# Refresh bash settings
echo "Refreshing bash"
source $HOME/.bashrc
