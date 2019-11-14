#!/bin/bash -x

echo "Welcome to Snake & Ladder Simulator"

PLAYER=1;
position=0;
winCount=0;
timesCounter=0;
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
    #prevWinCount=$winCount
    positionRecieved=$( positionChk )

    timesCounter=$(( $timesCounter+1 ))
    winCount=$(( $winCount+$positionRecieved ))
    noOfTimeRolled[$timesCounter]=$winCount

    if [ $winCount -gt 100 ]
    then
        winCount=$(( $wincount-$positionRecieved ))
    elif [ $winCount -lt 0 ]
    then
        winCount=0;
    elif [ $winCount -eq 100 ]
    then
        break;
    fi
done
#echo ${!noOfTimeRolled[@]}
echo ${noOfTimeRolled[@]}
echo $timesCounter