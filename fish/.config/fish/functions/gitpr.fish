# Opens a GitHub PR for the current branch
function gitpr
	# List the remote URLs for the current repo
	# Filter to just those that are listed for pushing
	# Take the first result
	# Take the second column (just grabbing the URL, not also the name of the remote)
	# Do three find-and-replace changes to convert an SSH URL to an HTTPS url:
	#   1. Replace : with /
	#   2. Replace git@ with https://
	#   3. Remove .git
	# Append /pull/new/
	# Append the current branch’s name
	open (git remote -v | grep "push" | take 1 | coln 2 | sed 's/:/\//g;' | sed 's/git@/https:\/\//g;' | sed 's/\.git//g;')/pull/new/(git branch-name)
end
