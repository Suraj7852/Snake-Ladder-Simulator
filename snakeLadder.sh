#!/bin/bash -x
echo "Welcome to Snake & Ladder Simulator"

GOAL=100;
POSITION=0;
winCountbyPlayer1=0;
winCountbyPlayer2=0;
timesCounter=0;
player1Count=0;
player2Count=0;
declare -A noOfTimeRolled

function positionChk() {
    rolls=$(( RANDOM%6 +1 ))
    option=$(( RANDOM%3 ))
    if [ $option -eq 0 ]
    then
        POSITION=0
    elif [ $option -eq 1 ]
    then
        POSITION=$(( -$rolls ))
    else
        POSITION=$(( $rolls ))
    fi
    echo $POSITION
}

while [ true ]
do
    positionRecievedbyPlayer1=$( positionChk )
    winCountbyPlayer1=$(( $winCountbyPlayer1+$positionRecievedbyPlayer1 ))
    if [ $positionRecievedbyPlayer1 -gt 0 ]
    then
        positionRecievedbyPlayer1=$( positionChk )
        winCountbyPlayer1=$(( $winCountbyPlayer1+$positionRecievedbyPlayer1 ))
        echo "ladderby player 1:  "
    fi

    positionRecievedbyPlayer2=$( positionChk )
    winCountbyPlayer2=$(( $winCountbyPlayer2+$positionRecievedbyPlayer2 ))
    if [ $positionRecievedbyPlayer2 -gt 0 ]
    then
        positionRecievedbyPlayer2=$( positionChk )
        winCountbyPlayer2=$(( $winCountbyPlayer2+$positionRecievedbyPlayer2 ))
        echo "ladderby player 2:  "
    fi

    timesCounter=$(( $timesCounter+1 ))
    
    
    noOfTimeRolled[$timesCounter]=$winCountbyPlayer1

    if [ $winCountbyPlayer1 -gt $GOAL ]
    then
        winCountbyPlayer1=$(( $winCountbyPlayer1-$positionRecievedbyPlayer1 ))
    elif [ $winCountbyPlayer1 -lt 0 ]
    then
        winCountbyPlayer1=0;
    elif [ $winCountbyPlayer1 -eq $GOAL ]
    then
        echo "Player 1 Won!!!"
        break;
    fi

    if [ $winCountbyPlayer2 -gt $GOAL ]
    then
        winCountbyPlayer2=$(( $winCountbyPlayer2-$positionRecievedbyPlayer2 ))
    elif [ $winCountbyPlayer2 -lt 0 ]
    then
        winCountbyPlayer2=0;
    elif [ $winCountbyPlayer2 -eq $GOAL ]
    then
    echo "Player 2 Won!!!"
        break;
    fi
done
