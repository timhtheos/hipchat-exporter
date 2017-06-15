#!/bin/bash

# Check if user is defined.
if [[ -z $1 ]]; then
  echo "This partial file should not be executed independently."
  exit 1
fi
