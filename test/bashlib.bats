#!/usr/bin/env bats

load bashlib

@test "bashlib's functions exist" {
    for function in require bashlibinc bashlibsrc; do
        run declare -F "$function" &>/dev/null
        # Bats traps all commands that exit non-zero
        (( status == 0 ))
    done
}

@test "\$BASHLIB contains \$BATS_BASHLIB" {
    run echo "$BASHLIB"
    [[ "${lines[0]}" == *"$BATS_BASHLIB"* ]]
    run bashlibsrc
    [[ "${lines[*]}" == *"$BATS_BASHLIB"* ]]
}

@test "fixture files exist" {
    [[ -f "$pretty_path" ]]
    [[ -f "$spoon_path" ]]
}

@test "relative path require works" {
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
    [[ "$status" -eq 0 ]]

    require i::am::pretty
    run pretty
    [[ "${lines[0]}" == "$pretty_msg" ]]

    run require no::spoon
    [[ "$status" -eq 0 ]]

    run pretty
    [[ "${lines[0]}" == "$pretty_msg" ]]
}

@test "--deactivate unsets all functions" {
    bashlib --deactivate
    for f in bashlib{,inc,src,::{help,usage,mkmap,addentry,truthy}}; do
        ! declare -F "$f" &>/dev/null
    done
}

@test "--add-lib adds libraries to search path" {
    bashlib --add-lib /fake/lib --add-lib /dummy/path

    local -a libpaths=()
    while read -r lib; do
        libpaths+=("$lib")
    done < <(bashlibsrc)

    # Paths are added LIFO
    [[ "${libpaths[*]}" == */dummy/path*/fake/lib* ]]
}

# vi: set ft=sh
