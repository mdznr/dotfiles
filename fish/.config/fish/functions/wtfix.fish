# Fixed in <REPO NAME> <GIT DESCRIBE>
#
# <GIT COMMIT MESSAGE BODY>
function wtfix
	# Gets the name of the repo (based on current directory). Assume you are at the top level. In the future, this could use `gitroot` to find the root of the current repo.
	set -l repo_name (basename (pwd))
	
	# Gets the description of the current commit (e.g. v26-517)
	set -l git_describe (git describe --tags | sed 's/\(.*\)-.*/\1/')

	# Gets the branch of the current commit
	set -l git_branch (git rev-parse --abbrev-ref HEAD)

	# Gets the commit hash of the current commit
	set -l git_commit_hash (git log --pretty=format:'%h' -n 1)

	echo "Fixed in $repo_name $git_describe [$git_branch $git_commit_hash]"
	echo ""

	# Print the commit message body (does not include the subject, which is assumed to be a Radar Problem URL and Title)
	eval git log -1 --pretty=%b
end

