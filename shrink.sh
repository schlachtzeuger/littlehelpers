#!/bin/bash

for f in `ls *.?*`
do

	if [ -f "resized/$f" ]; then
		echo "resized/$f already exists"
		continue
	fi


	echo "$f: convert file"
	convert $f -auto-orient -resize 1024x1024\> resized/$f
	echo "$f: fix exif"
	exiftool -all= -tagsfromfile @ -all:all -unsafe -icc_profile -overwrite_original_in_place resized/$f
	
done