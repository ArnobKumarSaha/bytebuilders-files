#!/bin/sh

# Define the input file
INFILE=isrq.yaml

# Read the input file line by line
while read -r LINE
do
    # printf '%s\n' "$LINE"
    kubectl delete isrq "${LINE}"
done < "$INFILE"