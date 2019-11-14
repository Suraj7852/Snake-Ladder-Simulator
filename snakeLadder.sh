#!/bin/bash -x

echo "Welcome to Snake & Ladder Simulator"

PLAYER=1;
position=0;

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