#!/bin/bash

if [[ $0 == *executions.sh ]]; then
  echo "You cannot execute this file. Please execute pull.sh from its own"
  echo "directory."
  exit 1
fi

# Export users.
#
# Assuming that the number of users is less than 1000.
users=$(getUsers)
echo $users | jq '.' > $export_path/users.json

# Get user IDs.
user_ids=$(echo $users | jq '.items[] | .id')

# Get user info.
for user in $user_ids; do
  getUserInfo $user > $export_path/user.$user.json
done

# Get user chat history.
#

# Define start index.
start_index=0

user_ids="3454640 1343698"

for user in $user_ids; do
  count=1

  while [[ $count -ne 0 ]]; do
    chat_history=$(getUserChatHistory $user $start_index)

    # Check whether to while loop again.
    if [[ $(echo $chat_history | jq '.items | length') -eq 0 ]]; then
      # Don't while loop again.
      count=0

      # Reset start index.
      start_index=0
    else
      # Write to file.
      echo $chat_history | jq '.' > $export_path/user.$user.chat.$start_index.json

      # Increment start index by 1k.
      start_index=$[$start_index+1000]
    fi
  done

  # Reset start index.
  start_index=0
done
