#!/usr/bin/env bash

input=README.md

if ! grep -e "^## Usage$" ${input}; then
  echo "A"
else 
  echo "B"
fi


