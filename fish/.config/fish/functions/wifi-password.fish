# Prints the currently connected Wi-Fi network’s password.
# Source: https://github.com/razzius/fish-functions/blob/master/functions/wifi-password.fish
function wifi-password
    security find-generic-password -wa (wifi-network-name)
end
