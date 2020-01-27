#!/bin/bash -x

echo "Welcome To Gambling Simulation"

#!Initializing Constants
STAKE_PER_DAY=100
BET=1

#!Initializing Variables
cash=$STAKE_PER_DAY

#!Function to Check Win Or Loss
function dailyBet() {
if [ $((RANDOM % 2)) -eq 1 ]
then
	echo "Win"
	cash=$((cash+BET))
else
	echo "Loose"
	cash=$((cash-BET))
fi
}

dailyBet
