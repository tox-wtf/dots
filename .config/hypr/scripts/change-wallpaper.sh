#!/usr/bin/env bash

wallpaper_directory="$HOME/img/wp"
tempfile=$(mktemp)

fd -tf --base-directory "$wallpaper_directory" | shuf | fzm > $tempfile

[[ -s $tempfile ]] && awww img "$wallpaper_directory/$(<"$tempfile")" -t any --transition-fps 240 --transition-duration 1
rm -f $tempfile
