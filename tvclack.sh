#!/bin/bash

downloadfolder="/home/carkasjak/Downloads"
unrarfolder="/home/carkasjak/TVshows"

# Find all .rar files within the download folder and subfolders, and unrar them to the desired location.
find "$downloadfolder" -iname *.rar -exec unrar e {} "$unrarfolder" \;
# Finish writing the files from memory to the disk
sync
# Nice big ascii "Done" message in the terminal
figlet "Done"
