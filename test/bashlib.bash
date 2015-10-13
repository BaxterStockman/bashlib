#!/usr/bin/env bash

BATS_BASHLIB="$BATS_TEST_DIRNAME/bashlib"
: ${BATS_TEST_LOG="${PWD}/bats.log"}

pretty_relpath="i/am/pretty.sh"
pretty_path="${BATS_BASHLIB}/${pretty_relpath}"
pretty_name=pretty
pretty_msg='I am pretty'

spoon_relpath="no/spoon.sh"
spoon_path="${BATS_BASHLIB}/${spoon_relpath}"
spoon_name='spoon'
spoon_msg='There is no spoon'

make_script () {
    local script_path="$1"
    shift
    local function_name="$1"
    shift
    local command="$1"

    mkdir -p "${script_path%/*}"

    cat <<-_SCRIPT_ > "$script_path"
$function_name () {
    $command ;
}
_SCRIPT_

    chmod +x "$script_path"
}

setup () {
    eval "$(bashlib --source)"

    export BASHLIB="$BATS_BASHLIB"

    make_script "$pretty_path" "$pretty_name" "echo '$pretty_msg'"
    make_script "$spoon_path" "$spoon_name" "echo '$spoon_msg'"

    declare -p BASHLIBINC BASHLIBSRC >> "$BATS_TEST_LOG"
}

teardown () {
    [[ -d "$BATS_BASHLIB" ]] && rm -rf "$BATS_BASHLIB"
    unset -f "$pretty_name" "$spoon_name"
}
