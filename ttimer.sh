#!/bin/bash

# Requires pulseaudio, figlet and a notification daemon (like dunst) to work as intended, 
# but you can easily comment out or delete the parts you don't want.

# Default timer is 120 seconds (2 minutes)
sleeptime=120
#Edit the message string to output when the time is up.
messagestring="Your tea is ready!"
# Choose an alarm sound to use
alarmsound="/home/carkasjak/Audio/1happyhello.wav"


# Accepts an integer as input to specify number of seconds
if [[ "$1" =~ ^-?[0-9]+$ ]]; then
	sleeptime="$1"
	echo "Counting down from $1 seconds."
else
	echo "Counting down from $sleeptime seconds. (default)"
fi

# Counting down
for (( i="$sleeptime"; i > 0; i-- )) 
do 
	# By using printf with carriage return we get a nice countdown timer 
	# without spamming the terminal with new lines
	printf "\r$i seconds remaining.      "
	sleep 1
done
echo ""

# The alarm itself

notify-send "$messagestring" 
figlet "$messagestring" 
paplay "$alarmsound" &
