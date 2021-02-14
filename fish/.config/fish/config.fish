# ~/bin is where personal executables are stored.
set PATH $PATH (find -L ~/bin -type d)

# /usr/local/bin is where brew installs stuff.
set PATH /usr/local/bin $PATH;

set -g -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home

# Add Node Modules to path.
#set PATH $PATH ~/node_modules/.bin

# Add /usr/local/sbin to fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Add sphinx-doc to fish_user_paths
set -g fish_user_paths "/usr/local/opt/sphinx-doc/bin" $fish_user_paths

# "ls -lah" is very common. Make it shorter.
alias ll "ls -lah"

# Easily open the current working directory in the Finder.
alias owd "open ./"

# Easily open this file.
alias confedit "mvim ~/.config/fish/config.fish"

# Go to the root of a git repo.
alias gitroot "cd (git rev-parse --show-toplevel)"

# Abbreviations
abbrev

# Set LC_ALL for unicode detection in Ubuntu
# This is from (https://github.com/fish-shell/fish-shell/issues/2126)
set LC_ALL "en_US.utf8"

# Tool configuration
config_diff_merge_tool

