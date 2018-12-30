#!/bin/bash
# shellcheck disable=SC1091,SC2034
# SC1091: Not following: (error message here)
# SC2034: foo appears unused. Verify it or export it

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
_dotfiles_program="$DIR/../dotfiles"

test_print_version() {
  result=$("$_dotfiles_program" --version)

  assertTrue \
    "it should print correct format of the version of the program 'vX.Y.Z' using flag syntax" \
    "[[ $result =~ ^v([0-9]+\\.[0-9]+\\.[0-9]+) ]]"
}

test_empty_run() {
  result=$($_dotfiles_program --empty-run)

  assertTrue "it should does and print nothing" "[ -z $result ]"
}

test_normal_run() {
  result=$($_dotfiles_program)

  assertTrue "it should print info message that program did nothing" \
    "[[ $result = *"Nothing happened"* ]]"

  test_string="Run: 'dotfiles --help' to print help menu."
  assertTrue "it should print instruction how to run the help for the program" \
    "[[ $result = *$test_string* ]]"
}

source "../../lib/shunit2/source/2.1/src/shunit2"
