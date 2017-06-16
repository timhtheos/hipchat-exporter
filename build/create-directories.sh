#!/bin/bash

if [[ $0 -eq *create-directories.sh ]]; then
  echo "You cannot execute this file. Please execute pull.sh from its own"
  echo "directory."
  exit 1
fi

# Create exported path.
if [[ ! -d $export_path ]]; then
  mkdir $export_path
fi
