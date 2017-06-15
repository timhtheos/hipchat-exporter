#!/bin/bash

path=$(pwd)

if [[ $path == *build ]]; then
  echo "This file - build/pull.sh - should not be executed directly."
  echo "Please execute pull.sh, and not build/pull.sh."
  exit 1
fi

path_build=$path/build

source $path_build/config.sh
source $path_build/methods.sh
