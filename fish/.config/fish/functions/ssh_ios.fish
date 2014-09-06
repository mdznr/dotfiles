# Start SSH on the connected iOS device.
function ssh_ios
	/usr/local/bin/tcprelay --portoffset 2000 ssh &
	ssh -o NoHostAuthenticationForLocalhost=yes -p 2022 mobile@localhost
end
