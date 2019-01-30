#!/bin/sh

set -e

sh -c "cargo login ${CRATES_AUTH_TOKEN} ; cargo $*"
