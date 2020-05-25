#!/usr/bin/env bash

input=README.md
declare -A section

has_section() {
  grep -ne "^${1}$" ${input} | cut -d: -f1
}

error() {
  echo ">>> $1"
}

section_name=Usage
section[${section_name}]=$(has_section "## ${section_name}")
if [[ -z "section[${section_name}]" ]]; then
  error "Missing ${section_name} section, added by defulat at end of ${input}, refactor could required."
  echo "## ${section_name}" >> ${input}
  echo "This is how to use this" >> ${input}
fi

section_name=Testing
section[${section_name}]=$(has_section "## ${section_name}")
if [[ -z "$section[${section_name}]" ]]; then
  error "Missing ${section} section, added by defulat at end of ${input}, refactor could required."
  echo "## ${section}" >> ${input}
  echo "This is how to use this" >> ${input}
fi

if [[ "${section[Usage]}" -gt "${section[Testing]}" ]]; then
  error "Move the 'Usage' section on top of the 'Testing' section"
fi
