#!/bin/bash

# Requires espeak, figlet and a notification daemon to work correctly.

# Default timer is 120 seconds (2 minutes)
sleeptime=120
messagestring="Your tea is ready!"


# Accepts an integer as input to specify number of seconds
if [[ "$1" =~ ^-?[0-9]+$ ]]; then
	sleeptime="$1"
else
	echo "$1 is not an integer. Using default time. ($sleeptime seconds)"
	echo ""
fi


for (( i="$sleeptime"; i > 0; i-- )) 
do 
	printf "\r$i seconds remaining.      "
	sleep 1
done

echo ""



# Comment out or remove any of the lines below if you're missing their dependencies.
notify-send "$messagestring"; 
figlet "$messagestring"; 
#espeak "$messagestring";
paplay /home/carkasjak/Audio/1happyhello.wav &

