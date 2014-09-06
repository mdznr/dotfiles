# Deletes user defaults in the given domain name matching the given format
# 
# Example usage:
#
#     defaults_delete com.apple.Safari "\"NSWindow Frame [^\"]*\""
function defaults_delete
	defaults read $argv[1] | grep -o --regexp=$argv[2] | xargs -L1 defaults delete $argv[1]
end

