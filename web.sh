#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

brew install node
sudo npm install -g n
sudo n latest
sudo npm install -g npm

# Remove outdated versions from the cellar.
brew cleanup

# Misc.
sudo npm install -g coffee-script
sudo npm install -g grunt-cli
sudo npm install -g yarn
sudo npm install -g jshint
sudo npm install -g less
