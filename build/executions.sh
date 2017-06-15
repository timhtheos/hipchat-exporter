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
if [[ ! -f $exported_path/users.json ]]; then
  echo $users | jq '.' > $export_path/users.json
fi

# Get user IDs.
user_ids=$(echo $users | jq '.items[] | .id')

# Get user info.
for user in $user_ids; do
  if [[ ! -f $exported_path/user.$user.json ]]; then
    getUserInfo $user > $export_path/user.$user.json
  fi
done

# Get user chat history.
#

# Define start index.
start_index=0

for user in $user_ids; do
  count=1

  if [[ ! -f $export_path/user.$user.chat.$start_index.json ]]; then
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
        fi

        # Increment start index by 1k.
        start_index=$[$start_index+1000]
      fi
    done
  fi

  # Reset start index.
  start_index=0
done
