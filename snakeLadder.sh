#!/bin/bash -x

echo "Welcome to Snake & Ladder Simulator"

PLAYER=1;
POSITION=0;

rolls=$(( RANDOM%6 +1 ))