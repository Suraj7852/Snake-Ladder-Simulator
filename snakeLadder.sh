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

function positionCheck() {
    local rolls=$(( RANDOM%6 +1 ))
    local option=$(( RANDOM%3 ))
    local position=$POSITION
    if [ $option -eq 0 ]
    then
        position=0
    elif [ $option -eq 1 ]
    then
        position=$(( -$rolls ))
    else
        position=$(( $rolls ))
    fi
    echo $position
}

function winningPlayer() {
    winCountbyPlayer=$1
    positionRecievedbyPlayer=$2
    if [ $winCountbyPlayer -gt $GOAL ]
    then
        winCountbyPlayer=$(( $winCountbyPlayer-$positionRecievedbyPlayer ))
    elif [ $winCountbyPlayer -lt 0 ]
    then
        winCountbyPlayer=0;
    fi
    echo $winCountbyPlayer;
}

function ladderPlayAgain() {
    winCountbyPlayer=$1;
	 if [ $2 -gt 0 ]
    then
		  bonosRound=$( positionCheck )
        winCountbyPlayer=$(( $1+$bonosRound ))
    fi
	echo $winCountbyPlayer;
}

while [ true ]
do
    positionRecievedbyPlayer1=$( positionCheck )
    winCountbyPlayer1=$(( $winCountbyPlayer1+$positionRecievedbyPlayer1 ))
	 winCountbyPlayer1=$( ladderPlayAgain $winCountbyPlayer1 $positionRecievedbyPlayer1 )

    winCountbyPlayer1=$( winningPlayer $winCountbyPlayer1 $positionRecievedbyPlayer1 )
    if [ $winCountbyPlayer1 -eq $GOAL ]
    then
        echo "Player 1 Won!!! "
        break;
    fi


    positionRecievedbyPlayer2=$( positionCheck )
    winCountbyPlayer2=$(( $winCountbyPlayer2+$positionRecievedbyPlayer2 ))
	 winCountbyPlayer2=$( ladderPlayAgain $winCountbyPlayer2 $positionRecievedbyPlayer2)


    timesCounter=$(( $timesCounter+1 ))

    noOfTimeRolled[$timesCounter]=$winCountbyPlayer1

 
    winCountbyPlayer2=$( winningPlayer $winCountbyPlayer2 $positionRecievedbyPlayer2 )
    if [ $winCountbyPlayer2 -eq $GOAL ]
    then
        echo "Player 2 Won!!! "
        break;
    fi
done
