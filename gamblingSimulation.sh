#!/bin/bash 

echo "Welcome To Gambling Simulation"

#!Initializing Constants
STAKE_PER_DAY=100
BET=1
MIN_PERCENT=$((STAKE_PER_DAY-$((STAKE_PER_DAY * 50 /100)) ))
MAX_PERCENT=$((STAKE_PER_DAY+$((STAKE_PER_DAY * 50 /100)) ))

#!Initializing Variables
cash=$STAKE_PER_DAY

#!Function for Daily Betting
function dailyBet() {
while [ $cash -gt $MIN_PERCENT ] && [ $cash -lt $MAX_PERCENT ]
do
	if [ $((RANDOM % 2)) -eq 1 ]
	then
		cash=$((cash+BET))
	else
		cash=$((cash-BET))
	fi
done
gainCash=$((cash-STAKE_PER_DAY))
echo $gainCash
}

#!function for Monthly Bet

function monthlyGambling() {
#!loop for 20 Days
for ((i=1;i<=20;i++))
do
	totalAmount=$((totalAmount + $(dailyBet)))
done

#!Checking for Win or loose
if [ $totalAmount -gt 0 ]
then
	echo "Total Amount Won in 20 Days $totalAmount"
else
	echo "Total Amount Loose in 20 Days $totalAmount"
fi
}

#!Starting game
monthlyGambling
