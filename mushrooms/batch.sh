#! /usr/bin/env bash
FILES=$(find -name "*.jpg" | sed "s/\.jpg//" | sort)

for file in $FILES; do
    echo "Processing $file..."
    convert "$file.jpg" "$file.bmp"
    potrace -s --flat --tight --blacklevel "0.48" -o "$file.svg" "$file.bmp"
    svgcleaner --quiet "$file.svg" "$file.svg"
done
rm *.bmp
