# Interactively select a path (recursively)
function sel
	set -l selected_directory (pwd)

	# If there is an argument, start in that path instead.
	if [ "$argv[1]" != "" ]
		set selected_directory = "$argv[1]"
	end

	while true 
		set -l selected_subdirectory (ls -lahu $selected_directory | skip 1 | fzf --reverse --height 35% --nth 9 | awk '{print $9}')

		# If the user didn’t select anything, they quit the command. Exit without doing anything.
		if [ "$selected_subdirectory" = "" ]
			break
		end

		# If the user selected “.”, that is the current directory. cd into that directory.
		if [ "$selected_subdirectory" = "." ]
			echo $selected_directory
			break
		end

		set selected_directory "$selected_directory/$selected_subdirectory"

		if test -d "$selected_directory"
			# This is a directory. Keep navigating to build up the path.
		else
			# This is a file. Echo it. This allows a user to do something like `mvim (icd)` to interactively select a file then open it with `mvim`.
			echo $selected_directory
			break
		end
	end
end
