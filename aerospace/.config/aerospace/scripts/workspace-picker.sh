#!/usr/bin/env bash
# Fuzzy-pick a workspace and switch to it.
# Requires: brew install choose-gui (provides the `choose` binary)
set -e
sel=$(aerospace list-workspaces --all | choose)
[ -z "$sel" ] && exit 0
aerospace workspace "$sel"
