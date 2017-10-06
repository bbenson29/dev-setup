#!/bin/bash

FOLDERS=(.aws .pyenv .vscode .oh-my-zsh)

# Sync Sublime settings/packages
sudo mv ~/Library/Application\ Support/Sublime\ Text\ 3 ~/Library/Application\ Support/Sublime\ Text\ 3_old
sudo ln -sf ~/Dropbox/Sync/Sublime\ Text\ 3 ~/Library/Application\ Support/Sublime\ Text\ 3

# Sync Visual Studio Code settings
sudo mv ~/Library/Application\ Support/Code/User ~/Library/Application\ Support/Code/User_old
sudo ln -sf ~/Dropbox/Sync/Code/User ~/Library/Application\ Support/Code/User

# Create symlinks for commonly used folders
ln -sf ~/Dropbox/studies ~/Studies
ln -sf ~/Dropbox/DEMOS ~/DEMOS

# Sync dotfiles

cd ~
for folder in ${FOLDERS[@]}
 do
    if [ -d ${folder} ]; then
        echo "Folder exists....renaming to _old -- ${folder}"
        mv ${folder} ${folder}_old
    fi
    
 done

find ~/Dropbox/dotfiles -maxdepth 1 -exec ln -sf {} . \;

