# Turn Wi-Fi off and back on.
# Source: https://github.com/razzius/fish-functions/blob/master/functions/wifi.fish
function wifi
    networksetup -setairportpower en0 off
    networksetup -setairportpower en0 on
end
