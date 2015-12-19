#!/usr/bin/env bash

BATS_BASHLIB="$BATS_TEST_DIRNAME/fixtures/bashlib"
: "${BATS_TEST_LOG=${PWD}/bats.log}"

export pretty_relpath="i/am/pretty.sh"
export pretty_path="${BATS_BASHLIB}/${pretty_relpath}"
export pretty_name=pretty
export pretty_msg='I am pretty'

export spoon_relpath="no/spoon.sh"
export spoon_path="${BATS_BASHLIB}/${spoon_relpath}"
export spoon_name='spoon'
export spoon_msg='There is no spoon'

setup () {
    eval "$(bashlib --source)"
    export BASHLIB="$BATS_BASHLIB"
}

teardown () {
    unset -f "$pretty_name" "$spoon_name"
}
