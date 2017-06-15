#!/bin/bash

# Check if user is defined.
if [[ -z $1 ]]; then
  echo "This partial file should not be executed independently."
  exit 1
fi

# Define vars.
user=$1
sndx=0
count=1

while [[ $count -ne 0 ]]; do
  # Get conversations.
  tmp_history=$(wget -O - "https://api.hipchat.com/v2/user/$user/history?auth_token=$auth&max-results=$maxr&start-index=$sndx&date=$date&reverse=$rvrs")

  # Check whether to while loop again.
  if [[ $(echo $tmp_history | jq '.items | length') -eq 0 ]]; then
    # Don't while loop again.
    count=0

    # Reset sndx.
    sndx=0
  else
    # Rename to .json file.
    echo $tmp_history | jq '.' > $user.$sndx.json

    # Add 1k to sndx.
    sndx=$[$sndx+1000]
  fi
done
