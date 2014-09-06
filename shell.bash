#!/bin/bash

# First, add /usr/local/bin/fish to /etc/shells, if it isn’t already
if grep -q "/usr/local/bin/fish" /etc/shells; then
    echo "fish already added to /etc/shells"
else
    sudo bash -c "echo '/usr/local/bin/fish' >> /etc/shells" 
fi

# Then change the default shell to fish
chsh -s `which fish`
