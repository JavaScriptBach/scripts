#!/bin/bash
if [ $# -eq 1 ]; then
	~/Music/flac2all_v3.38.py mp3 "$1" -o ~/"$1"
	mv ~/"$1" /media/phillip/F6FCE03DFCDFF5B9/Users/Phillip/itunes
else
	echo "Usage: $0 DIR, DIR contains .flac files"
fi