# Print the full path of a file relative to the current working directory.
# For example, when in `/Users/matt`, `where dotfiles` returns `/Users/matt/dotfiles/`
function where
	ls -d -1 $PWD/$argv
end
