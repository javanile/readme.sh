#!/usr/bin/env bash
set -e

input=README.md
declare -A section

require_section() {
  section[${1}]=$(grep -ne "^## ${1}$" ${input} | cut -d: -f1)
  if [[ -z "${section[${1}]}" ]]; then
    echo "## ${1}" >> ${input}
    echo "${2}" >> ${input}
    error "Missing '${1}' section, adding by default at end of '${input}', refactor could required."
  fi
}

order_section () {
  #echo "${section[$1]} ${section[$2]}"
  if [[ "${section[$1]}" -gt "${section[$2]}" ]]; then
    error "Move the '$1' section on top of the '$2' section"
  fi
}

error() {
  echo ">>> |"
  echo ">>> | ERROR: $1"
  echo ">>> |"
  exit 1
}

require_section "Usage"
require_section "Testing"

order_section "Usage" "Testing"

if [[ -z "$(command -v mdl)" ]]; then
  echo "To improve MARKDOWN quality install Markdown list tool with: sudo gem install mdl"
else
  mdl ${input}
fi
