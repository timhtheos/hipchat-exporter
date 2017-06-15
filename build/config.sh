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
