#!/usr/bin/env bash

input=README.md

has_section() {
  grep -e "^${1}$" ${input} | cut -d: -f1
}

error() {
  echo ">>> $1"
}

section=Usage
usage=$(has_section "## ${section}")
if [ -z "${usage}" ]; then
  error "Missing ${section} section, added by defulat at end of ${input}, refactor could required."
fi
