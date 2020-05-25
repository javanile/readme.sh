#!/usr/bin/env bash

input=README.md

## Usage
has_usage_=$(grep -e "^## Usage$" ${input} | cut -d: -f1)
if ! ; then
  echo "A"
else 
  echo "B"
fi


