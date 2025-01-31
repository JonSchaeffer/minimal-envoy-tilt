#!/usr/bin/env -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.
#
# Just Manual - https://just.systems/man/en/
# https://just.systems/man/en/working-directory.html
# Settings - https://just.systems/man/en/settings.html
# https://just.systems/man/en/settings.html#bash

set shell := ["/usr/bin/env", "bash", "-uc"]

log := "warn"
export JUST_LOG := log

set quiet := true

docker-envoy:
    docker-compose -f ./compose.yaml up envoy --remove-orphans
