#!/bin/bash
# Script to convert avi to mp4 using ffmpeg
# Install function using Brew.
# Prompts user for input file name & location
# Prompts user for crf value and only accepts integers

# Install ffmpeg via brew
install () {
  brew install ffmpeg
}

# Ask user for input .avi file and location and store in input variable
input () {
  read -p "Input full path to .avi file: " input
}

# ffmpeg avi to mp4 conversion. Accepts integers only for crf value
convert () {
  count=0
  while [ $count -eq 0 ]
  do
    read -p "Select crf (Constant rate factor. 23 is default) 0-51 integer value: " crf
    if ! [[ "$crf" =~ ^[0-9]+$ ]]
        then
            echo "Sorry integers only"
        else
            count=$((count+1))
    fi
  done
  ffmpeg -i $input -crf $crf ~/Downloads/output.mp4
}

# Run functions
install
input
convert

echo "Avi to mp4 conversion completed...."