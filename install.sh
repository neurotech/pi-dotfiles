#!/bin/sh

# Super
sudo -v

# Essentials
export ESSENTIALS="git curl tmux fail2ban btop lynx wakeonlan watchdog toilet neofetch"
echo "Updating apt and installing: $ESSENTIALS"
sudo apt-get update && sudo apt-get install $ESSENTIALS

# MOTD Preparation
sudo rm /etc/motd

# Link repo files
echo "Linking config files..."
ln -sf $PWD/.bashrc $HOME/.bashrc
ln -sf $PWD/.tmux.conf $HOME/.tmux.conf
ln -sf $PWD/neofetch/config $HOME/.config/neofetch/config.conf
sudo ln -sf $PWD/00-motd.sh /etc/update-motd.d/00-motd.sh
sudo chmod +x /etc/update-motd.d/00-motd.sh

# Refresh bash settings
echo "Refreshing bash"
source ~/.bashrc
