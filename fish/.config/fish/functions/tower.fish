# Open Tower for the current git repo.
function tower
	eval pushd ./
	eval gitroot
	eval gittower ./
	eval popd
end
