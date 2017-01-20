#!/bin/bash

set -e

main() {
  "$WERCKER_STEP_ROOT"/shellcheck -V

  local args=()

  # Add optional "exclude" flags, comma separated list of ignored warnings
  if [ -n "$WERCKER_SHELLCHECK_EXCLUDE" ]; then
    args+="--exclude=$WERCKER_SHELLCHECK_EXCLUDE"
  fi

  # Add optional "format" flags
  if [ -n "$WERCKER_SHELLCHECK_FORMAT" ]; then
    args+="--format=$WERCKER_SHELLCHECK_FORMAT"
  fi

  # Add optional "shell" flags, change the dialect (bash,sh,ksh,zsh)
  if [ -n "$WERCKER_SHELLCHECK_SHELL" ]; then
    args+="--shell=$WERCKER_SHELLCHECK_SHELL"
  fi

  # Make sure files is not empty
  if [ -z "$WERCKER_SHELLCHECK_FILES" ]; then
    fail "No files specified (or glob retrieved no files)"
  fi

  IFS=$WERCKER_SHELLCHECK_SEPARATOR files=($WERCKER_SHELLCHECK_FILES)

  echo -e "\nshellcheck" "${args[@]}" "${files[@]}"
  "$WERCKER_STEP_ROOT"/shellcheck "${args[@]}" "${files[@]}"
  success "No problems detected"
}

main
