#!/bin/bash 

echo "Welcome To Gambling Simulation"

#!Initializing Constants
STAKE_PER_DAY=100
BET=1
MIN_PERCENT=$((STAKE_PER_DAY-$((STAKE_PER_DAY * 50 /100)) ))
MAX_PERCENT=$((STAKE_PER_DAY+$((STAKE_PER_DAY * 50 /100)) ))

#!Initializing Variables
cash=$STAKE_PER_DAY

#!Function to Check Win Or Loss
function dailyBet() {
while [ $cash -gt $MIN_PERCENT ] && [ $cash -lt $MAX_PERCENT ]
do
	if [ $((RANDOM % 2)) -eq 1 ]
	then
		cash=$((cash+BET))
		echo "Win  $cash"
	else
		cash=$((cash-BET))
		echo "Loose  $cash"
	fi
done
echo "Total " $cash
}

dailyBet
