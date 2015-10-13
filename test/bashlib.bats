#!/usr/bin/env bats

load bashlib

@test "check that bashlib's functions exist" {
    local -i cumulative_status=0
    for function in require bashlibinc bashlibsrc; do
        run declare -F "$function" &>/dev/null
        [[ "$status" -eq 0 ]]
    done
}

@test "check that \$BASHLIB contains \$BATS_BASHLIB" {
    run echo "$BASHLIB"
    [[ "${lines[0]}" == *"$BATS_BASHLIB"* ]]
    run bashlibsrc
    [[ "${lines[*]}" == *"$BATS_BASHLIB"* ]]
}

@test "check existence of shell script files" {
    [[ -f "$pretty_path" ]]
    [[ -f "$spoon_path" ]]
}

@test "check that relative path require works" {
    run require "$pretty_relpath"
    [[ "$status" -eq 0 ]]

    require "$pretty_relpath"
    run pretty
    [[ "${lines[0]}" == "$pretty_msg" ]]


    run require "$spoon_relpath"
    [[ "$status" -eq 0 ]]

    require "$spoon_relpath"
    run spoon
    [[ "${lines[0]}" == "$spoon_msg" ]]
}

@test "check that perl-style require works" {
    run require i::am::pretty

    require i::am::pretty
    [[ "$status" -eq 0 ]]
    run pretty
    [[ "${lines[0]}" == "$pretty_msg" ]]

    run require no::spoon
    [[ "$status" -eq 0 ]]
    run pretty
    [[ "${lines[0]}" == "$pretty_msg" ]]
}

# vi: set ft=sh
