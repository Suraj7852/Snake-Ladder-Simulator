#!/bin/bash -x

echo "Welcome to Snake & Ladder Simulator"

PLAYER=1;
position=0;

function positionChk() {
    rolls=$(( RANDOM%6 +1 ))
    option=$(( RANDOM%3 ))
    if [ $option -eq 0 ]
    then
        position=$(( $position ))
    elif [ $option -eq 1 ]
    then
        position=$(( $position - $rolls ))
    else
        position=$(( $position + $rolls ))
    fi
    echo $position
}

while [ true ]
do
    positionRecieved=$( positionChk )
    winCount=$(( $winCount+$positionRecieved ))
    if [ $winCount -gt 100 ]
	then
		break;
    elif [ $winCount -lt 0 ]
    then
        winCount=0;
	fi
done