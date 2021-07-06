#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle

# Install sdkman
curl -s "https://get.sdkman.io" | bash
source "~/.sdkman/bin/sdkman-init.sh"

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configure profile
dir=~/dotfiles
files=".gitconfig .zshrc"

# Create a dir to move the configuration files there
cd $dir

for file in $files; do
    echo "Creating symlink to $file in home directory."
    [ -e ~/$file ] && rm ~/$file
    ln -s $dir/$file ~/$file
done
