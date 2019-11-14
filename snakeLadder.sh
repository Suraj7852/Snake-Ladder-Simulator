#!/bin/bash -x
echo "Welcome to Snake & Ladder Simulator"

PLAYER=2;
position=0;
winCountby1=0;
winCountby2=0;
timesCounter=0;
player1Count=0;
player2Count=0;
declare -A noOfTimeRolled

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
    positionRecievedby1=$( positionChk )
    winCountby1=$(( $winCountby1+$positionRecievedby1 ))

    positionRecievedby2=$( positionChk )
    winCountby2=$(( $winCountby2+$positionRecievedby2 ))

    timesCounter=$(( $timesCounter+1 ))
    
    
    noOfTimeRolled[$timesCounter]=$winCountby1

    if [ $winCountby1 -gt 100 ]
    then
        winCountby1=$(( $winCountby1-$positionRecievedby1 ))
    elif [ $winCountby1 -lt 0 ]
    then
        winCountby1=0;
    elif [ $winCountby1 -eq 100 ]
    then
        echo "Player 1 Won!!!"
        break;
    fi

    if [ $winCountby2 -gt 100 ]
    then
        winCountby2=$(( $winCountby2-$positionRecievedby2 ))
    elif [ $winCountby2 -lt 0 ]
    then
        winCountby2=0;
    elif [ $winCountby2 -eq 100 ]
    then
    echo "Player 2 Won!!!"
        break;
    fi
done  