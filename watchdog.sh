#!/bin/bash

tries=0

function get_date() {
	date +'%D %T'
}

while true; do
	echo "$(get_date) checking server"
	node server_checker/check_server.js
	if [ "$?" -eq "0" ]; then
		tries=0
	else
		((tries++))
		if [ "$tries" -ge "2" ]; then
			echo -e "\tKilling and restarting"
			pkill srcds_run || true
			sleep 5
			./start.sh
			sleep 180
			echo -e "\t$(get_date) restarted"
			tries=0
		fi
	fi
	sleep 10
done
