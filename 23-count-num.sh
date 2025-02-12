#!/bin/bash

# Check if a filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# Read the filename from the command line argument
filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
  echo "File not found: $filename"
  exit 1
fi

# Process the file to count word occurrences, sort them by frequency, and display the top 5
echo "Top 5 most frequent words in $filename:"
cat "$filename" | tr -cs '[:alnum:]' '[\n*]' | sort | uniq -c | sort -nr | head -n 5
