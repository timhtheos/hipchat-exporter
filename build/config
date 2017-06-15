#!/bin/bash

# Define auth.
auth=QaohLWGHxhSQyxzNeRay9WYUVzzqYzD4blQHp6vo

# Define global max-results; max of 1000.
maxr=1000

# Define date so that we can paginate.
date=2017-06-15

# We just set reverse to false for better pagination.
rvrs=false

# Define base api path.
hipchat=https://api.hipchat.com/v2

# Define exported directory path.
export_path=exported

# Create exported path.
if [[ ! -d $export_path ]]; then
  mkdir $export_path
fi

# Get users.
#
# Requires:
#   None.
function getUsers {
  data=$(wget -O - "$hipchat/user?auth_token=$auth&max-results=$maxr")
  echo $data | jq '.'
}

# Get user info.
#
# Requires:
#   $1 - User ID.
function getUserInfo {
  if [[ -z $1 ]]; then
    echo "User ID is required to get user info."
    exit 1
  fi

  data=$(wget -O - "$hipchat/user/$1?auth_token=$auth")
  echo $data | jq '.'
}

# Get user chat history.
# 
# Requires:
#   $1 - User ID
#   $2 - Start index
function getUserChatHistory {
  if [[ -z $1 ]]; then
    echo "User ID is required to get user chat history."
    exit 1
  fi
  
  if [[ -z $2 ]]; then
    echo "Start index is required to get user chat history."
    exit 1
  fi

  data=$(wget -O - "$hipchat/user/$1/history?auth_token=$auth&max-results=$maxr&start-index=$2&date=$date&reverse=$rvrs")
  echo $data | jq '.'
}

# Get rooms.
#
# Requires:
#   None.
function getRooms {
  data=$(wget -O - "$hipchat/room?auth_token=$auth&max-results=$maxr")
  echo $data | jq '.'
}

# Get room info.
#
# Requires:
#   $1 - Room ID
function getRoomInfo {
  if [[ -z $1 ]]; then
    echo "Room ID is required to get room info."
    exit 1
  fi

  data=$(wget -O - "$hipchat/room/$1?auth_token=$auth")
  echo $data | jq '.'
}

# Get room chat history.
#
# Requires:
#   $1 - Room ID
#   $2 - Start index (defaults/initially to 0)
function getRoomChatHistory {
  if [[ -z $1 ]]; then
    echo "Room ID is required to get room chat history."
    exit 1
  fi
  
  if [[ -z $2 ]]; then
    echo "Start index is required to get room chat history."
    exit 1
  fi

  data=$(wget -O - "$hipchat/room/$1/history?auth_token=$auth&max-results=$maxr")
  echo $data | jq '.'
}

# getRoomInfo 2326068
getRoomChatHistory 2326068 0
