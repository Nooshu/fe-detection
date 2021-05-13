#!/usr/bin/env bats

script_path="$BATS_TEST_DIRNAME/fe-test.sh -u "

function url_for() {
  v="$1"
  echo "https://raw.githubusercontent.com/alphagov/govuk-frontend/v$v/dist/govuk-frontend-$v.min.css"
}

function matches_versions() {
  for v in $@; do
    grep -qF $v <<< "$output"
  done
}

function not_matches_versions() {
  for v in $@; do
    grep -vqF $v <<< "$output"
  done
}

@test "1.0.0" {
  run $script_path "$(url_for 1.0.0)"
  [ "$status" -eq 0 ]
  matches_versions 1.0.0
  not_matches_versions 1.1.0 1.2.0
}

@test "1.1.0" {
  run $script_path "$(url_for 1.1.0)"
  [ "$status" -eq 0 ]
  matches_versions 1.0.0 1.1.0
  not_matches_versions 1.2.0 1.3.0
}

@test "1.2.0" {
  run $script_path "$(url_for 1.2.0)"
  [ "$status" -eq 0 ]
  matches_versions 1.0.0 1.1.0 1.2.0
  not_matches_versions 1.3.0 2.0.0
}

@test "1.3.0" {
  run $script_path "$(url_for 1.3.0)"
  [ "$status" -eq 0 ]
  matches_versions 1.1.0 1.2.0 1.3.0
  not_matches_versions 2.0.0 2.1.0
}

@test "2.0.0" {
  run $script_path "$(url_for 2.0.0)"
  [ "$status" -eq 0 ]
  matches_versions 1.2.0 1.3.0 2.0.0
  not_matches_versions 2.1.0 2.2.0
}

@test "2.1.0" {
  run $script_path "$(url_for 2.1.0)"
  [ "$status" -eq 0 ]
  matches_versions 1.3.0 2.0.0 2.1.0
  not_matches_versions 2.2.0 2.3.0
}

@test "2.2.0" {
  run $script_path "$(url_for 2.2.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.0.0 2.1.0 2.2.0
  not_matches_versions 2.3.0 2.4.0
}

@test "2.3.0" {
  run $script_path "$(url_for 2.3.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.1.0 2.2.0 2.3.0
  not_matches_versions 2.4.0 2.5.0
}

@test "2.4.0" {
  run $script_path "$(url_for 2.4.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.2.0 2.3.0 2.4.0
  not_matches_versions 2.5.0 2.6.0
}

# Single matches due to more complex search pattern, not direct changes in the CSS
@test "2.5.0" {
  run $script_path "$(url_for 2.5.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.5.0
  not_matches_versions 2.6.0 2.7.0
}

@test "2.6.0" {
  run $script_path "$(url_for 2.6.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.2.0 2.3.0 2.6.0
  not_matches_versions 2.7.0 2.8.0
}

@test "2.7.0" {
  run $script_path "$(url_for 2.7.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.3.0 2.6.0 2.7.0
  not_matches_versions 2.8.0 2.9.0
}

@test "2.8.0" {
  run $script_path "$(url_for 2.8.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.6.0 2.7.0 2.8.0
  not_matches_versions 2.9.0 3.0.0
}

@test "2.9.0" {
  run $script_path "$(url_for 2.9.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.7.0 2.8.0 2.9.0
  not_matches_versions 2.10.0 2.11.0
}

@test "2.10.0" {
  run $script_path "$(url_for 2.10.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.8.0 2.9.0 2.10.0
  not_matches_versions 2.11.0 2.13.0
}

# Single matches due to more complex search pattern, not direct changes in the CSS
@test "2.11.0" {
  run $script_path "$(url_for 2.11.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.11.0
  not_matches_versions 2.13.0 3.0.0
}

# Not possible to identify 2.12.0

# Single matches due to more complex search pattern, not direct changes in the CSS
@test "2.13.0" {
  run $script_path "$(url_for 2.13.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.13.0
  not_matches_versions 3.0.0 3.1.0
}

@test "3.0.0" {
  run $script_path "$(url_for 3.0.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.8.0 2.9.0 3.0.0
  not_matches_versions 3.1.0 3.2.0
}

@test "3.1.0" {
  run $script_path "$(url_for 3.1.0)"
  [ "$status" -eq 0 ]
  matches_versions 2.9.0 3.0.0 3.1.0
  not_matches_versions 3.2.0 3.3.0
}

# Single matches due to more complex search pattern, not direct changes in the CSS
@test "3.2.0" {
  run $script_path "$(url_for 3.2.0)"
  [ "$status" -eq 0 ]
  matches_versions 3.2.0
  not_matches_versions 3.3.0 3.4.0
}

@test "3.3.0" {
  run $script_path "$(url_for 3.3.0)"
  [ "$status" -eq 0 ]
  matches_versions 3.0.0 3.1.0 3.3.0
  not_matches_versions 3.4.0 3.5.0
}

@test "3.4.0" {
  run $script_path "$(url_for 3.4.0)"
  [ "$status" -eq 0 ]
  matches_versions 3.1.0 3.3.0 3.4.0
  not_matches_versions 3.5.0 3.6.0
}

@test "3.5.0" {
  run $script_path "$(url_for 3.5.0)"
  [ "$status" -eq 0 ]
  matches_versions 3.3.0 3.4.0 3.5.0
  not_matches_versions 3.6.0 3.7.0
}

@test "3.6.0" {
  run $script_path "$(url_for 3.6.0)"
  [ "$status" -eq 0 ]
  matches_versions 3.3.0 3.4.0 3.6.0
  not_matches_versions 3.7.0 3.8.0
}

@test "3.7.0" {
  run $script_path "$(url_for 3.7.0)"
  [ "$status" -eq 0 ]
  matches_versions 3.4.0 3.6.0 3.7.0
  not_matches_versions 3.8.0 3.9.0
}

@test "3.8.0" {
  run $script_path "$(url_for 3.8.0)"
  [ "$status" -eq 0 ]
  matches_versions 3.6.0 3.7.0 3.8.0
  not_matches_versions 3.9.0
}

@test "3.9.0" {
  run $script_path "$(url_for 3.9.0)"
  [ "$status" -eq 0 ]
  matches_versions 3.7.0 3.8.0 3.9.0
}

@test "3.10.0" {
  run $script_path "$(url_for 3.10.0)"
  [ "$status" -eq 0 ]
  matches_versions 3.8.0 3.9.0 3.10.0
}

@test "3.11.0" {
  run $script_path "$(url_for 3.11.0)"
  [ "$status" -eq 0 ]
  matches_versions 3.9.0 3.10.0 3.11.0
}

@test "3.12.0" {
  run $script_path "$(url_for 3.12.0)"
  [ "$status" -eq 0 ]
  matches_versions 3.10.0 3.11.0 3.12.0
}