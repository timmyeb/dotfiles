#!/bin/bash

# Find all dot files then if the original file exists, create a backup
# Once backed up to {file}.dtbak symlink the new dotfile in place
for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
    if [ -e ~/$file ]; then
        mv -f ~/$file{,.dtbak}
    fi
    ln -s $PWD/$file ~/$file
done

# Install zsh theme 
if [ -d "$HOME/.oh-my-zsh" ]; then
    cp ./telf.zsh-theme ~/.oh-my-zsh/themes/telf.zsh-theme
fi

echo "Installed"
