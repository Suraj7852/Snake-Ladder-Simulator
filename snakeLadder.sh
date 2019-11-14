#!/bin/bash -x

echo "Welcome to Snake & Ladder Simulator"

PLAYER=1;
position=0;

while [ true ]
do
    rolls=$(( RANDOM%6 +1 ))
    option=$(( RANDOM%3 ))
    if [ $option -eq 0 ]
    then
        position=$(( $position ))
        echo "No play"
    elif [ $option -eq 1 ]
    then
        position=$(( $position + $rolls ))
        echo "Snake"
    else
        position=$(( $position - $rolls ))
        echo "Ladder"
    fi
    
    if [ $position -gt 100 ]
	then
		break;
    elif [ $position -lt 0 ]
    then
        position=0;
	fi
done