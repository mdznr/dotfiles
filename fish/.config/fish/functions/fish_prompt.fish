# Symbols
set -g symbol_prompt "‣"
set -g symbol_git_down_arrow "⇣"
set -g symbol_git_up_arrow "⇡"
set -g symbol_git_dirty "*"

# Colors
set -g color_red red
set -g color_green green
set -g color_cyan cyan
set -g color_blue blue
set -g color_purple purple
set -g color_gray 93A1A1
set -g color_white white
set -g color_normal normal

# Prints the Current Working Directory with a tilde.
function _pwd_with_tilde
	# Replace the home directory with “~”.
	set -l relative_working_directory (echo $PWD | sed 's|^'$HOME'\(.*\)$|~\1|')
	# Replace the iCloud@Work directory (“~/Library/Mobile Documents/com~apple~icloud~applecorporate/”) with “~/iCloud@Work/”
	set -l relative_working_directory (echo $relative_working_directory | sed 's|^~/Library/Mobile Documents/com~apple~icloud~applecorporate/\(.*\)$|~/iCloud@Work/\1|')
	# Replace the iCloud Drive directory (“~/Library/Mobile Documents/com~apple~CloudDocs”) with “~/iCloud/”
	set -l relative_working_directory (echo $relative_working_directory | sed 's|^~/Library/Mobile Documents/com~apple~CloudDocs/\(.*\)$|~/iCloud/\1|')
	echo $relative_working_directory
end

# Returns whether or not we’re in the directory of a Git repository.
function _in_git_directory
	git rev-parse --git-dir > /dev/null 2>&1
end

# Returns the branch name or revision of the Git repository.
function _git_branch_name_or_revision
	set -l branch (git symbolic-ref HEAD ^ /dev/null | sed -e 's|^refs/heads/||')
	set -l revision (git rev-parse HEAD ^ /dev/null | cut -b 1-7)

	if test (count $branch) -gt 0
		echo $branch
	else
		echo $revision
	end
end

# Returns whether or not there are unstaged/uncommitted changes in the current git repository.
function _git_unstaged_changes
	git status --porcelain --ignore-submodules | grep "M" > /dev/null
end

# Returns a string of the local status of the Git repository.
function _git_local_status
	if _git_unstaged_changes
		echo $symbol_git_dirty
	else
		echo ""
	end
end

# Returns whether or not there is an upstream configured in Git.
function _git_upstream_configured
	git rev-parse --abbrev-ref @"{u}" > /dev/null 2>&1
end

# Returns whether or not the local Git repo is behind the upstream repository.
function _git_behind_upstream
	test (git rev-list --right-only --count HEAD...@"{u}" ^ /dev/null) -gt 0
end

# Returns whether or not the local Git repo is ahead of the upstream repository.
function _git_ahead_of_upstream
	test (git rev-list --left-only --count HEAD...@"{u}" ^ /dev/null) -gt 0
end

# Returns a string of the upstream status of the Git repository.
function _git_upstream_status
	set -l arrows ""
	
	if _git_upstream_configured
		if _git_behind_upstream
			set arrows "$arrows$symbol_git_down_arrow"
		end
		
		if _git_ahead_of_upstream
			set arrows "$arrows$symbol_git_up_arrow"
		end
	end
	
	echo $arrows
end

# Prints text in color. The first param is the string. The second param is the color. Ensures text color is set back to normal afterwards.
function _print_in_color
	set -l string $argv[1]
	set -l color  $argv[2]

	set_color $color
	printf $string
	set_color normal
end

# Prints a newline.
function _print_newline
	_print_in_color "\n" $color_normal
end

# Returns the color to use for the prompt for the given status. The first param is the status code of the last command.
function _prompt_color_for_status
	if test $argv[1] -eq 0
		echo "$color_white"
	else
		echo "$color_red"
	end
end

# Returns the current hostname.
function _prompt_current_hostname
	echo -n (hostname -s)
end

# Returns the date.
function _prompt_date
	echo -n (date "+%I:%M %p")
end

# The Prompt!
function fish_prompt
	set -l last_status $status
	
	# Newline
	_print_newline
	
	# Date
	_print_in_color (_prompt_date)" " $color_gray
	
	# Working Directory
	_print_in_color (_pwd_with_tilde)" " $color_blue
	
	# Git Status
	if _in_git_directory
	_print_in_color (_git_branch_name_or_revision) $color_gray
	_print_in_color (_git_local_status) $color_red
	_print_in_color (_git_upstream_status) $color_cyan
	end
	
	# Newline
	_print_newline
	
	# Prompt
	_print_in_color "$symbol_prompt " (_prompt_color_for_status $last_status)
end

