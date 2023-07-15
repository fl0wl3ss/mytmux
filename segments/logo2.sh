# Prints the local network IPv4 address for a statically defined NIC or search for an IPv4 address on all active NICs.

run_segment() {
	if shell_is_bsd || shell_is_osx ; then
		all_nics=$(ifconfig 2>/dev/null | awk -F':' '/^[a-z]/ && !/^lo/ { print $1 }' | tr '\n' ' ')
		IFS=' ' read -ra all_nics_array <<< "$all_nics"
		for nic in "${all_nics_array[@]}"; do
			ipv4s_on_nic=$(ifconfig ${nic} 2>/dev/null | awk '$1 == "inet" { print $2 }')
			for lan_ip in ${ipv4s_on_nic[@]}; do
				[[ -n "${lan_ip}" ]] && break
			done
			[[ -n "${lan_ip}" ]] && break
		done
	else
		# Get the names of all attached NICs.
		all_nics="$(ip addr show | cut -d ' ' -f2 | tr -d :)"
		all_nics=(${all_nics[@]/lo/})    # Remove lo interface.

		lan_ip=""

		# Check if tun0 exists in all_nics.
		if [[ " ${all_nics[@]} " =~ " tun0 " ]]; then
		    # Parse IP address for tun0.
		    lan_ip="$(ip addr show tun0 | grep '\<inet\>' | tr -s ' ' | cut -d ' ' -f3)"
		    # Trim the CIDR suffix.
		    lan_ip="${lan_ip%/*}"
	    # Only display the last entry
		    lan_ip="$(echo "$lan_ip" | tail -1)"
		    echo ""
		    return 0
		fi

	# If lan_ip is still empty, perform the same process as before.
		if [ -z "$lan_ip" ]; then
		    for nic in "${all_nics[@]}"; do
		        # Parse IP address for the NIC.
		        lan_ip="$(ip addr show ${nic} | grep '\<inet\>' | tr -s ' ' | cut -d ' ' -f3)"
		        # Trim the CIDR suffix.
		        lan_ip="${lan_ip%/*}"
        		# Only display the last entry
  		      	lan_ip="$(echo "$lan_ip" | tail -1)"

  		        [ -n "$lan_ip" ] && break
    	            done
		fi


	fi
	echo " "
	return 0
}
