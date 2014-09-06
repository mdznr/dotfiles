#!/bin/sh

# Do this to get sudo at the beginning of the script.
sudo whoami

echo "Installing Homebrew…"
if which brew 2>/dev/null 1>/dev/null; then
    echo "Homebrew already installed."
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing Homebrew software…"

echo "Homebrew: Installing utilities…"
bash macos_homebrew.bash

echo "Homebrew: Installing Cask apps…"
bash macos_apps.bash

echo "Finalizing Homebrew installation…"
brew update
brew upgrade
brew cleanup
brew cask cleanup

echo "Configuring stow…"
stow -D "stow/"; stow "stow/"

echo "Restowing all apps…"
stow -D "clang-format/"; stow "clang-format/"
stow -D "dockutil/"; stow "dockutil/"
stow -D "fish/"; stow "fish/"
stow -D "git/"; stow "git/"
stow -D "vim/"; stow "vim/"
stow -D "slate/"; stow "slate/"
stow -D "x/"; stow "x/"

echo "Installing NeoBundle…"
# TODO: Could this be a git submodule?
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

echo "Updating submodules…"
git submodule init
git submodule update

echo "Configuring macOS settings…"
bash macos_preferences.bash

echo "Applying Roots…"
bash macos_roots.bash

echo "Configuring macOS Dock…"
bash macos_dock.bash

echo "Configuring Shell…"
bash shell.bash
