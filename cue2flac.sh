#!/bin/bash
if [ $# -eq 2 ]; then
	if [ "$1" = "-r" ]; then
		cd "$2"
		for folder in */; do
			cd "$folder"
			src=`find . -maxdepth 1 -iregex '.*\(flac\|ape\|wv\)' | head -1`
			cue=`find . -maxdepth 1 -iregex '.*\(cue\)' | head -1`
			if [ "$src" != "" -a "$cue" != "" ]; then
				cuebreakpoints "$cue" | shntool split -o flac "$src"
				cuetag "$cue" split-track*
				lltag --yes --no-tagging --rename '%n %t' split-track*
				find . -name "*\\*" -exec rename -v "s/\\/-/g" {} \;
				find . -name "*:*" -exec rename -v "s/:/-/g" {} \;
				find . -name "*\**" -exec rename -v "s/\*/-/g" {} \;
				find . -name "*\?*" -exec rename -v "s/\?/-/g" {} \;
				find . -name "*\"*" -exec rename -v "s/\"/-/g" {} \;
				find . -name "*<*" -exec rename -v "s/</-/g" {} \;
				find . -name "*>*" -exec rename -v "s/>/-/g" {} \;
				find . -name "*\|*" -exec rename -v "s/\|/-/g" {} \;
				rm "$cue"
				rm "$src"
			fi
			cd ..
		done
	else
		cuebreakpoints "$1" | shntool split -o flac "$2"
		cuetag "$1" split-track*
		lltag --yes --no-tagging --rename '%n %t' split-track*
		find . -name "*\\*" -exec rename -v "s/\\/-/g" {} \;
		find . -name "*:*" -exec rename -v "s/:/-/g" {} \;
		find . -name "*\**" -exec rename -v "s/\*/-/g" {} \;
		find . -name "*\?*" -exec rename -v "s/\?/-/g" {} \;
		find . -name "*\"*" -exec rename -v "s/\"/-/g" {} \;
		find . -name "*<*" -exec rename -v "s/</-/g" {} \;
		find . -name "*>*" -exec rename -v "s/>/-/g" {} \;
		find . -name "*\|*" -exec rename -v "s/\|/-/g" {} \;
		rm "$1"
		rm "$2"
	fi
else
	echo "Usage: $0 cue flac/ape/wv"
	echo "Or: $0 -r DIR, DIR contains subfolders that have 1 flac/ape/wv and 1 cue"
fi

