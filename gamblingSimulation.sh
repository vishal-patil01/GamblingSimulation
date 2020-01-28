#!/bin/bash 

echo "Welcome To Gambling Simulation"

#!Initializing Constants
STAKE_PER_DAY=100
BET=1
MIN_PERCENT=$((STAKE_PER_DAY-$((STAKE_PER_DAY * 50 /100)) ))
MAX_PERCENT=$((STAKE_PER_DAY+$((STAKE_PER_DAY * 50 /100)) ))

#!Initializing Variables & Declaring Dictionary
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
#stored daily gain amount by subtracting Stack value
gainCash=$((cash-STAKE_PER_DAY))

#!return gainCash
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

#!finding Luckiest & Unluckiest Day by calling sortDictionary function and getting 1st(Top) result
echo "Luckiest Day is $(sortDictionary | head -1 ) "
echo "Unluckiest Day is $(sortDictionary | tail -1) "
}

#!Descending Sort all key value pair of dictionary 
function sortDictionary() {
for day in ${!sumOfBets[@]}
do
	echo "$day : ${sumOfBets[$day]}"
done | sort -k3 -rn 

}

function playNextMonth() {
#! calling Monthly Gambling to start game
monthlyGambling

#!checking Previous month balance of Gambler and Decides He/She will be playing or not
while [ ${sumOfBets[Day20]} -gt 0 ]
do
	echo -e "\e[1;34m Last Month Balance = ${sumOfBets[Day20]} \e[0m \nPlaying Next Month\n"
	monthlyGambling
done
	echo -e "\e[1;35m Last Month Balance = ${sumOfBets[Day20]} \e[0m \nNot Playing Next Month"
}

#!Starting Game
playNextMonth
