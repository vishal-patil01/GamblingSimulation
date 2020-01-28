#!/bin/bash 

echo "Welcome To Gambling Simulation"

#!Initializing Constants
STAKE_PER_DAY=100
BET=1
MIN_PERCENT=$((STAKE_PER_DAY-$((STAKE_PER_DAY * 50 /100)) ))
MAX_PERCENT=$((STAKE_PER_DAY+$((STAKE_PER_DAY * 50 /100)) ))

#!Initializing Variables & Dictionary
cash=$STAKE_PER_DAY
declare -A sumOfBets

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
	#!storing Each Day amount in Dictionary
	sumOfBets[Day$i]=$((${sumOfBets[Day$((i-1))]} + $(dailyBet)))
done  

#!finding Luckiest & Unluckiest Day by calling luck function and sort it to get 1st result
echo "Luckiest Day is $(luck | sort -k3 -rn | head -1 ) "
echo "Unluckiest Day is $(luck | sort -k3 -n | head -1) "
}


#!loop through all key value pair of dictionary 
function luck() {
for day in ${!sumOfBets[@]}
do
	echo "$day : ${sumOfBets[$day]}"
done  

}

#!Starting game
monthlyGambling
