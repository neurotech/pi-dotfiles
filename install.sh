#!/bin/sh

# super
sudo -v

# essentials
export ESSENTIALS="git curl tmux fail2ban htop lynx wakeonlan watchdog toilet neofetch"
echo "Updating apt and installing: $ESSENTIALS"
sudo apt-get update && sudo apt-get install $ESSENTIALS

# motd
sudo rm /etc/motd

# Link repo files to ~
echo "Linking config files to $HOME"
ln -sf $HOME/pi-dotfiles/.bashrc $HOME/.bashrc
ln -sf $HOME/pi-dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/pi-dotfiles/neofetch/config $HOME/.config/neofetch/config.conf
ln -sf $HOME/pi-dotfiles/neofetch/logo $HOME/.config/neofetch/logo
echo "toilet -f smblock 'hovercastle' --filter crop:gay && echo '' && neofetch --colors 1 2 3 5 3 7" >> sudo /etc/profile

# Refresh bash settings
echo "Refreshing bash"
source ~/.bashrc
