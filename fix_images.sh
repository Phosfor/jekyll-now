#!/bin/bash

for file in images/*.jpg; do
    orientation=$(identify -format '%[orientation]' "$file")
    if ! [ "$orientation" = "Undefined" ] && ! [ "$orientation" = "TopLeft" ] ; then
        echo "Fixing $file (currently: $orientation)"
        mogrify -auto-orient $file
    fi
done