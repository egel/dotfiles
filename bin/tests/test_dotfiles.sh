#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
dotfiles_program="$DIR/../dotfiles"

test_print_version() {
  result=$("$dotfiles_program" --version)

  assertTrue \
    "it should print correct format of the version of the program 'vX.Y.Z' using flag syntax" \
    "[[ $result =~ ^v([0-9]+\.[0-9]+\.[0-9]+) ]]"
}

test_empty_run() {
  result=$($dotfiles_program --empty-run)

  assertTrue "it should does and print nothing" "[ -z $result ]"
}

test_normal_run() {
  result=$($dotfiles_program)

  assertTrue "it should print info message that program did nothing" \
    '[[ $result = *"Nothing happened"* ]]';

  test_string="Run: 'dotfiles --help' to print help menu."
  assertTrue "it should print instruction how to run the help for the program" \
    '[[ $result = *"$test_string"* ]]'
}

. "../../lib/shunit2/source/2.1/src/shunit2"
