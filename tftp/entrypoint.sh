#!/bin/bash
flag_names=("BLOCKSIZE" "CREATE" "PORTRANGE" "MAPFILE" "PERMISSIVE" "REFUSE" "RETRANSMIT" "TIMEOUT" "UMASK" "VERBOSE" "VERBOSITY" "SECURE" "ROOT")
flags=""

# Loop through all flag names in the array
for flag_name in "${flag_names[@]}"; do
	flag_name=$(echo "$flag_name" | tr '[:upper:]' '[:lower:]')
  flag_value="${!flag_name}"

  if [ $flag_name != "root" ]; then
		if [ "$flag_value" == "1" ] || [ "$flag_value" == "true" ]; then
			flags+="--$flag_name "
		elif [ -n "$flag_value" ] && [ "$flag_value" != "" ]; then
    	flags+="--$flag_name $flag_value "
		fi
	else
		root=${flag_value:-/tfptboot}
	fi
done

# Run the command with the constructed flags
in.tftpd --foreground $flags $root