#!/bin/bash

if [[ $0 == *config.sh ]]; then
  echo "You cannot execute this file. Please execute pull.sh from its own"
  echo "directory."
  exit 1
fi

# Define auth.
auth=

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

if [[ -z $auth ]]; then
  echo "Auth not defined."
  exit 1
fi
