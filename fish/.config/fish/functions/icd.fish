# An interactive version of `cd`
function icd
	set -l selected_directory (sel)

	# If the user didn’t select anything, they quit the command. Exit without doing anything.
	if [ "$selected_directory" != "" ]
		cd $selected_directory
	end
end
