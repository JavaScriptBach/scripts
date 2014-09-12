#!/bin/bash
find . -name "*\\*" -exec rename -v "s/\\/-/g" {} \;
find . -name "*:*" -exec rename -v "s/:/-/g" {} \;
find . -name "*\**" -exec rename -v "s/\*/-/g" {} \;
find . -name "*\?*" -exec rename -v "s/\?/-/g" {} \;
find . -name "*\"*" -exec rename -v "s/\"/-/g" {} \;
find . -name "*<*" -exec rename -v "s/</-/g" {} \;
find . -name "*>*" -exec rename -v "s/>/-/g" {} \;
find . -name "*\|*" -exec rename -v "s/\|/-/g" {} \;
